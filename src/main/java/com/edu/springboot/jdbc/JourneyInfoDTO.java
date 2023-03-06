package com.edu.springboot.jdbc;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class JourneyInfoDTO {
	private int ji_idx;
	private int bot_idx;
	private String ji_title; //객실명
	private int ji_adult; //성인 인원수
	private int ji_kid; //아동 인원수
	private int ji_roomnum; //객실수
	private int ji_price; //객실 가격
	private int ji_discount; //할인률
	private String ji_intro; //상세정보
	private String ji_duetime1; //영업운행일 start
	private String ji_duetime2; //영업운행일 end
	private String ji_image1; 
	private String ji_image2;
	private String ji_image3;
	private String ji_image4;
	
	SimpleDateFormat setDate = new SimpleDateFormat("yyyy-MM-dd");
	public String getJi_duetime1() {
		try {
			java.util.Date utilDate = (java.util.Date)setDate.parse(ji_duetime1);
			ji_duetime1 = setDate.format(utilDate);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ji_duetime1;
	}
	
	public String getJi_duetime2() {
		try {
			java.util.Date utilDate = (java.util.Date)setDate.parse(ji_duetime2);
			ji_duetime2 = setDate.format(utilDate);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ji_duetime2;
	}
}
