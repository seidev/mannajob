package com.mannajob.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mannajob.domain.BMatchVO;
import com.mannajob.service.BMatchService;
import com.mannajob.service.MatchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/chart/*")
@AllArgsConstructor
public class ChartController {
	private MatchService matchservice;
	private BMatchService bmatchservice;
	@GetMapping("/chart_cnt")
	public void chart_cnt(Model model) {
		int max=0;
		for(int i=-3; i<=3; i++) {
			int match = matchservice.getDailycount(i);
			if(match > max) {
				max = match;
			}
			int bmatch = bmatchservice.getDailycount(i);
			if(bmatch>max) {
				max= bmatch;
			}
			model.addAttribute("match"+(i+4),match);
			model.addAttribute("bmatch"+(i+4),bmatch);
		}
		model.addAttribute("max", max);
		log.info(model);
	}
	
	@GetMapping("/chart_field")
	public void chart_field(Model model) {
		int max_corp=0;
		int max_location=0;
		int max_task=0;
		List<BMatchVO> corp= bmatchservice.rankCorp();
		List<BMatchVO> location = bmatchservice.rankLocation();
		List<BMatchVO> task = bmatchservice.rankTask();
		for(int i=0; i<5; i++) {
			 if(max_corp < corp.get(i).getCnt()) {
				 max_corp = corp.get(i).getCnt();
			 }
			 if(max_location < location.get(i).getCnt()) {
				 max_location = location.get(i).getCnt();
			 }
			 if(max_task < task.get(i).getCnt()) {
				 max_task = task.get(i).getCnt();
			 }
		}
		model.addAttribute("maxcorp", max_corp);
		model.addAttribute("maxlocation", max_location);
		model.addAttribute("maxtask", max_task);
		model.addAttribute("rankCorp", corp);
		model.addAttribute("rankLocation", location);
		model.addAttribute("rankTask", task);
	}
}
