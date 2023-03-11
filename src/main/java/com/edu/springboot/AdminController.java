package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.jdbc.SupportsDTO;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.ISupportsService;
import com.edu.springboot.jdbc.SellRightDTO;

@Controller
public class AdminController {
	
	@Autowired
	ISupportsService daoo;

	@Autowired
	IMemberService member_dao;
	
	@RequestMapping("/admin/index.do")
	public String admin(Principal principal,HttpSession session) {
		String loginId = principal.getName();
		String member_idx = member_dao.member_idx(loginId);

		SellRightDTO dto  = member_dao.LoginUser(member_idx);
		String Authority = dto.getAuthority();

		if(Authority.equals("Seller"))
		{
			return "redirect:/productInsert";
		}
		
		return "/admin/index";
	}
	@RequestMapping("/admin/adminFaq.do")
	public String adminFaq(Model model, HttpServletRequest req) {
		String category = req.getParameter("categoryCode");
		int totalRecordCount = 
				daoo.getTotalCountSearch("faq",category);
		
		ArrayList<SupportsDTO> lists = 
				daoo.listPageSearch("faq",category);
		
		for (SupportsDTO dto : lists) {
			String temp = dto.getContents()
					.replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		
		model.addAttribute("lists", lists);
		return "admin/adminFaq";
	}
	@RequestMapping("/admin/adminNotice.do")
	public String blank1(Model model, HttpServletRequest req) {
		String category = req.getParameter("categoryCode");
		int totalRecordCount = 
				daoo.getTotalCountSearch("notice",category);
		
		ArrayList<SupportsDTO> lists = 
				daoo.listPageSearch("notice",category);

		for (SupportsDTO dto : lists) {
			System.out.println("나 동작");
			String temp = dto.getContents()
					.replace("\r\n", "<br/>");
			dto.setContents(temp);
			System.out.println("콘텐츠 >>>>> "+dto.getContents());
		}
		
		model.addAttribute("lists", lists);
		return "admin/adminNotice";
	}
	
	@RequestMapping("/admin/utilities-color.do")
	public String utilities1() {
		return "admin/utilities-color";
	}
	@RequestMapping("/admin/utilities-animation.do")
	public String utilities2() {
		return "admin/utilities-animation";
	}
	@RequestMapping("/admin/utilities-border.do")
	public String utilities3() {
		return "admin/utilities-border";
	}
	@RequestMapping("/admin/utilities-other.do")
	public String utilities4() {
		return "admin/utilities-other";
	}
	@RequestMapping("/admin/tables.do")
	public String tables() {
		return "admin/tables";
	}
	@RequestMapping("/admin/charts.do")
	public String charts() {
		return "admin/charts";
	}
	@RequestMapping("/admin/buttons.do")
	public String buttons() {
		return "admin/buttons";
	}
	@RequestMapping("/admin/cards.do")
	public String cards() {
		return "admin/cards";
	}
	@RequestMapping("/admin/404.do")
	public String error() {
		return "admin/404";
	}
	@RequestMapping("/admin/login.do")
	public String login() {
		return "admin/login";
	}
	@RequestMapping("/admin/register.do")
	public String register() {
		return "admin/register";
	}
	@RequestMapping("/admin/forgot-password.do")
	public String password() {
		return "admin/forgot-password";
	}
	
}
