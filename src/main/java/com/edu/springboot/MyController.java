package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;

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

import com.edu.springboot.jdbc.MyDTO;
import com.edu.springboot.jdbc.MyService;
import com.edu.springboot.jdbc.WishDTO;


@Controller
public class MyController {
	
	
	@Autowired
	MyService msv;
	
	//마이쿠팡
	@RequestMapping("/myroupang/orderlist.do")
	public String myrou() {
		
		return "myroupang/orderlist";
	}
	
	//취소/교환 페이지
	@RequestMapping("/myroupang/cancelReturn.do")
	public String cancel() {
		
		return "myroupang/cancelReturn";
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
		 
	 
	 
	 //주소 팝업
	@RequestMapping("/url.do")
	public String urlMethod(HttpServletRequest request , HttpServletResponse response, Model model ) throws Exception {		
	 	
		 // url.jsp라는 이름을 가진 팝업 생성
	 	return "/myroupang/url";
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
		System.out.println("주소목록 불러옴");
		
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
	
	
//  //주소지 삭제
//  @RequestMapping("/addelete.do")
//  public String member4(MemberDTO memberDTO) {
//  	
//		//파라미터로 전달된 아이디에 해당하는 
//		int result = msv.addelete(memberDTO);
//		
//		if(result==1) System.out.println("삭제되었습니다.");
//		
//		return "redirect:deliverylist.do";
//  }
    
/////////////////////////////찜 리스트 ////////////////////////////////


	
	//찜 매핑 and list 호출
	@RequestMapping("/myroupang/wishlist.do")
	public String wish(Model model) {
		
//		model.addAttribute("wishList", msv.wishlist());
		
		return "myroupang/wishlist";
	}
	
	
	//찜 추가
	@RequestMapping("myroupang/wishadd.do")
	public String wishlist() {
		
		return " myroupang/wishlist";
	}
	
	
	//찜 삭제
	@RequestMapping("myroupang/")
	public String wishdelete(WishDTO wishDTO) {
		
		return" myroupang/wishlist";
	}
	
	
	
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
//	
	
	
	
	

	
	
	
}
