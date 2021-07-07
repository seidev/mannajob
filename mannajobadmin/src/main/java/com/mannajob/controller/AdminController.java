package com.mannajob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.EmplFileVO;
import com.mannajob.domain.PageDTO;
import com.mannajob.domain.SearchVO;
import com.mannajob.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	private AdminService service; 
	
	@GetMapping("/manage")
	public String manage(Model model, Criteria cri, SearchVO search) {
		int total = service.getTotal(cri, search);
		model.addAttribute("memlist", service.getMemListWithPaging(cri, search));
		model.addAttribute("mempageMaker", new PageDTO(cri, total));
		model.addAttribute("searchType", search.getSearchType());
		model.addAttribute("keyword", search.getKeyword());
		return "/admin/manage";
	}
	
	@GetMapping("/reset")
	public String resetPasswd(String m_id) {
		service.resetPasswd(m_id);
		return "redirect:/admin/manage";
	}

	@GetMapping("/check")
	public String check(Criteria cri, SearchVO search, Model model) {
		
		int total = service.getemplTotal(search);
		model.addAttribute("empllist", service.getEmplListWithPaging(cri, search));
		model.addAttribute("emplpageMaker", new PageDTO(cri, total));
		model.addAttribute("searchType", search.getSearchType());
		model.addAttribute("keyword", search.getKeyword());
		return "/admin/check";
	}

	@GetMapping("/emplOk")
	public String emplOk(int e_num) {
		service.emplOk(e_num);
		return "redirect:/admin/check";
	}
	
	@GetMapping("/emplapply")
	public void emplapply(int e_num, HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		
		EmplFileVO emplfileVO = service.emplApply(e_num);
		model.addAttribute("emplFile", emplfileVO);
		model.addAttribute("profile",emplfileVO.getStored_file_name());
		System.out.println(emplfileVO.toString());
	}
	
	@GetMapping("/certif")
	public void certif(HttpServletRequest request, @RequestParam("e_num") int e_num, Model model) {
		model.addAttribute("emplCertif",  service.emplImage(e_num));
	}
}
