package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class ProductInfoDTO {
	
	private int pi_idx;
	private int bot_idx;
	private String pi_title;
	private int pi_amount;
	private int pi_price;
	private int pi_discount;
	private int pi_isrocket;
	private int pi_sugcount;
	private int pi_cellcount;
	private int pi_grade;
	private String pi_delicom;
	private int pi_delifee;
	
}