package com.edu.springboot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.CartDTO;
import com.edu.springboot.jdbc.CartService;
import com.edu.springboot.jdbc.ProductService;

@Controller
public class CartController {

	@Autowired
	CartService dao;
	
	@Autowired
	ProductService pro_dao;
	
	@RequestMapping("/cart.do")
	public String cart() {
		return "/product/cart_unlogin";
	}
	
	// 1. 장바구니 등록
	@RequestMapping("insertCart")
	public String insert(HttpSession session, CartDTO cartDTO) {
		String email = (String)session.getAttribute("email");
		cartDTO.setEmail(email);
		
		int count = dao.checkCart(cartDTO.getProduct_idx(), email);
		
		if (count == 0) {
			// 없으면 insert
			dao.insertCart(cartDTO);
		}
		else {
			// 있으면 update
			dao.updateCart(cartDTO);
		}
		return "redirect:/cart/list.do";
	}
	
	// 2. 장바구니 목록
	@RequestMapping("listCart")
	public ModelAndView list(HttpSession session, ModelAndView mv, CartDTO cartDto) {
		
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartDTO> list = dao.getCartList(userId);
		
		map.put("list", list);
		map.put("count", list.size());
		
		mv.setViewName("cart");
		mv.addObject("map", map);
		return mv;
	}
	
	// 3. 장바구니 삭제
	@RequestMapping("deleteCart")
	public String deleteCart(@RequestParam int cart_idx) {
		dao.deleteCart(cart_idx);
		return "redirect:list.do";
	}
	
	// 4. 장바구니 수정
	@RequestMapping("updateCart")
	public String update(@RequestParam int[] c_amount, @RequestParam int[] product_idx, HttpSession session) {
		// session의 ID
		String userId = (String)session.getAttribute("userId");
		
		for (int i = 0; i < product_idx.length; i++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setEmail(userId);;
			cartDTO.setC_total(i);
			cartDTO.setProduct_idx(product_idx[i]);
			dao.updateCart(cartDTO);
		}
		
		return "redirect:list.do";
	}
}
