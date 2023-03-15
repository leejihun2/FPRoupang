package com.edu.springboot.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderService {

	ArrayList<GoodsOrderDTO> select_goods_order(List<String> orderList);

	
}
