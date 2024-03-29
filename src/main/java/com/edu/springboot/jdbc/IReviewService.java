package com.edu.springboot.jdbc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IReviewService {

	public int reviewcount();
	public ArrayList<ReviewDTO>
	reviewList(int bot_idx);	
	
	public int reviewWrite(ReviewDTO reviewDTO);
	
	public ReviewDTO starcount(int bot_idx);
	
	//기존 게시물의 내용을 인출한다.
	public ReviewDTO reviewView(ReviewDTO reviewDTO);
	
	public ReviewDTO view(int idx);
	
	public ArrayList<CategoryDTO> order();
	
	public int modifyReview(ReviewDTO reviewDTO);
	
	public int delete(String idx);
}
