package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class SellerDTO {

	private int member_idx;
	private String business_num;
	private String one_rep_co_rep;
	private String rep_name;
	private String company_name;
	private String office_zipcode;
	private String office_address;
	private String ebuis_report_num;
	private String shop_manager_name;
	private String whichBank;
	private String accountHolder;
	private String bank_account;
	private int situation;
}
