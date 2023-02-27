package com.edu.springboot.jdbc;

import lombok.Data;

//회원관리를 위한 member테이블
@Data
public class BoardDTO {

	private int idx;
	private String email;
	private String contents;
	private String categoryCode;
	private String regidate;
	private String title;
	private String contact;
	
	private String user_id;
	private String board_idx;
	
	
	private String searchField;
	private String searchTxt;

	private int start;
	private int end;
}
