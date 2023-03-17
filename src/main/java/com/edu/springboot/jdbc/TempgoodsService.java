package com.edu.springboot.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TempgoodsService {
	public int InsertOrder(TempgoodsOrderDTO tempgoodsOrderDTO);
	public int InsertOrderItem(TempgoodsOrderDTO tempgoodsOrderDTO);
	public ArrayList<TempgoodsOrderDTO> SellerSelectGoodsOrder(int member_idx);
	public ArrayList<TempgoodsOrderDTO> AdminSelectGoodsOrder(int member_idx);
	public ArrayList<TempgoodsOrderDTO> orderView(String order_item_idx);
	public void orderRealease(List<String> val);
	public void ordercompleted(List<String> val);
}
