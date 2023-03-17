package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.GoodsOrderDTO;
import com.edu.springboot.jdbc.SellRightDTO;
import com.edu.springboot.jdbc.TempgoodsOrderDTO;
import com.edu.springboot.jdbc.TempgoodsService;

@Controller
public class OrderController {

	@Autowired
	TempgoodsService order_dao;
	
	@Autowired
	IMemberService member_dao;

	
	@RequestMapping(value = "/orderlist.do", method = RequestMethod.GET)
	public String member1(Principal principal, Model model) {
		

		List<String>orderList = new ArrayList<String>();
		
		String loginId = principal.getName();
		SellRightDTO srdto  = member_dao.LoginUser(loginId);
		String Authority = srdto.getAuthority();
		int member_idx = srdto.getMember_idx();
		
		if(Authority.equals("ROLE_seller"))
		{
			ArrayList<TempgoodsOrderDTO>sellerOrderlists = order_dao.SellerSelectGoodsOrder(member_idx);
			model.addAttribute("lists",sellerOrderlists);
			System.out.println(model.getAttribute("lists"));
		}
		else {
			ArrayList<TempgoodsOrderDTO>sellerOrderlists = order_dao.AdminSelectGoodsOrder(member_idx);
			model.addAttribute("lists",sellerOrderlists);
			System.out.println(model.getAttribute("lists"));
		}
		return "/admin/orderList";
	}
	
	
	@RequestMapping("/orderRelease.do")
	public String orderRelease(HttpServletRequest req, TempgoodsOrderDTO todto) {
		
		System.out.println(req.getParameter("value"));
		String value= req.getParameter("value");
		
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();
		
		for(int i = 0 ; i < list.length ; i++) {
			val.add(list[i]);
			System.out.println(val);
		}
		
		order_dao.orderRealease(val);

		
        return "redirect:orderlist.do";
	}
	
	@RequestMapping("/ordercompleted.do")
	public String ordercompleted(HttpServletRequest req, TempgoodsOrderDTO todto) {
		
		System.out.println(req.getParameter("value"));
		String value= req.getParameter("value");
		
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();
		
		for(int i = 0 ; i < list.length ; i++) {
			val.add(list[i]);
			System.out.println(val);
		}
		
		order_dao.ordercompleted(val);

		
        return "redirect:orderlist.do";
	}
	
	
	
	@RequestMapping("/orderView.do")
	public String orderView(TempgoodsOrderDTO todto, HttpServletRequest req, Model model) {
		String order_item_idx = req.getParameter("order_item_idx"); 
		System.out.println(order_item_idx);
		ArrayList<TempgoodsOrderDTO>view = order_dao.orderView(order_item_idx);
		model.addAttribute("view", view);
		System.out.println(model.getAttribute("view"));
		
		return "/admin/orderView";

	}
}
