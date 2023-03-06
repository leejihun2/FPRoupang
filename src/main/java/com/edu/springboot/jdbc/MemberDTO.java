package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class MemberDTO {

	private int member_idx;
	private String email;
	private String name;
	private String password;
	private String phone_number;
	private String jumin_num;
	private String marketing_agreement;
	private String membership;
}
