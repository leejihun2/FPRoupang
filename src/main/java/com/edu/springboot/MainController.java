package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.springboot.jdbc.BoardDTO;
import com.edu.springboot.jdbc.IBoardService;

@Controller
public class MainController {
	
//	@RequestMapping("/")
//	public String home() {
//		return "home";
//	}
	@RequestMapping("/board/returnPolicy.do")
	public String returnPolicy() {
		return "/board/returnPolicy";
	}

	@Autowired
	IBoardService daoo;
	
	@RequestMapping("/board/faq.do")
	public String faq(Model model, HttpServletRequest req) {
		
//		BoardDTO boardDTO = new BoardDTO();
//		boardDTO.setSearchField(req.getParameter("searchField"));
//		boardDTO.setSearchTxt(req.getParameter("searchTxt"));
//		boardDTO.setCategoryCode(req.getParameter("categoryCode"));
		
		String category = req.getParameter("categoryCode");
		int totalRecordCount = 
				daoo.getTotalCountSearch("faq",category);
		
		ArrayList<BoardDTO> lists = 
				daoo.listPageSearch("faq",category);
		
		for (BoardDTO dto : lists) {
			String temp = dto.getContents()
					.replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		
		model.addAttribute("lists", lists);
		return "board/faq";
	}
	@RequestMapping("/board/notice.do")
	public String lists2(Model model, HttpServletRequest req) {
		
		//BoardDTO boardDTO = new BoardDTO();
		//boardDTO.setSearchField(req.getParameter("searchField"));
		//boardDTO.setSearchTxt(req.getParameter("searchTxt"));
		//boardDTO.setCategoryCode(req.getParameter("categoryCode"));
		String category = req.getParameter("categoryCode");
		int totalRecordCount = 
				daoo.getTotalCountSearch("notice",category);
		
		ArrayList<BoardDTO> lists = 
				daoo.listPageSearch("notice",category);

		for (BoardDTO dto : lists) {
			System.out.println("나 동작");
			String temp = dto.getContents()
					.replace("\r\n", "<br/>");
			dto.setContents(temp);
			System.out.println("콘텐츠 >>>>> "+dto.getContents());
		}
		
		model.addAttribute("lists", lists);
		return "/board/notice";
	}
	
	@RequestMapping("/board/voc.do")
	public String write(Model model, HttpSession session,
			HttpServletRequest req) {
		if(session.getAttribute("siteUserInfo")==null)
		{
			model.addAttribute("backUrl", "board/voc");
			return "redirect:login.do";
		}
		
		return "board/voc";
	}
	
	// 글쓰기 처리
	@RequestMapping(value = "/board/vocAction.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, HttpSession session, Principal principal) {

		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		String email = principal.getName();
		int applyRow = daoo.write(req.getParameter("contents"), 
								email, 
								req.getParameter("title"));
		System.out.println("입력된행의갯수:" + applyRow);

		return "redirect:voc.do";
	}
	
	@RequestMapping("/board/delete.do")
	public String delete(HttpServletRequest req, HttpSession session, Principal principal) {
		//삭제는 본인만 가능하므로 로그인 확인을 진행한다.
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		String email = principal.getName();
		int applyRow = daoo
				.delete(req.getParameter("idx"),
						email);
						
		System.out.println("삭제된 행의 갯수 : " + applyRow);
		return "redirect:login.do";
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
	
	
}
