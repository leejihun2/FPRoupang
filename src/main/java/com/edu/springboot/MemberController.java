package com.edu.springboot;


import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.MemberDTO;
import com.edu.springboot.jdbc.SellRightDTO;
import com.edu.springboot.jdbc.SellerDTO;


@Controller
public class MemberController {

	@Autowired
	IMemberService dao;
	
	@Autowired
	SqlSession sqlsession;
	
//	@RequestMapping("../")
//	public String home() {
//		return "home";
//	}
	@RequestMapping(value = "/regist.do", method = RequestMethod.GET)
	public String member1() {
		return "/member/regist";
	}
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String member6(MemberDTO memberDTO) {
		
		int result = dao.insert(memberDTO);
		if(result==1) System.out.println("입력되었습니다.");
		return "redirect:regist.do";
	}
	
	@RequestMapping(value="/search_id.do", method=RequestMethod.GET)
	public String member_2() {
		return "member/search_id";
	}
	
	@RequestMapping(value="/search_id.do", method=RequestMethod.POST)
	public String member_7(MemberDTO memberDTO, Model model) {
		memberDTO = dao.select(memberDTO);
		model.addAttribute("dto", memberDTO);
		
		return "member/show_id";
	}

	@RequestMapping(value="/checkemail.do", method=RequestMethod.POST)
	@ResponseBody
	public int checkEmail(MemberDTO memberDTO) {
		int result = dao.checkEmail(memberDTO);
		System.out.println(result);
        return result;
      
    }
	
	@RequestMapping(value="/checkSeller.do", method=RequestMethod.POST)
	@ResponseBody
	public int checkSeller(SellerDTO sellerDTO, Principal principal) {
		
		String loginId = principal.getName();
		String member_idx = dao.member_idx(loginId);
		
        System.out.println(member_idx);
        
		sellerDTO.setMember_idx(Integer.parseInt(member_idx));
		int result = dao.checkSeller(sellerDTO);
		System.out.println(result);
        return result;
      
    }
	
	@RequestMapping("/cancelMembership.do")
	public String member_9(Principal principal, HttpSession session, MemberDTO memberDTO) {
		String loginId = principal.getName();
        int cancelMembership = dao.cancelMembership(loginId);
        session.setAttribute("cancelMembership", cancelMembership);
        System.out.println(session.getAttribute("cancelMembership"));
        return "/home";
        
	}
	
	@RequestMapping("/joinMembership.do")
	public String member_12(Principal principal, HttpSession session, MemberDTO memberDTO) {
		String loginId = principal.getName();
        int joinMembership = dao.joinMembership(loginId);
        session.setAttribute("joinMembership", joinMembership);
        System.out.println(session.getAttribute("joinMembership"));
        return "/home";
        
	}
	
	@RequestMapping("/membership.do")
    public String memberInfo(Principal principal, HttpSession session, MemberDTO memberDTO){
        String loginId = principal.getName();
        int membership = dao.membership(loginId);
        session.setAttribute("membership", membership);
        System.out.println(session.getAttribute("membership"));
        return "/membership";
    }
	
	@RequestMapping("/Sell_Authorized.do")
	public String Sell_Authorized(Principal principal, HttpSession session, MemberDTO memberDTO) {
		String loginId = principal.getName();
		
		String email = dao.email(loginId);
        session.setAttribute("email", email);
//        System.out.println(session.getAttribute("email"));
        
        String name = dao.name(loginId);
        session.setAttribute("name", name);
//        System.out.println(session.getAttribute("name"));
        
        String member_idx = dao.member_idx(loginId);
        session.setAttribute("member_idx", member_idx);
//        System.out.println(session.getAttribute("member_idx"));
		return "member/Sell_Authorized";
	}
	
	@RequestMapping("/Sell_AuthorizedAction.do")
	public String Sell_AuthorizedAction(Principal principal, HttpSession session, SellerDTO sellerDTO,
			HttpServletRequest req) {
		String loginId = principal.getName();
		
		String email = dao.email(loginId);
        session.setAttribute("email", email);
        System.out.println(session.getAttribute("email"));
        
        String member_idx = dao.member_idx(loginId);
        session.setAttribute("member_idx", member_idx);
        System.out.println(session.getAttribute("member_idx"));
        
        String name = dao.name(loginId);
        session.setAttribute("name", name);
        System.out.println(session.getAttribute("name"));
        
        
        System.out.println("add1>>>>>" + req.getParameter("office_address1"));
        System.out.println("add2>>>>>" + req.getParameter("office_address2"));
        
        String address= req.getParameter("office_address1")+req.getParameter("office_address2");
        
        System.out.println(address);
        sellerDTO.setMember_idx(Integer.parseInt((String) session.getAttribute("member_idx")));
        sellerDTO.setOffice_address(address);
        
        int result = dao.Sell_AuthorizedAction(sellerDTO);
		if(result==1) System.out.println("입력되었습니다.");
		return "redirect:/";
        
		
	}
	
	
	@RequestMapping("/appOk.do")
	public String appOk(SellRightDTO sellRightDTO, HttpServletRequest req) {
		
		int situation_one = dao.situation_one(sellRightDTO);
		req.setAttribute("situation_one", situation_one);
		if(situation_one==1) System.out.println("상태1.");
		
		int seller = dao.seller(sellRightDTO);
		req.setAttribute("seller", seller);
		if(seller==1) System.out.println("셀러로변경.");
        
        return "redirect:/sellerList.do";
	}
	
	
		
