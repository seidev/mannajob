package com.mannajob.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mannajob.domain.MyScheduleVO;
import com.mannajob.service.MatchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MypageController {
	private MatchService matchservice;
	
	
    @GetMapping("/calendar")
	public String calendar(Model model,HttpSession session, String yearmonth) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/login";
		}
		String m_id = session.getAttribute("userId").toString();
		log.info(yearmonth);
		model.addAttribute("list1", matchservice.getListBMatch(m_id,yearmonth));
		model.addAttribute("list2", matchservice.getListMatch(m_id,yearmonth));
		return "/mypage/calendar";
	}
    
    @ResponseBody
	@RequestMapping(value="/calendar", method= RequestMethod.GET,produces =  MediaType.APPLICATION_JSON_VALUE)
	public HashMap<String, List<MyScheduleVO>> calendardate(Model model,HttpSession session, String yearmonth) {
		String m_id = session.getAttribute("userId").toString();
		log.info(yearmonth);
		HashMap<String, List<MyScheduleVO>> map = new HashMap<String, List<MyScheduleVO>>();
		map.put("list1", matchservice.getListBMatch(m_id,yearmonth));
		map.put("list2", matchservice.getListMatch(m_id,yearmonth));
		return map;
	}
}
