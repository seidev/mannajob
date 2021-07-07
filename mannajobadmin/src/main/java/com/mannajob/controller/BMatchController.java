package com.mannajob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.CriteriaProfile;
import com.mannajob.domain.EmplVO;
import com.mannajob.domain.MatchVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.PageDTO;
import com.mannajob.domain.locationDTO;
import com.mannajob.service.AdminService;
import com.mannajob.service.BMatchService;
import com.mannajob.service.CommService;
import com.mannajob.service.MatchService;
import com.mannajob.service.ProfileService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/bmatch/*")
@AllArgsConstructor
public class BMatchController {
	private BMatchService bMatchService;
	private ProfileService profileService;
	private AdminService adminService;
	private MatchService matchservice;
	private CommService commService;
	
	@GetMapping("/list")
	public String list(Model model, Criteria cri, BMatchVO bMatchVO) {
		if(bMatchVO.getB_category()==null) {
			bMatchVO.setB_category("");
		}
		int total = bMatchService.getTotalCount(cri,bMatchVO);
		model.addAttribute("list", bMatchService.getListWithPaging(cri,bMatchVO));
		model.addAttribute("page", new PageDTO(cri, total));
		System.out.println(cri);
		System.out.println(bMatchService.getListWithPaging(cri, bMatchVO));
		if(bMatchVO.getB_category().equals("A")) {
			return "/bmatch/listempl";
		}
		return "/bmatch/listmember";
	}
	
	// 댓글,대댓글 추가 필요, 현직자의 경우 현직자 정보 추가 필요.
	// 사진 출력 추가 필요
	@GetMapping("/view")
	public String view(BMatchVO bMatchVO, Model model, @ModelAttribute("cri") Criteria cri, HttpSession session) {
		System.out.println("..........................................." + session.getAttribute("userId"));
		model.addAttribute("bMatch", bMatchService.read(bMatchVO.getB_num()));
		model.addAttribute("commMain", commService.getList(bMatchVO.getB_num())); // 2020.11.23 매칭글 하위 질의응답(취준생) : 박세희
		if(bMatchVO.getB_category().equals("A")){
			EmplVO emplVO = profileService.getEmplProfile(bMatchVO.getM_id());
			model.addAttribute("empl", emplVO);
			model.addAttribute("profileImage",adminService.emplImage(emplVO.getE_num()));
			return "/bmatch/viewempl";
		}
		return "/bmatch/viewmember";
	}
	
	@GetMapping("/viewmember")
	public void viewmember() {
		
	}
	// 프로필에 대한 검색도 함께 포함되도록 추가
	@GetMapping("/search")
	public String search(@ModelAttribute("bMatch")BMatchVO bMatchVO, Model model, Criteria cri, CriteriaProfile scri,locationDTO location) {
		String lo = "";
		if(location.getLocation1()!=null) {
			lo+=location.getLocation1();
		}
		if(location.getLocation2()!=null) {
			lo+=" "+location.getLocation2();
		}
		if(location.getLocation3()!=null) {
			lo+=" "+location.getLocation3();
		}
		bMatchVO.setB_location(lo);
		cri.setAmount(10);
		int total = bMatchService.getTotalCount(cri,bMatchVO);
		model.addAttribute("list", bMatchService.searchWithPaging(bMatchVO, cri));
		model.addAttribute("page", new PageDTO(cri, total));
		//프로필 검색
		scri.setAmountP(5);
		int empltotal = bMatchService.getEmplCount(bMatchVO);
		model.addAttribute("empllist", bMatchService.searchEmplPaging(scri, bMatchVO));
		model.addAttribute("emplpage", new PageDTO(scri, empltotal));
		System.out.println("list:" + model.getAttribute("list") + "\npage: " + model.getAttribute("page"));
		System.out.println("empllist:" + model.getAttribute("empllist") + "\nemplpage: " + model.getAttribute("emplpage"));
		return "/bmatch/searchlist";
	}
	
	@GetMapping("/update")
	public String update(BMatchVO bMatchVO, Model model, @ModelAttribute("cri") Criteria cri,HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/login";
		}
		model.addAttribute("bMatch", bMatchService.read(bMatchVO.getB_num()));
		if(bMatchVO.getB_category().equals("A")){
			EmplVO emplVO = profileService.getEmplProfile(bMatchVO.getM_id());
			model.addAttribute("empl", emplVO);
			model.addAttribute("profileImage",adminService.emplImage(emplVO.getE_num()));
			return "/bmatch/updateempl";	
		}
		return "/bmatch/updatemember";
	}
	@PostMapping("/update")
	public String updateOk(BMatchVO bMatchVO, Model model, Criteria cri,locationDTO location) {
		log.info(location.toString());
		String lo = "";
		if(location.getLocation1()!=null) {
			lo+=location.getLocation1();
		}
		if(location.getLocation2()!=null) {
			lo+=" "+location.getLocation2();
		}
		if(location.getLocation3()!=null) {
			lo+=" "+location.getLocation3();
		}
		bMatchVO.setB_location(lo);
		bMatchService.update(bMatchVO);
		return "redirect:/bmatch/view?b_category="+bMatchVO.getB_category()+"&b_num="+bMatchVO.getB_num()+"&m_id="+bMatchVO.getM_id()+"&pageNum="+cri.getPageNum();
	}
	@GetMapping("/delete")
	public String delete(BMatchVO bMatchVO, Criteria cri, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}else {
			bMatchService.delete(bMatchVO.getB_num());
		}
		return "redirect:/bmatch/list?b_category="+bMatchVO.getB_category();
	}
	@Transactional
	@GetMapping("/cancel")
	public String cancel(BMatchVO bMatchVO, Criteria cri, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}else {
			if(matchservice.matchfinalCount(bMatchVO.getB_num())) {
				MatchVO matchVO = matchservice.findfinalMat(bMatchVO.getB_num());
				matchservice.reject(matchVO);
			}
			bMatchService.cancel(bMatchVO.getB_num());
		}
		return "redirect:/match/matlist";
	}
	
	@GetMapping("/insert")
	public String insert(@ModelAttribute("cri") Criteria cri, Model model, HttpSession session, @ModelAttribute("bmatch") BMatchVO bMatchVO,RedirectAttributes rttr) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/login";	
		}
		String m_id = session.getAttribute("userId").toString();
		if("A".equals(bMatchVO.getB_category())) {
			if(profileService.cheakEmpl(m_id)) {
				model.addAttribute("m_id",m_id);
				model.addAttribute("empl", profileService.getEmplProfile2(m_id));
				return "bmatch/insertBmatchEmpl";
			}else {
				rttr.addFlashAttribute("error", 1);
				return "redirect:/profile/empl";
			}
		}
		else {
			model.addAttribute("m_id",m_id);
			return "bmatch/insertBmatchMember";		
		}	
	}
	
	@PostMapping("/insert")
	public String insertOk(BMatchVO bmatch , @ModelAttribute("cri") Criteria cri, Model model, HttpSession session, locationDTO location) {
		String lo = "";
		if(location.getLocation1()!=null) {
			lo+=location.getLocation1();
		}
		if(location.getLocation2()!=null) {
			lo+=" "+location.getLocation2();
		}
		if(location.getLocation3()!=null) {
			lo+=" "+location.getLocation3();
		}
		bmatch.setB_location(lo);
		bmatch.setM_id(session.getAttribute("userId").toString());
		bMatchService.insert(bmatch);
		return "redirect:/bmatch/list?b_category="+bmatch.getB_category();
	}
	@PostMapping("sendEmail")
	public String sendEmail(Model model, String m_id, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			model.addAttribute("result", 3);
			return"/bmatch/sendemail";
		}
		String send_id = session.getAttribute("userId").toString();
		if(profileService.cheakEmpl(send_id)==false) {
			model.addAttribute("result", 2);
			return"/bmatch/sendemail";
		}
		MemberVO sendmember = profileService.getMemProfile(send_id);
		EmplVO sendEmpl = profileService.getEmplProfile(send_id);
		model.addAttribute("result", 1);
		MemberVO responmember = profileService.getMemProfile(m_id);
		model.addAttribute("tomail", responmember.getM_email());
		model.addAttribute("title", "[만나잡] "+ sendEmpl.getE_corp()+"에서 입사 제의가 들어왔습니다.");
		String content = responmember.getM_name() + "님 \n";
    	content += sendEmpl.getE_corp()+"의 "+sendEmpl.getE_dept()+"에서 근무중인 "+ sendmember.getM_id() + "님께서\n";
		content +=  "회사의 입사 제의를 하셨습니다.\n";
		content +=  "회사와 부서에 관심이 있다면 아래의 이메일로 연락을 주세요.\n";
		content += "\n";
		content += "\n";
		content += "\n";
		content += "\n";
		content += sendmember.getM_email();
		model.addAttribute("content", content);
		model.addAttribute("url" , "/bmatch/sendemail");
		return "redirect:/mailSending.do";
		
	}
}
