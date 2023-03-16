package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class GoodsOrderDTO {
	
	private int idx;
	private int member_idx;
	private String order_num;
	private String order_date;
	private String depart_date;
	private String arrival_date;
	private String order_status;
	
}
