package com.mannajob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mannajob.domain.MatchVO;
import com.mannajob.service.MatchService;
import com.mannajob.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {
	private ReviewService service;
	private MatchService matchservice;
	
	//글 작성 내역에서 리뷰 작성
	@GetMapping("/insertB")
	public void insertB(Model model, HttpServletRequest request, int b_num) {
		HttpSession session = request.getSession();
		MatchVO matchVO = matchservice.findfinalMat(b_num);
		model.addAttribute("mat_num", matchVO.getMat_num());
		model.addAttribute("r_w_m_id", session.getAttribute("userId"));
		
		model.addAttribute("r_mat_m_id",matchVO.getM_id());
	}
	
	//매칭 신청 내역에서 리뷰 작성
	@GetMapping("/insertM")
	public void insertM(Model model, HttpServletRequest request, int mat_num, String r_mat_m_id) {
		HttpSession session = request.getSession();
		model.addAttribute("mat_num", mat_num);
		model.addAttribute("r_w_m_id", session.getAttribute("userId"));
		model.addAttribute("r_mat_m_id", r_mat_m_id);
	}
	
	@PostMapping("/insertok")
	public String insertok(int mat_num, String r_good, String r_contents, String r_w_m_id, String r_mat_m_id) {
		service.insertR(mat_num, r_good, r_contents, r_w_m_id, r_mat_m_id);
		return "redirect:/match/matlist";
	}
	
	//매칭 내역 관리에서 리뷰 수정
	@GetMapping("/update")
	public void update(Model model, int r_num, String r_contents, String r_mat_m_id) {
		model.addAttribute("r_num", r_num);
		model.addAttribute("r_contents", r_contents);
		model.addAttribute("r_mat_m_id", r_mat_m_id);
	}
	
	@PostMapping("/updateok")
	public String updateok(int r_num, String r_good, String r_contents) {
		service.updateR(r_num, r_good, r_contents);
		return "redirect:/match/matlist";
		
	}

	//현직자 프로필에서 수정
	@GetMapping("/updatee")
	public void updatee(Model model, int r_num, String r_contents) {
		model.addAttribute("r_num", r_num);
		model.addAttribute("r_contents", r_contents);
	}
	
	@PostMapping("/updateokk")
	public String updateokk(int r_num, String r_good, String r_contents) {
		service.updateR(r_num, r_good, r_contents);
		String emplId = service.searchId(r_num);
		return "redirect:/profile/showempl?m_id=" + emplId;
		
	}
	
	//회원 프로필에서 수정
	@GetMapping("/updatem")
	public void updatem(Model model, int r_num, String r_contents) {
		model.addAttribute("r_num", r_num);
		model.addAttribute("r_contents", r_contents);
	}
	
	@PostMapping("/updatemok")
	public String updatemok(int r_num, String r_good, String r_contents) {
		service.updateR(r_num, r_good, r_contents);
		String memId = service.searchId(r_num);
		return "redirect:/profile/showmem?m_id=" + memId;
		
	}
	
	//매칭 내역 관리에서 리뷰 삭제(상태 변경)
	@GetMapping("/delete")
	public String delete(int r_num) {
		service.deleteR(r_num);
		return "redirect:/match/matlist";
	}
	
	//현직자 프로필에서 삭제
	@GetMapping("/deletee")
	public String deletee(int r_num) {
		service.deleteR(r_num);
		String emplId = service.searchId(r_num);
		return "redirect:/profile/showempl?m_id=" + emplId;
	}
	
	//회원 프로필에서 삭제
	@GetMapping("/deletem")
	public String deletem(int r_num) {
		service.deleteR(r_num);
		String memId = service.searchId(r_num);
		return "redirect:/profile/showmem?m_id=" + memId;
	}
}
