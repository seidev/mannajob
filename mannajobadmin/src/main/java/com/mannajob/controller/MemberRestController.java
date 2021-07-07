package com.mannajob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mannajob.domain.MemberVO;
import com.mannajob.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/rest/*")
@AllArgsConstructor
public class MemberRestController {
	private MemberService service;
	
	@PostMapping (value = "/logincheck",produces = MediaType.APPLICATION_JSON_VALUE)
	public String login(MemberVO member, HttpServletRequest request, HttpSession session) {
		if(service.LoginSelect(member)) {
			log.info(member.getM_id());
			session.setAttribute("userId", member.getM_id());
			return "1"; 
		} else {
			log.info(member.getM_id());
			return "2";
		}
	}

}
