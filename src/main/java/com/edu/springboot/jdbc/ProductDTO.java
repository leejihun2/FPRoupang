package com.edu.springboot.jdbc;

import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class ProductDTO {
	
	private int idx;
	private int bot_idx;
	private String p_title;
	private String p_cup_num;
	private String p_production;
	private String p_pro_date;
	private String p_pro_country;
	private String p_duetime;
	private String p_callnum;
	private String p_useway;
	private String p_size;
	private String p_as_info;
	private String p_composition;
	private String p_caution;
	private String p_assurance;
	private String p_title_image;
	private String p_image1;
	private String p_image2;
	private String p_image3;
	private String p_image4;
	
	
	SimpleDateFormat setDate = new SimpleDateFormat("yyyy-MM-dd");
		
		public String getP_pro_date() {
			try {
				java.util.Date utilDate 
					= (java.util.Date)setDate.parse(p_pro_date);
				p_pro_date = setDate.format(utilDate);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return p_pro_date;
		}
		
		public String getP_duetime() {
			try {
				java.util.Date utilDate
					= (java.util.Date)setDate.parse(p_duetime);
				p_duetime = setDate.format(utilDate);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			return p_duetime; 
		}
}