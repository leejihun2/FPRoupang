package com.edu.springboot;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.springboot.jdbc.IReviewService;

@Controller
public class ReviewController {

	@Autowired
	IReviewService daoo;
	
	@RequestMapping("/review/review.do")
	public String reviewWrite(Model model, HttpSession session,
			HttpServletRequest req) {
		
		return "review/review";
	}
	
	// 글쓰기 처리
	@RequestMapping(value = "/review/reviewAction.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, HttpSession session, Principal principal) {

		int applyRow = daoo.reviewWrite(req.getParameter("goods_title"), 
								req.getParameter("ccomment"),
								req.getParameter("star_rate"),
								req.getParameter("servey1"),
								req.getParameter("servey2"),
								req.getParameter("servey3"),
								req.getParameter("summary"));
		System.out.println("입력된행의갯수:" + applyRow);

		return "redirect:review.do";
	}
	
}
