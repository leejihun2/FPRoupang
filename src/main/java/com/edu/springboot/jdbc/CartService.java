package com.edu.springboot.jdbc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartService {
	
	public int insertCart(CartDTO cartDTO);
	
	public ArrayList<CartDTO> getCartList(String userId);
	
	public int sumMoney(String userId);
	
	public int modifyCart(CartDTO cartDTO);
	
	public int deleteCart(int cart_idx);
	
	public int updateCart(CartDTO cartDTO);

	public int checkCart(int product_idx, String email);
}
