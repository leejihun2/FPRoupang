package com.edu.springboot;

import java.awt.print.Pageable;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.MyDTO;
import com.edu.springboot.jdbc.MyService;
import com.edu.springboot.jdbc.SellRightDTO;
import com.edu.springboot.jdbc.TempgoodsOrderDTO;
import com.edu.springboot.jdbc.TempgoodsService;
import com.edu.springboot.jdbc.TicketInfoDTO;
import com.edu.springboot.jdbc.TotalJourneyDTO;
import com.edu.springboot.jdbc.WishDTO;


@Controller
public class MyController {
	
	
	@Autowired
	MyService msv;
	
	@Autowired
	IMemberService member_dao;
	
	@Autowired
	TempgoodsService order_dao;
	
	//마이쿠팡
	@RequestMapping("/myroupang/orderlist.do")
	public String myrou(Principal principal, Model model) {
//		List<String>orderList = new ArrayList<String>();
		
		String loginId = principal.getName();
		SellRightDTO srdto  = member_dao.LoginUser(loginId);
		int member_idx = srdto.getMember_idx();
		ArrayList<TempgoodsOrderDTO>buyerOrderlists = order_dao.buyerInfo(member_idx);
	
		model.addAttribute("lists",buyerOrderlists);
		System.out.println(buyerOrderlists);
		
		
		return "myroupang/orderlist";
	}
	
	//취소/교환 페이지
	@RequestMapping("/myroupang/cancelReturn.do")
	public String cancel() {
		
		return "myroupang/cancelReturn";
	}
	//취소/교환 가이드 
	@RequestMapping("/myroupang/cancelGuide.do")
	public String cancelguide() {
		
		return "myroupang/cancelGuide";
	}
	//프레시 백 
	@RequestMapping("/myroupang/freshbag.do")
	public String freshbb() {
		
		return "myroupang/freshbag";
	}
	
	
	
	//내 정보 수정
	 @RequestMapping("/myroupang/mylist.do")
	 public String member2(Principal principal,
			 HttpServletRequest session, Model model, HttpServletRequest req) {
		 
		String email = principal.getName();
		
		MyDTO dto = msv.selectOne(email);
		
		model.addAttribute("dto", dto);
		
		return "myroupang/mylist";
	 }
	 
	 
	 @RequestMapping(value="/myroupang/mylistmodify.do", method = RequestMethod.GET)
	 public String cou(Principal principal, Model model, HttpServletRequest req) {
		
		System.out.println("진입하나여");
		String email = principal.getName();
		System.out.println(email);
		MyDTO dto = msv.selectOne(email);
		model.addAttribute("dto", dto);
		

		 return "myroupang/mylistmodify";
	}
	
	 
	 
