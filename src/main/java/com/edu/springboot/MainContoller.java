package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.SellRightDTO;
import com.edu.springboot.jdbc.CategoryService;


@Controller
public class MainContoller {

	@Autowired 
	IMemberService member_dao;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/myLogin.do")
	public String login1(Principal principal, Model model, HttpSession session) {
		try {
			String email = principal.getName();
			if(session.getAttribute("siteUserInfo")!=null)
			{
				return "redirect:/";
			}
			
			model.addAttribute("user_id", email);
			session.setAttribute("siteUserInfo", email);
		    
			
			String idx = member_dao.idx(email);
			session.setAttribute("idx", idx);
			System.out.println(session.getAttribute("idx"));
		}
		catch (Exception e) {}
		
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
	@RequestMapping("/productInsert")
	public String ticket_insert2(Principal principal, Model model, HttpServletRequest req) {
		int sub_idx=0;
		
		if(!(req.getParameter("sub_idx")==null)) {
			sub_idx = Integer.parseInt(req.getParameter("sub_idx"));
		}
		
		String loginId = principal.getName();
		
		if(!(loginId.equals("admin"))) {
			SellRightDTO dto  = member_dao.LoginUser(loginId);
			dto  = member_dao.LoginSeller(dto.getMember_idx());
			model.addAttribute("member_idx",dto.getMember_idx());
			model.addAttribute("company_name", dto.getCompany_name());
		}

		model.addAttribute("cate",cate_dao.select_cate(sub_idx));
		
		return "/admin/productInsert";
	}
	
}
