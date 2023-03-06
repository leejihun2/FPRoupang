package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class ParameterSupportsDTO {

	private String user_id;
	private String board_idx;
	
	private String searchField;
	private String searchTxt;

	private int start;
	private int end;
	
}
