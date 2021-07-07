package com.mannajob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mannajob.domain.Criteria;
import com.mannajob.domain.PageDTO;
import com.mannajob.domain.QnaVO;
import com.mannajob.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {
	private QnaService service;
	
	@GetMapping("/list2")
	public void list(Model model) {
		log.info("list2..............");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list paging...............");
		int total = service.getTotal(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/insert")
	public String insert(HttpServletRequest request) {
		log.info("insert...............");
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		return "/qna/insert";
	}
	
	@PostMapping("/insert")
	public String insert(QnaVO qna, HttpServletRequest request) {
		log.info("insert >>> " + qna);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.insert(qna);
			return "redirect:/qna/list";
		}
	}
	
	@PostMapping("/insertSub")
	public String insertSub(QnaVO qna, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		log.info("insertSub >>> " + qna);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.insertSub(qna);
			return "redirect:/qna/view?q_num=" + qna.getQ_num() + "&pageNum=" + cri.getPageNum();
		}
	}
	
	@GetMapping("/view")
	public String view(@RequestParam("q_num") int q_num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("view.....................");
		QnaVO qna = service.read(q_num);
		qna.setQ_contents(qna.getQ_contents().replace("\r\n", "<br>"));
		//model.addAttribute("qna", service.read(q_num));
		model.addAttribute("qna", qna);
		model.addAttribute("reply_chk",service.chkQnaSub(q_num));
		return "/qna/view";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam("q_num") int q_num, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request) {
		log.info("update.....................");
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		model.addAttribute("qna", service.read(q_num));
		return "/qna/update";
	}
	
	@PostMapping("/update")
	public String update(QnaVO qna, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request) {
		log.info("update >>> " + qna);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.update(qna);
			return "redirect:/qna/view?q_num=" + qna.getQ_num() + "&pageNum=" + cri.getPageNum();
		}
	}
	
	@PostMapping("/updateSub")
	public String updateSub(QnaVO qna, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request) {
		log.info("updateSub >>> " + qna);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.updateSub(qna);
			return "redirect:/qna/view?q_num=" + qna.getQ_num() + "&pageNum=" + cri.getPageNum();
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("q_num") int q_num, HttpServletRequest request) {
		log.info("delete............................");
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.delete(q_num);
			return "redirect:/qna/list";
		}
	}
	
	@PostMapping("/deleteSub")
	public String deleteSub(QnaVO qna, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request) {
		log.info("deleteSub >>> " + qna);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.deleteSub(qna);
			return "redirect:/qna/view?q_num=" + qna.getQ_num() + "&pageNum=" + cri.getPageNum();
		}
	}
}
