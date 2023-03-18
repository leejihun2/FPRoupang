package com.edu.springboot.jdbc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IReviewService {

	public int reviewcount();
	public ArrayList<ReviewDTO>
	reviewList(int bot_idx);	
	
	public int reviewWrite(ReviewDTO reviewDTO);
	
	public ReviewDTO starcount();
	
	public ReviewDTO view(int idx);
	
	public ArrayList<CategoryDTO> order();
	
	public int modifyReview(ReviewDTO reviewDTO);
	
	public int delete(String idx);
}
