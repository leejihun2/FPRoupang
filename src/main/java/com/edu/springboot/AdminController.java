package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.SupportsDTO;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.ISupportsService;
import com.edu.springboot.jdbc.JourneyInfoDTO;
import com.edu.springboot.jdbc.ParameterSupportsDTO;
import com.edu.springboot.jdbc.SellRightDTO;

@Controller
public class AdminController {

	@Autowired
	ISupportsService daoo;

	@Autowired
	IMemberService member_dao;

	@RequestMapping("/admin/index.do")
	public String admin(Principal principal, HttpSession session) {

		String loginId = principal.getName();

		SellRightDTO dto = member_dao.LoginUser(loginId);

		String Authority = dto.getAuthority();

		if (Authority.equals("ROLE_seller")) {
			return "redirect:/productInsert";
		} else {
			return "/admin/index";
		}
	}

	@RequestMapping("/admin/adminfaq.do")
	public String adminFaq(Model model, HttpServletRequest req) {
		String category = req.getParameter("categoryCode");
		String contact = req.getParameter("contact");

		ArrayList<SupportsDTO> lists = daoo.listPageSearch("faq", category);

		for (SupportsDTO dto : lists) {
			String temp = dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}

		model.addAttribute("contact", contact);
		model.addAttribute("category", category);
		model.addAttribute("lists", lists);
		return "admin/adminFaq";
	}

	@RequestMapping("/admin/adminnotice.do")
	public String blank1(Model model, HttpServletRequest req) {
		String category = req.getParameter("categoryCode");

		ArrayList<SupportsDTO> lists = daoo.listPageSearch("notice", category);

		for (SupportsDTO dto : lists) {
			String temp = dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}

		model.addAttribute("lists", lists);
		return "admin/adminNotice";
	}

	@RequestMapping("/admin/delete.do")
	public String delete(HttpServletRequest req, HttpSession session, Principal principal) {
		String email = principal.getName();
		session.setAttribute("siteUserInfo", email);
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:/myLogin.do";
		}
		int applyRow = daoo.delete(req.getParameter("idx"), email);

		System.out.println("삭제된 행의 갯수 : " + applyRow);

		return "redirect:/admin/index.do";
	}

	@RequestMapping("/admin/writeSupports.do")
	public String writeSupports(Model model, HttpSession session, HttpServletRequest req, Principal principal) {

		return "/admin/writeSupports";
	}

	@RequestMapping(value = "/admin/writeSupportsAction.do", method = RequestMethod.POST)
	public String writeSupportsAction(Model model, HttpServletRequest req, HttpSession session, Principal principal) {

		String email = principal.getName();
		int applyRow = daoo.writeSupports(req.getParameter("title"), email, req.getParameter("contents"),
						req.getParameter("categorycode"), req.getParameter("contact"));
		
		System.out.println("입력된행의갯수:" + applyRow);

		return "redirect:/admin/index.do";
	}

	@RequestMapping("/admin/modify.do")
	public ModelAndView modify(Model model, HttpServletRequest req, HttpSession session, SupportsDTO supportsDTO) {

		int idx = Integer.parseInt(req.getParameter("idx"));

		ModelAndView mv = new ModelAndView();

		SupportsDTO dto = daoo.view(idx);

		mv.addObject("dto", dto);
		mv.setViewName("/admin/modify");
		return mv;
	}

	@RequestMapping("/admin/modifyAction.do")
	public String modifyAction(Model model, HttpSession session, SupportsDTO supportsDTO, HttpServletRequest req) {

		String idxStr = req.getParameter("idx");
		if (idxStr == null) {
			return "error";
		}

		int idx = Integer.parseInt(idxStr);
		SupportsDTO dto = new SupportsDTO();
		dto.setIdx(idx);
		dto.setTitle(req.getParameter("title"));
		dto.setContents(req.getParameter("contents"));

		daoo.modifySupports(dto);

		return "redirect:/admin/index.do";
	}

}