	@RequestMapping("/appRegect.do")
	public String appRegect(SellRightDTO sellRightDTO, HttpServletRequest req) {
		
		
		int situation_two = dao.situation_two(sellRightDTO);
		req.setAttribute("appRegect", situation_two);
		if(situation_two==1) System.out.println("상태2.");
        
		int member = dao.member(sellRightDTO);
		req.setAttribute("member", member);
		if(member==1) System.out.println("멤버.");
		
		
        return "redirect:/blockList.do";
	}
	
	@RequestMapping("/applicationList.do")
	public String appList(Model model, SellRightDTO sdto) {
		//Mapper에서 반환한 List컬렉션을 Model에 저장한 후 뷰를 호출한다. 
		
		List<String>appList = new ArrayList<String>();
		ArrayList<SellRightDTO>lists = dao.situation_zero(appList);
		model.addAttribute("lists", lists);
		System.out.println(model.getAttribute("lists"));
		return "/admin/sell_Authority/applicationList";
	}
	
	@RequestMapping("/appView.do")
	public String appView(SellRightDTO sellRightDTO, Model model, HttpServletRequest req) {
		
		//Mapper에서 반환한 List컬렉션을 Model에 저장한 후 뷰를 호출한다. 
		int member_idx = Integer.parseInt(req.getParameter("member_idx")); 
		ArrayList<SellRightDTO>view = dao.appView(member_idx);
		model.addAttribute("view", view);
		System.out.println(model.getAttribute("view"));
		return "/admin/sell_Authority/appView";
	};
	
	
	@RequestMapping("/sellerList.do")
	public String sellerList(Model model, SellRightDTO sdto) {
		//Mapper에서 반환한 List컬렉션을 Model에 저장한 후 뷰를 호출한다. 
		
		List<String>sList = new ArrayList<String>();
		ArrayList<SellRightDTO>lists = dao.sellerList(sList);
		model.addAttribute("lists", lists);
		System.out.println("hi");
		return "/admin/sell_Authority/sellerList";
	}
	
	@RequestMapping("/sellerView.do")
	public String sellerView(SellRightDTO sellRightDTO, Model model, HttpServletRequest req) {
		
		//Mapper에서 반환한 List컬렉션을 Model에 저장한 후 뷰를 호출한다. 
		
		int member_idx = Integer.parseInt(req.getParameter("member_idx")); 
		ArrayList<SellRightDTO>view = dao.sellerView(member_idx);
		model.addAttribute("view", view);
		System.out.println(model.getAttribute("view"));
		return "/admin/sell_Authority/sellerView";
	};
	
	@RequestMapping("/blockList.do")
	public String blockList(Model model, SellRightDTO sdto) {
		//Mapper에서 반환한 List컬렉션을 Model에 저장한 후 뷰를 호출한다. 
		
		List<String>bList = new ArrayList<String>();
		ArrayList<SellRightDTO>lists = dao.blockList(bList);
		model.addAttribute("lists", lists);
		System.out.println(model.getAttribute("lists"));
		return "/admin/sell_Authority/blockList";
	}
	
	@RequestMapping("/blockView.do")
	public String blockView(SellRightDTO sellRightDTO, Model model, HttpServletRequest req) {
		
		//Mapper에서 반환한 List컬렉션을 Model에 저장한 후 뷰를 호출한다. 
		int member_idx = Integer.parseInt(req.getParameter("member_idx")); 
		ArrayList<SellRightDTO>view = dao.blockView(member_idx);
		model.addAttribute("view", view);
		System.out.println(model.getAttribute("view"));
		return "/admin/sell_Authority/blockView";
	};
	
//	//로그인
//	@RequestMapping("/login")
//	public String login(Principal principal, HttpSession session, MemberDTO memberDTO) {
//		try {
//			String user_id = principal.getName();
//			session.setAttribute("user_id", user_id);
//			
//			
//		}
//		catch(Exception e) {
//			//System.out.println("로그인 전입니다.");
//		}
//		return "login";
//	}

	
}