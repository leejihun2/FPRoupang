package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class TotalJourneyDTO {
	private String idx;
	private String location;
	private int ji_price;
	private String j_title_image;
	private String ji_title;
	private String title;
	private int ji_discount;
	
	private int sub_idx;
	private int ji_adult;
	private int ji_kid;
	private String ji_duetime1;
	private String ji_duetime2;
	
	
	
	private int pi_price;
	private String pi_title;
	private String p_title;
	private String pi_discount;
	private String p_title_image;
	
}
