package com.edu.springboot;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.CategoryService;

@Controller
public class MainContoller {

	@Autowired 
	IMemberService dao;
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
			
			String idx = dao.idx(email);
			session.setAttribute("idx", idx);
			System.out.println(session.getAttribute("idx"));
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
	
	@Autowired
	CategoryService cate_dao;
	
	@RequestMapping("/product_insert")
	public String ticket_insert1(Model model, HttpServletRequest req) {
		int sub_idx=0;
		if(!(req.getParameter("sub_idx")==null)) {
			sub_idx = Integer.parseInt(req.getParameter("sub_idx"));
		}
		model.addAttribute("cate",cate_dao.select_cate(sub_idx));
		return "/product_insert";
	}
}
