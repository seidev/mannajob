package com.mannajob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.CriteriaProfile;
import com.mannajob.domain.MatchVO;
import com.mannajob.domain.MemberVO;
import com.mannajob.domain.PageDTO;
import com.mannajob.service.BMatchService;
import com.mannajob.service.MatchService;
import com.mannajob.service.ProfileService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/match/*")
@AllArgsConstructor
public class MatchController {
	@Setter(onMethod_ = @Autowired)
	private MatchService service;
	private BMatchService bmatchservice;
	private ProfileService profileservice;
	
	@GetMapping("/match")
	public String insert(@ModelAttribute("b_num") int b_num, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			model.addAttribute("error", "1");
			return "/match/matchrequest";
		}
		return "/match/matchrequest";
	}
	@Transactional
	@PostMapping("insert")
	public String insert(MatchVO matchVO, HttpSession session ,Model model) {
		matchVO.setM_id(session.getAttribute("userId").toString());
		log.info(matchVO.toString());
		if(service.insert(matchVO)) {
			model.addAttribute("result", 1);
			BMatchVO bmatch = bmatchservice.read(matchVO.getB_num());
			MemberVO member = profileservice.getMemProfile(bmatch.getM_id());
			model.addAttribute("tomail", member.getM_email());
			model.addAttribute("title", "[만나잡] 매칭 요청이 도착했습니다.");
			String content = member.getM_name() + "님 \n";
        	content += matchVO.getM_id() + "님께서\n";
			content += matchVO.getMat_stdate() + "\n";
			content += matchVO.getMat_hour() + "에 매칭을 요청을 하였습니다.\n";
			content += "마이페이지를 확인해주세요 \n";
			content += "http://175.205.193.91:13580/main\n";
			model.addAttribute("content", content);
			model.addAttribute("url" , "/match/insert");
			return "redirect:/mailSending.do";
		}else {
			model.addAttribute("result", 2);
			return "/match/insert";
		}
	}
	@Transactional
	@PostMapping("matchok")
	public String matchok(MatchVO matchVO) {
		service.finish(matchVO);
		bmatchservice.StateChange(matchVO.getB_num(), 1);
		return "redirect:/match/matlist";
		
	}
	@GetMapping("cancel")
	public void cancel(@ModelAttribute("mat_num") int mat_num) {
		
	}
	@PostMapping("cancel")
	public String cancelok(MatchVO matchVO) {
		service.cancel(matchVO);
		return "redirect:/match/matlist";
	}
	
	@GetMapping("/matlist")
	public String matlist(Model model, HttpServletRequest request,Criteria cri,CriteriaProfile scri) {
		scri.setAmountP(5);
		cri.setAmount(5);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId")==null) {
			return "redirect:/main";
		}
		String m_id = session.getAttribute("userId").toString(); 
		int wtotal = bmatchservice.getPersonTotalCount(m_id);
		model.addAttribute("userId", m_id);
		model.addAttribute("wmatlist", service.searchWMat(m_id,cri));
		model.addAttribute("pageWmat", new PageDTO(cri, wtotal));
		
		int mtotal = service.getPersionTotalCount(m_id);
		model.addAttribute("matlist", service.searchMat(m_id,scri));
		model.addAttribute("pageMat", new PageDTO(scri, mtotal));
		
		System.out.println("userId" + model.getAttribute("userId"));
		System.out.println("wmatlist" + model.getAttribute("wmatlist"));
		System.out.println("matlist" + model.getAttribute("matlist"));
		return "match/matlist";
	}
	
	@GetMapping("/bmatlist")
	public void bmatlist(Model model, @ModelAttribute("b_num")int b_num) {
		model.addAttribute("matchlist", service.searchBmatMat(b_num));
		
	
	}
	
}
