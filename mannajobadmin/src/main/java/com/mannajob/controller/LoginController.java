package com.mannajob.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mannajob.domain.NaverLoginBO;
import com.mannajob.service.KakaoService;
import com.mannajob.service.LoginService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private LoginService service;
	
	@Autowired
    private KakaoService kakao;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	


	//
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		// 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		model.addAttribute("naverurl", naverAuthUrl);
		
		String kakaoAuthUrl = "https://kauth.kakao.com/oauth/authorize?client_id=2ac1c0b75032a241c45fa9363396eaf0&redirect_uri=http://192.168.0.225:8080/redirect&response_type=code";
		model.addAttribute("kakaourl", kakaoAuthUrl);
		
		if(session.getAttribute("userId") == null) {
			return "login";
		}
		
		return "main";
	}

	//네이버 로그인 콜백
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("callback ȣ��");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 
		apiResult = naverLoginBO.getUserProfile(oauthToken); // 
		/**
		 * apiResult json {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		//2.
		System.out.println(apiResult);
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 
		//
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		//
		String id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		
		//
		String api = "n";
		
//		System.out.println(check);
		//id, email
		System.out.println("id: " + id + "\nemail: " + email);
		//4.
		session.setAttribute("sessionId", id); //
		session.setAttribute("useremail", email);
		session.setAttribute("userapi", api);
		
		model.addAttribute("result", apiResult);
		
		
		int check = service.MemCheck(id);
		if(check == 0) {
			model.addAttribute("userapi", api);
			return "/join/member_agree";
		} else {
			session.setAttribute("uesrId", id); //
			return "redirect:/main";
		}
	}
	
	//카카오 로그인 콜백
	@RequestMapping(value = "/redirect")
	public String login(@RequestParam("code") String code, HttpSession session, Model model) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    session.setAttribute("sessionId", userInfo.get("sessionId"));
	    session.setAttribute("userapi", userInfo.get("api"));
	    session.setAttribute("access_Token", access_Token);
	    session.setAttribute("code", code);

	    String s_id = userInfo.get("sessionId").toString();
	    
	    int check = service.MemCheck(s_id);
	    // Ŭ���̾�Ʈ�� �̸��� ���� ��� �Է� ��������
	    log.info(check);
	    if(check == 0){
	    	model.addAttribute("userapi", userInfo.get("api"));
	    	return "redirect:/join/member_agree";
	    }
	    session.setAttribute("userId", userInfo.get("sessionId"));
	    return "redirect:/main";
	} 
	
}