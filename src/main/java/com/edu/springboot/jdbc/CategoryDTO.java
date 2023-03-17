package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class CategoryDTO {
	private int idx;
	private int member_idx;
	private String title;
	private int sub_idx;
	private String company_name;
}
