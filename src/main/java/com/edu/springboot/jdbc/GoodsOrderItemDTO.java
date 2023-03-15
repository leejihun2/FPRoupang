package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class GoodsOrderItemDTO {

	private int idx;
	private int order_idx;
	private int bot_idx;
	private int price;
	private int amount;
	private int discount;
	private int goods_idx;
	private String goods_image;
	
}
