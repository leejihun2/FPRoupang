package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class TempgoodsOrderDTO {
	private String idx;
	private String buyer_idx;
	private String buyer_name;
	private String seller_idx;
	private String order_num;
	private String order_date;
	private String depart_date;
	private String arrive_date;
	private String order_status;
	private String company_name;
	
	private String zipcode1;
	private String address1;
	
	private String order_item_idx;
	private String order_primary_idx;
	private String order_idx;
	private String bot_idx;
	private String goods_idx;
	private String top_title;
	private String main_title;
	private String goods_image;
	private int price;
	private int amount;
	private int discount;
	private int sorting;
}
