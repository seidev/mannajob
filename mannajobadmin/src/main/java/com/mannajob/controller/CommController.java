package com.mannajob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mannajob.domain.CommVO;
import com.mannajob.service.CommService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/comm/*")
@AllArgsConstructor
public class CommController {
	private CommService service;
	
	@PostMapping("/insert")
	public String insert(CommVO comm, HttpServletRequest request) {
		log.info("insert >>> " + comm);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.insert(comm);
			return "/bmatch/viewempl";
		}
	}
	
	@PostMapping("/insertSub")
	public String insertSub(CommVO comm, HttpServletRequest request) {
		log.info("insertSub >>> " + comm);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.insertSub(comm);
			return "/bmatch/viewempl";
		}
	}
	
	@PostMapping("/update")
	public String update(CommVO comm, HttpServletRequest request) {
		log.info("update >>> " + comm);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.update(comm);
			return "/bmatch/viewempl";
		}
	}
	
	@PostMapping("/updateSub")
	public String updateSub(CommVO comm, HttpServletRequest request) {
		log.info("updateSub >>> " + comm);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.updateSub(comm);
			return "/bmatch/viewempl";
		}
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("cm_num") int cm_num, HttpServletRequest request) {
		log.info("delete............................");
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.delete(cm_num);
			return "/bmatch/viewempl";
		}
	}
	
	@PostMapping("/deleteSub")
	public String deleteSub(@RequestParam("cms_num") int cms_num, HttpServletRequest request) {
		log.info("deleteSub............................");
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		} else {
			service.deleteSub(cms_num);
			return "/bmatch/viewempl";
		}
	}
}
