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
	private String review;
	private Date regiDate;
	private Double star_rate;
	private Double star_servey1;
	private Double star_servey2;
	private Double star_servey3;
	private String summary;
	
	private int star_rate0;
	private int star_rate1; // 리뷰 1점
	private int star_rate2; // 리뷰 2점
	private int star_rate3; // 리뷰 3점
	private int star_rate4; // 리뷰 4점
	private int star_rate5; // 리뷰 5점
	
	private int star_servey1_0;
	private int star_servey1_1; //만족도
	private int star_servey1_2; 
	private int star_servey1_3; 
	private int star_servey1_4; 
	private int star_servey1_5; 
	
	private int star_servey2_0; 
	private int star_servey2_1; 
	private int star_servey2_2; 
	private int star_servey2_3; 
	private int star_servey2_4; 
	private int star_servey2_5; 

	private int star_servey3_0; 
	private int star_servey3_1; 
	private int star_servey3_2; 
	private int star_servey3_3; 
	private int star_servey3_4; 
	private int star_servey3_5; 
}
