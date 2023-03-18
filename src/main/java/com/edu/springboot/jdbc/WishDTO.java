package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class WishDTO {
	
	private int product_idx;  //상품번호
	private int member_idx; //현재 로그인 계정
	private int p_price; //가격
	private String p_title; //이름
	private String p_image;  //사진 
	
	
}
