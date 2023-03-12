package com.edu.springboot.jdbc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ISupportsService {
	
	

	public int getTotalCountSearch(String contact, String categoryCode);
	public ArrayList<SupportsDTO>
	listPageSearch(String contact, String categoryCode);

	public int inquiryCount(SupportsDTO supportsDTO);
	public ArrayList<SupportsDTO>
	inquirylist(SupportsDTO supportsDTO);

	public int write(@Param("_contents") String contents,
			@Param("_email") String email,
			@Param("_title") String title);

	
	public int writeSupports(@Param("_contents") String contents,
			@Param("_email") String email,
			@Param("_title") String title,
			@Param("_categorycode") String categorycode,
			@Param("_contact") String contact);
	
	
	
	public SupportsDTO view(SupportsDTO supportsDTO);
	
	public int delete(String idx, String email);
	
	
}
