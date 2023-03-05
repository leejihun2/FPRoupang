package com.edu.springboot.jdbc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IReviewService {

	public int reviewcount();
	public ArrayList<ReviewDTO>
	reviewList();	
	
	public int reviewWrite(ReviewDTO reviewDTO);
	
	
	//기존 게시물의 내용을 인출한다.
	public ReviewDTO reviewView(ReviewDTO reviewDTO);
}
