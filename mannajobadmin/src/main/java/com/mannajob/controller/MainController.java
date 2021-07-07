package com.mannajob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mannajob.domain.BMatchVO;
import com.mannajob.domain.Criteria;
import com.mannajob.domain.EmplVO;
import com.mannajob.service.BMatchService;
import com.mannajob.service.MainService;
import com.mannajob.service.NoticeService;
import com.mannajob.service.ProfileService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@AllArgsConstructor
public class MainController {
	private NoticeService noticeService;
	private BMatchService bMatchService;
	private ProfileService profileService;
	private MainService mainService;
	
	
	//우수회원 공유 추가
	@RequestMapping("/main")
	public void main(Model model, BMatchVO bMatchVO, EmplVO empVO, Criteria cri) {
		cri.setAmount(3);
		model.addAttribute("good", mainService.bestMento());
		model.addAttribute("notice",noticeService.getList(cri));
		bMatchVO.setB_category("A");
		model.addAttribute("empl_bmatch",bMatchService.getListWithPaging(cri, bMatchVO));
		bMatchVO.setB_category("B");
		model.addAttribute("mem_bmatch",bMatchService.getListWithPaging(cri, bMatchVO));
	}
}
