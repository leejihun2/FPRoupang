package com.edu.springboot;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainContoller {

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/myLogin.do")
	public String login1(Principal principal, Model model, HttpSession session) {
		try {
			String email = principal.getName();
			model.addAttribute("user_id", email);
			session.setAttribute("siteUserInfo", email);
		}
		catch (Exception e) {
			System.out.println("로그인 전입니다.");
		}
		return "auth/login";
	}
	
	@RequestMapping("/myError.do")
	public String login2() {		
		return "auth/error";
	}

	@RequestMapping("/denied.do")
	public String login3() {		
		return "auth/denied";
	}
	
	@RequestMapping("/ticketView")
	public String move1() {
		return "/ticket/ticketView";
	}
}
