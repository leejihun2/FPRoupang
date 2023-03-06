package com.edu.springboot.jdbc;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryService {
	public ArrayList<ParameterTicketDTO> select_cate(int sub_idx);
	public ArrayList<ParameterTicketDTO> select_cate_bot(int sub_idx, String company_name);	
	public ArrayList<ParameterTicketDTO> select_cate_bot_j(int sub_idx, String company_name);	
}
