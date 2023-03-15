package com.edu.springboot;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.springboot.jdbc.GoodsOrderDTO;
import com.edu.springboot.jdbc.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService dao;
	
	@RequestMapping("/orderlist.do")
	public String orderlist(Model model, GoodsOrderDTO godto) {
		
		List<String>orderList= new ArrayList<String>();
		ArrayList<GoodsOrderDTO>lists = dao.select_goods_order(orderList);
		
		
		return "/orderview/orderList";
	}
}
