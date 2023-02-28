package com.edu.springboot.jdbc;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class TicketInfoDTO {
	private int ti_idx;
	private int bot_idx;
	private String ti_title;
	private String ti_intro;
	private String ti_duetime1;
	private String ti_duetime2;
	private int ti_price;
	private int ti_discount;
	
	SimpleDateFormat setDate = new SimpleDateFormat("yyyy-MM-dd");
	public String getTi_duetime1() {
		try {
			java.util.Date utilDate = (java.util.Date)setDate.parse(ti_duetime1);
			ti_duetime1 = setDate.format(utilDate);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ti_duetime1;
	}
	
	public String getTi_duetime2() {
		try {
			java.util.Date utilDate = (java.util.Date)setDate.parse(ti_duetime2);
			ti_duetime2 = setDate.format(utilDate);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ti_duetime2;
	}
}
