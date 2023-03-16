package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.GoodsOrderDTO;
import com.edu.springboot.jdbc.OrderService;
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
		
		String loginId = principal.getName();
				
		if(!(loginId.equals("admin용용요요요요요요요요요요요용"))) {
			SellRightDTO dto  = member_dao.LoginUser(loginId);
			dto  = member_dao.LoginSeller(dto.getMember_idx());
		}

		return "/admin/orderList";
	}
}
