package com.edu.springboot.jdbc;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryService {
	public ArrayList<ParameterTicketDTO> select_cate(int sub_idx);
	public ArrayList<ParameterJourneyDTO> select_cate_j(int sub_idx);
	public ArrayList<ParameterProductDTO> select_cate_mid(int sub_idx);
	
	public ArrayList<ParameterTicketDTO> select_cate2(int sub_idx);
	
	public ArrayList<ParameterTicketDTO> select_cate_bot(int sub_idx, String company_name);	
	public ArrayList<ParameterProductDTO> select_cate_bot_p(int sub_idx, String company_name);
	public ArrayList<ParameterJourneyDTO> select_cate_bot_j(int sub_idx, String company_name);	
	
	public String select_one_cate(int sub_idx);
	public String select_bot_cate(int sub_idx);
	
	public String like_bot_title(int sub_idx, String title);
	public String search_product_List(int sub_idx, String title); 
	public ArrayList<TotalJourneyDTO> search_journey_List(int sub_idx, String title);
	
	
}
