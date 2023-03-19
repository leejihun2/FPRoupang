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
import com.edu.springboot.jdbc.MainImageDTO;
import com.edu.springboot.jdbc.SellRightDTO;
import com.edu.springboot.jdbc.TotalJourneyDTO;
import com.edu.springboot.jdbc.CategoryService;
import com.edu.springboot.jdbc.IMainImageService;
import com.edu.springboot.jdbc.IMainService;


@Controller
public class MainContoller {

	@Autowired 
	IMemberService member_dao;
	
	@Autowired
    IMainService main_dao;
	
	@Autowired
	IMainImageService image_dao;
	
	@RequestMapping("/")
	public String home(Model model) {
		//메인 이미지
		ArrayList<MainImageDTO> image_dto = image_dao.select_images(1);
		
		model.addAttribute("image_dto",image_dto);
		
		//오늘의 발견 todayDiscovery
		ArrayList<TotalJourneyDTO> todayDiscovery = main_dao.todayDiscovery();
		
		model.addAttribute("todayDiscovery",todayDiscovery);
		//오늘의 쇼핑제안(랜덤 5개 상품)
		ArrayList<TotalJourneyDTO> todayShop = main_dao.todayShop();
				
		model.addAttribute("todayShop",todayShop);
		
		//좋아할만한 카테고리
		ArrayList<TotalJourneyDTO> likeCate = main_dao.likeCate();
		
		model.addAttribute("likeCate",likeCate);
		
		
		//가전디지털 
		ArrayList<TotalJourneyDTO> digitalList = main_dao.adDigital_list();
		
		model.addAttribute("digitalList",digitalList);
		
		//뷰티
		ArrayList<TotalJourneyDTO> beautyList = main_dao.adBeauty_list();
		
		model.addAttribute("beautyList",beautyList);
		 
		//여행
		ArrayList<TotalJourneyDTO> journeyList = main_dao.adJourney_list();
		
		model.addAttribute("journeyList",journeyList);
		
		
		
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
		
		SellRightDTO dto  = member_dao.LoginUser(loginId);
		if(!(loginId.equals("admin"))) {
			dto  = member_dao.LoginSeller(dto.getMember_idx());
			model.addAttribute("company_name", dto.getCompany_name());
			model.addAttribute("member_idx",dto.getMember_idx());
		}else {
			model.addAttribute("member_idx",dto.getMember_idx());
		}

		model.addAttribute("cate",cate_dao.select_cate(sub_idx));
		
		return "/admin/productInsert";
	}
	
	@RequestMapping("/cart.do")
	public String cart() {
		
		return "cart";
	}
	@RequestMapping("/pd.do")
	public String pd_view() {
		
		return "pd_detail_view";
	}
}
