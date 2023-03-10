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
import com.edu.springboot.jdbc.ISupportsService;

@Controller
public class AdminController {
	
	@Autowired
	ISupportsService daoo;
	
	@RequestMapping("/admin/index.do")
	public String admin() {
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
	
	@RequestMapping("/admin/delete.do")
	public String delete(HttpServletRequest req, HttpSession session, Principal principal) {
		//삭제는 본인만 가능하므로 로그인 확인을 진행한다.
		String email = principal.getName();
		session.setAttribute("siteUserInfo", email);
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:/myLogin.do";
		}
		int applyRow = daoo
				.delete(req.getParameter("idx"),
						email);
						
		System.out.println("삭제된 행의 갯수 : " + applyRow);
		
		return "redirect:/admin/index.do";
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
