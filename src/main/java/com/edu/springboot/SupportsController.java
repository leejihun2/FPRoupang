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

import com.edu.springboot.jdbc.SupportsDTO;
import com.edu.springboot.jdbc.ISupportsService;

@Controller
public class SupportsController {
	
	@Autowired
	ISupportsService daoo;

	@RequestMapping("/supports/returnPolicy.do")
	public String returnPolicy() {
		return "/supports/returnPolicy";
	}
	
	@RequestMapping("/supports/faq.do")
	public String faq(Model model, HttpServletRequest req) {
		
//		SupportsDTO supportsDTO = new supportsDTO();
//		SupportsDTO.setSearchField(req.getParameter("searchField"));
//		SupportsDTO.setSearchTxt(req.getParameter("searchTxt"));
//		SupportsDTO.setCategoryCode(req.getParameter("categoryCode"));
		
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
		return "/supports/faq";
	}
	@RequestMapping("/supports/notice.do")
	public String lists2(Model model, HttpServletRequest req) {
		
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
		return "/supports/notice";
	}
	
	@RequestMapping("/supports/inquiry.do")
	public String lists3(SupportsDTO supportsDTO, Model model, HttpServletRequest req) {
		
		int totalRecordCount = 
				daoo.inquiryCount(supportsDTO);
		
		ArrayList<SupportsDTO> lists = 
				daoo.inquirylist(supportsDTO);

		for (SupportsDTO dto : lists) {
			System.out.println("나 동작");
			String temp = dto.getContents()
					.replace("\r\n", "<br/>");
			dto.setContents(temp);
			System.out.println("콘텐츠 >>>>> "+dto.getContents());
		}
		
		model.addAttribute("lists", lists);
		return "/supports/inquiry";
	}
	
	@RequestMapping("/supports/voc.do")
	public String write(Model model, HttpSession session,
			HttpServletRequest req, Principal principal) {
		if(session.getAttribute("siteUserInfo")==null)
		{
			model.addAttribute("backUrl", "/supports/voc");
			return "redirect:/myLogin.do";
		}
		return "/supports/voc";
	}
	
	// 글쓰기 처리
	@RequestMapping(value = "/supports/vocAction.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, HttpSession session, Principal principal) {
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:/myLogin.do";
		}
		String email = principal.getName();
		int applyRow = daoo.write(req.getParameter("contents"), 
								email, 
								req.getParameter("title"));
		System.out.println("입력된행의갯수:" + applyRow);

		return "redirect:/";
	}
	
	@RequestMapping("/supports/delete.do")
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
		return "redirect:/myLogin.do";
	}
	

	

}