	 //패스워드 암화를 위한 메서드 
	 public PasswordEncoder passwordEncoder() {
		 
		 return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	 
	 //회원정보수정
	 @ResponseBody
	 @RequestMapping(value="/myroupang/mylistmodify.do", method = RequestMethod.POST)
	    public ModelAndView mem8(HttpServletRequest req ) {
		 
		 ModelAndView mv = new ModelAndView();
		 
		 
		 MyDTO myDTO = new MyDTO();
		 myDTO.setEmail(req.getParameter("email"));
		 myDTO.setName(req.getParameter("name"));
		 myDTO.setJumin_num(req.getParameter("jumin_num"));
		 myDTO.setPhone_number(req.getParameter("phone_number"));
		 
		 String boxvalue="0";
		 
		 if((req.getParameter("marketing_agreement")!=null)){
			 
			 boxvalue = req.getParameter("marketing_agreement");
			 
		 }
		 myDTO.setMarketing_agreement(boxvalue);
		 
		 
		 if(!(req.getParameter("password").equals(""))){
			 
			 String password = (passwordEncoder().encode(req.getParameter("password")));
			 
			 myDTO.setPassword(password);
		 }
		 
		 
			 int result = msv.update(myDTO);
			 if(result!=1) {
				mv.addObject("errorThrown", "Error!");
			 }
			 	myDTO = msv.selectOne(req.getParameter("email"));
			 	mv.addObject("dto", myDTO);
			 	mv.setViewName("/myroupang/mylist");
			 	
		    return mv;
		 }

	 
		 @RequestMapping(value="/memberDelete", method=RequestMethod.POST)
		 public String memberDelete(@RequestBody MyDTO myDTO, HttpSession session){
			 if(myDTO.getEmail() != null && myDTO.getEmail() != "") {
				 
				 msv.memberDelete(myDTO);
				 session.invalidate();
			 } 
			 return "redirect:/";
		 }
		 
	 
	
	//주소지 리스트
	@RequestMapping("/myroupang/deliverylist.do")
	public String member3(MyDTO myDTO, Model model, Principal principal) {
		
		String address = principal.getName();
		
		//파라미터로 전달된 id는 커맨드객체를 통해 받은 후 msv로 전달한다.
		//msv에서 회원레코드를 인출한 후 반환되는 값을 다시 DTO에 저장한다.
		MyDTO dto = msv.adselectOne(address);
	
		//회원정보가 저장된 DTO를 Model로 저장한 후 뷰로 전달한다.
		model.addAttribute("dto", dto);
		
		return "myroupang/deliverylist";
	}

	
	//주소 수정
	@RequestMapping(value="/myroupang/adeditAction.do", method = RequestMethod.GET)
	public String delmep(Principal principal, Model model, HttpServletRequest req) {
		
		String email = principal.getName();
		System.out.println(email);
		MyDTO dto = msv.adselectOne(email);
		
		model.addAttribute("dto", dto);
		
		return "myroupang/adeditAction";
	}
    
	
	//주소 수정페이지
	@ResponseBody
	@RequestMapping(value="/myroupang/adeditAction.do", method = RequestMethod.POST)
	public ModelAndView memr6(HttpServletRequest req) { 
		
		System.out.println("수정진입");
		ModelAndView mv = new ModelAndView();
		 
		MyDTO myDTO = new MyDTO();
		myDTO.setEmail(req.getParameter("email"));
		myDTO.setZipcode1(req.getParameter("zipcode1"));
		myDTO.setAddress1(req.getParameter("address1"));
//		myDTO.setAddress1(req.getParameter("zipcode1")+req.getParameter("address1"));
		 
		
		int result = msv.adupdate(myDTO);
		 
		
		if(result!=1) {
			 
			mv.addObject("errorThrown", "Error!");
		}
		
		myDTO = msv.selectOne(req.getParameter("email"));
		 	mv.addObject("dto", myDTO);
		 	
		 	mv.setViewName("/myroupang/deliverylist");
		
	    return mv;
	
	}
	
	
	//주소 수정 2
	@RequestMapping(value="/myroupang/adregist.do", method = RequestMethod.GET)
	public String add2(Principal principal, Model model, HttpServletRequest req) {
		
		String email = principal.getName();
		System.out.println(email);
		MyDTO dto = msv.adselect(email);
		
		model.addAttribute("dto", dto);
		
		return "myroupang/adregist";
	}
	
	//주소 수정페이지 2
	@ResponseBody
	@RequestMapping(value="/myroupang/adregist.do", method = RequestMethod.POST)
	public ModelAndView reg2(HttpServletRequest req) { 
		
		ModelAndView mv = new ModelAndView();
		
		MyDTO myDTO = new MyDTO();
		myDTO.setEmail(req.getParameter("email"));
		myDTO.setZipcode2(req.getParameter("zipcode2"));
		myDTO.setAddress2(req.getParameter("address2"));
		
		int result = msv.adinsert(myDTO);
		
		if(result!=1) {
			
			mv.addObject("errorThrown", "Error!");
		}
		
		myDTO = msv.adselect(req.getParameter("email"));
		mv.addObject("dto", myDTO);
		
		mv.setViewName("/myroupang/deliverylist");
		
		return mv;
		
	}
	

    
/////////////////////////////찜 리스트 ////////////////////////////////


//	
//	//찜 매핑 and list 호출
//	@RequestMapping("/myroupang/wishlist.do")
//	public String wish(Model model, WishDTO wishDTO) {
//		
//		List<WishDTO> wishhList = msv.sewishlist();
//		model.addAttribute("wishlist", wishhList);
//		
////		model.addAttribute("wishList", msv.wishlist());
//		
//		return "myroupang/wishlist";
//	}
//	
//	
//	//찜 추가
//	@RequestMapping("myroupang/wishadd.do")
//	public String wishlist() {
//		
//		return " myroupang/wishlist";
//	}
//	
//	
//	//찜 삭제
//	@RequestMapping("myroupang/")
//	public String wishdelete(WishDTO wishDTO) {
//		
//		String result = msv.wishdelete(wishDTO);
//		
//		if(result== null) System.out.println("삭제되었습니다.");
//		
//		return" myroupang/wishlist";
//	}
	
//	//회원목록 : 회원가입폼 매핑
//	@RequestMapping(value="/regist.do", method = RequestMethod.GET)
//	public String member1() {
//		return "regist";
//	}
//	//회원정보 DB 입력처리
//	@RequestMapping(value="/regist.do", method = RequestMethod.POST)
//	public String member6(MemberDTO memberDTO) {
//		
//		//가입폼에서 전송된 폼값을 한꺼번에 받아 처리하기 위해 커맨드객체를 사용한다.
//		int result = msv.insert(memberDTO);
//		
//		//insert쿼리문은 성공시 1, 실패시 0을 반환한다.
//		if(result==1) System.out.println("입력되었습니다.");
//		return "redirect:list.do";
//	}
		
		
	//찜 매핑 and list 호출
	@RequestMapping("/myroupang/wishlist.do")
	public String wish(Model model, HttpServletRequest req) {
		
		
//		int totalRecordCount = msv.reviewcount(); 
		
		ArrayList<WishDTO> wilist = msv.wishView();
		model.addAttribute("wishList", wilist);
		
		return "myroupang/wishlist";
	}
	
//	//찜 추가
//	@RequestMapping("myroupang/wishadd.do")
//	public String wishlist() {
//		
//		return " myroupang/wishlist";
//	}
//	
		
		

	
	@RequestMapping("/deletewish.do")
	public String delete(HttpServletRequest req, HttpSession session, Principal principal) {
		
		String email = principal.getName();
		
		session.setAttribute("siteUserInfo", email);
		
		if (session.getAttribute("siteUserInfo") == null) {
			
			return "redirect:/myLogin.do";
		}
//		int applyRow = msv.wishdelete(req.getParameter("member_idx"));


		return "redirect:/review/reviewList.do";
	}
	
	
	
	
	
	
//	@RequestMapping(value="/deletewish", method=RequestMethod.POST)
//	public String ajaxTest(HttpServletRequest req) throws Exception {
//		
//		String[] ajaxMsg = req.getParameterValues("vaArr");
//		System.out.println(req.getParameterValues("vaArr"));
//		int size = ajaxMsg.length;
//		for(int i=0; i<size; i++) {
//			msv.deletewish(ajaxMsg[i]);
//		}
//		return "myroupang/wishlist";
//	}

	
	
	
}
