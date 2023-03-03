package com.edu.springboot.jdbc;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IReviewService {

	public int reviewWrite(String goods_title	,String ccomment ,String star_rate ,String servey1
			,String servey2	,String servey3	,String summary);
	
	
	
	//기존 게시물의 내용을 인출한다.
	public ReviewDTO reviewView(ReviewDTO reviewDTO);
}
