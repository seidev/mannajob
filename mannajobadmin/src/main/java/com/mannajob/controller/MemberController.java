package com.mannajob.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mannajob.domain.MemberVO;
import com.mannajob.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	
	@PostMapping ("/logincheck")
	public String login(MemberVO member, HttpServletRequest request, HttpSession session) {
		if(service.SecretLogin(member)) {
			log.info("로그인 성공!!!!");
			session.setAttribute("userId", member.getM_id());
			return "redirect:/main"; 
		} else {
			log.info("로그인 실패!!!!");
			return "redirect:/login";
		}
	}

	
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/login";
	}
}