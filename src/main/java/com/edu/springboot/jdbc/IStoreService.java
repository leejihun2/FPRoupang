package com.edu.springboot.jdbc;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IStoreService {

	//리뷰 작성
	public void reviewWrite(ReviewDTO reviewDTO);
	
	//리뷰 수정
	public void reviewModify(ReviewDTO reviewDTO);
}
