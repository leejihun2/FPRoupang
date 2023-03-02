package com.edu.springboot.jdbc;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private String idx; 
	private int product_idx;
	private int bot_cate_idx;
	private int member_idx;
	private String goods_title;
	private String ccomment;
	private String mcomment;
	private Date regiDate;
	private float star_rate;
	private String servey1;
	private String servey2;
	private String servey3;
	private String REVIEW_IMG;
	
}