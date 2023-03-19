package com.edu.springboot.jdbc;

import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class CartDTO {

	private int cart_idx;
	
	// 멤버테이블 참조요소
	private int member_idx; 							//멤버 idx
	private String email;								//멤버 아이디
	private String membership;							//멤버십 여부
	
	// 상품테이블 참조 요소
	private int product_idx;							//상품 idx
	private String p_title;								//상품 이름
	
	// 상품상세테이블 참조 요소
	private int product_info_idx;						//상품정보 idx
	private int pi_price;								//상품 금액
	private int pi_discount;							//상품 할인율
	private int pi_delifee;								//상품 배송비
	
	
	// 새롭게 추가할 요소
	private String c_regidate;							//장바구니에 넣은 날짜
	private int c_total;								//구매갯수
	
	// 소분류카테고리 참조요소
	private int idx;									// 소분류 idx
	
	
	SimpleDateFormat setDate = new SimpleDateFormat("yyyy-MM-dd");
		
		public String getC_add_date() {
			try {
				java.util.Date utilDate 
					= (java.util.Date)setDate.parse(c_regidate);
				c_regidate = setDate.format(utilDate);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return c_regidate;
		}
}
