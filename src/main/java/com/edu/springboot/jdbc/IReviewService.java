package com.edu.springboot.jdbc;

import org.apache.ibatis.annotations.Param;

public interface IReviewService {

	public int write(@Param("_contents") String contents,
			@Param("_email") String email,
			@Param("_title") String title);
	
	
	
	//기존 게시물의 내용을 인출한다.
	public ReviewDTO view(ReviewDTO reviewDTO);
}
