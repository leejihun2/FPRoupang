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

import com.edu.springboot.jdbc.CategoryDTO;
import com.edu.springboot.jdbc.IReviewService;
import com.edu.springboot.jdbc.ReviewDTO;

@Controller
public class ReviewController {

	@Autowired
	IReviewService daoo;
	
	@RequestMapping("/review/reviewList.do")
	public String review(Model model, HttpServletRequest req) {
		
		int value = Integer.parseInt(req.getParameter("value"));
		
		
		ReviewDTO totalstar = 
				daoo.starcount();
		
		ArrayList<ReviewDTO> lists = 
				daoo.reviewList(value);
		
		
		
		for (ReviewDTO dto : lists) {
			if(dto.getReview()!=null) {
				
				String temp = dto.getReview()
						.replace("\r\n", "<br/>");
				dto.setReview(temp);
			}
		}
		
		model.addAttribute("totalstar", totalstar);
		model.addAttribute("lists", lists);
		return "review/reviewList";
	}
	@RequestMapping("/review/reviewable.do")
	public String reviewable(Model model, HttpSession session,
			HttpServletRequest req) {
//		int member_idx = Integer.parseInt(req.getParameter("member_idx"));
//		ArrayList<CategoryDTO> order = 
//				daoo.order();
//		model.addAttribute("order", order);
		return "review/reviewable";
	}
	
	@RequestMapping("/review/review.do")
	public String reviewWrite(Model model, HttpSession session,
			HttpServletRequest req) {
		
		return "review/review";
	}
	
	// 글쓰기 처리
	@RequestMapping(value = "/review/reviewAction.do", method = RequestMethod.POST)
	public String reviewWriteAction(ReviewDTO reviewDTO, Model model, HttpServletRequest req, HttpSession session, Principal principal) {

		int applyRow = daoo.reviewWrite(reviewDTO);
		System.out.println("입력된행의갯수:" + applyRow);

		return "redirect:reviewList.do";
	}
	
	@RequestMapping("/review/reviewModify.do")
	public ModelAndView reviewModify(Model model, HttpServletRequest req, HttpSession session) {
	    
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		ModelAndView mv = new ModelAndView();
		
		ReviewDTO dto = daoo.view(idx);
	    
	    mv.addObject("dto",dto);
	    mv.setViewName("/review/reviewModify");
	    return mv;
	}

	@RequestMapping("/review/reviewModifyAction.do")
	public String modifyAction(Model model, HttpSession session, HttpServletRequest req) {
	    
		
	    
	    int idx = Integer.parseInt(req.getParameter("idx"));
	    Double star_rate = Double.parseDouble(req.getParameter("star_rate"));
	    Double star_servey1 = Double.parseDouble(req.getParameter("star_servey1"));
	    Double star_servey2 = Double.parseDouble(req.getParameter("star_servey2"));
	    Double star_servey3 = Double.parseDouble(req.getParameter("star_servey3"));
	    ReviewDTO dto = new ReviewDTO();
	    dto.setIdx(idx);
	    dto.setReview(req.getParameter("review"));
	    dto.setStar_rate(star_rate);
	    dto.setStar_servey1(star_servey1);
	    dto.setStar_servey2(star_servey2);
	    dto.setStar_servey3(star_servey3);
	    dto.setSummary(req.getParameter("summary"));
	    
	    System.out.println(dto);
	    daoo.modifyReview(dto);
	    
	   
	    return "redirect:/review/reviewList.do";
	}
	
	@RequestMapping("/review/delete.do")
	public String delete(HttpServletRequest req, HttpSession session, Principal principal) {
		// 삭제는 본인만 가능하므로 로그인 확인을 진행한다.
		String email = principal.getName();
		session.setAttribute("siteUserInfo", email);
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:/myLogin.do";
		}
		int applyRow = daoo.delete(req.getParameter("idx"));

		System.out.println("삭제된 행의 갯수 : " + applyRow);

		return "redirect:/review/reviewList.do";
	}
	
}
