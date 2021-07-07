package com.mannajob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.ComplVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.PageDTO;
import com.mannajob.domain.SearchVO;
import com.mannajob.service.BMatchService;
import com.mannajob.service.ComplService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/compl/*")
@AllArgsConstructor
public class ComplController {
	private ComplService service;
	private BMatchService bmatchservice;
	
//	아이디, b_num, c_category 받음
	@GetMapping("/insert")
	public String compl(BMatchVO bMatchVO, Model model) {
		model.addAttribute("bmatch", bMatchVO);
		return "/bmatch/compl";
	}
	@PostMapping("/insert")
	public String compl(ComplVO complVO, Model model,RedirectAttributes rttr, @ModelAttribute("b_category")String b_category) {
		service.insert(complVO);
		rttr.addFlashAttribute("result", 1);
		return "redirect:/bmatch/view?b_num="+complVO.getBoard_num()+"&b_category="+b_category+"&m_id="+complVO.getM_id();
	};
	
	@GetMapping("/manage")
	public String manage(Model model,Criteria cri, SearchVO search) {
		int total = service.getTotal(cri, search);
		
		model.addAttribute("compllist", service.getComplListWithPaging(cri, search));
		model.addAttribute("mempageMaker", new PageDTO(cri, total));
		model.addAttribute("searchType", search.getSearchType());
		model.addAttribute("keyword", search.getKeyword());
		return "/compl/manage";
	}
	
	@GetMapping("moveboard")
	public String moveboard(Model model, int board_num) {
		BMatchVO bmatchVO = bmatchservice.read(board_num);
		return "redirect:/bmatch/view?b_category="+bmatchVO.getB_category()+"&b_num="+bmatchVO.getB_num()+"&m_id="+bmatchVO.getM_id();
	}
	
	@Transactional
	@GetMapping("stopdate")
	public String stopdate(Model model, String m_id, int c_num, String c_state, RedirectAttributes rttr) {
		service.stopdate(m_id);
		service.changestate(c_num, c_state);
		rttr.addFlashAttribute("result", 1);
		return "redirect:/compl/manage";
	}
	
	@Transactional
	@GetMapping("statechange")
	public String statechange(Model model, int c_num, String c_state, RedirectAttributes rttr) {
		service.changestate(c_num, c_state);
		rttr.addFlashAttribute("result", 1);
		return "redirect:/compl/manage";
	}
	
	
	
}
