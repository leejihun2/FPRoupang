package com.edu.springboot.jdbc;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {

	private int idx;
	private int product_idx;
	private int bot_cate_idx;
	private int member_idx;
	private String goods_title;
	private String ccomment;
	private Date regiDate;
	private float star_rate;
	private float servey1;
	private float servey2;
	private float servey3;
	private String summary;
	
	private int star_rate1; // 리뷰 1점
	private int star_rate2; // 리뷰 2점
	private int star_rate3; // 리뷰 3점
	private int star_rate4; // 리뷰 4점
	private int star_rate5; // 리뷰 5점
	private int servey1_1; //만족도
	private int servey1_2; 
	private int servey1_3; 
	private int servey2_1; 
	private int servey2_2; 
	private int servey2_3; 
	private int servey3_1; 
	private int servey3_2; 
	private int servey3_3; 
}
