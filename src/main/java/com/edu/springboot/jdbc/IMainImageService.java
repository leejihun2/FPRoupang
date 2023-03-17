package com.edu.springboot.jdbc;



import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMainImageService {
	
	public int mainImageUpdate(MainImageDTO mainImageDTO);
	
	public MainImageDTO select_image(int idx);
	public ArrayList<MainImageDTO> select_images(int idx);
}
