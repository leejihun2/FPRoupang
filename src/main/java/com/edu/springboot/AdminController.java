package com.edu.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/admin/index.do")
	public String admin() {
		return "admin/index";
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
	@RequestMapping("/admin/blank.do")
	public String blank() {
		return "admin/blank";
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
