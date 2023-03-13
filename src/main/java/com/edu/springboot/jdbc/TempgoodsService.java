package com.edu.springboot.jdbc;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TempgoodsService {
	public int InsertOrder(TempgoodsOrderDTO tempgoodsOrderDTO);
	public int InsertOrderItem(TempgoodsOrderDTO tempgoodsOrderDTO);
}
