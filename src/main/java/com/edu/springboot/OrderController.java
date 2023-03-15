package com.edu.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.springboot.jdbc.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService dao;
	
	@RequestMapping(value = "/orderlist.do", method = RequestMethod.GET)
	public String member1() {
		return "/orderview/orderList";
	}
}
