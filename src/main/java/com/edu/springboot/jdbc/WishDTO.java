package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class WishDTO {
	
	private int idx;  //상품번호
	private String p_title; //상품 이름
	private String p_price; //가격
	private String pImage;  //사진 
}
