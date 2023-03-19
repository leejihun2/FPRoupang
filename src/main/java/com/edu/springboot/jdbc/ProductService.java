package com.edu.springboot.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductService {
	
	// 상품 목록 가져오기
	public ProductDTO product_list(int bot_idx);
	public ArrayList<ProductInfoDTO> product_info_list(int title_idx);
	
	// 상세 상품 목록 가져오기
	public ProductDTO select_product(int pi_idx);
	public ProductInfoDTO select_product_info(int pi_idx);
	
	// 분류 입력
	public int insert_bot_category(String title, int sub_idx, String company_name);
	
	// 상품 입력
	public int insert_product(ProductDTO productDTO);
	public int insert_product_info(ProductInfoDTO productInfoDTO);
	public int select_new_idx();
	
	// 선택한 상품 업데이트
	public int update_product(ProductDTO productDTO);
	public int update_product_info(ProductInfoDTO productInfoDTO);
	
	// 선택한 상품 관련 전체 삭제
	public int delete_product(List<String> idx);
	public int all_delete_product_info(List<String> pi_idx);
	public int delete_bot_cate(List<String> idx, String company_name);
	
	// 상세 상품 삭제
	public int delete_product_info(List<String>pi_idx, String company_name);
	
	// 해당 상품 이미지 이름 가져오기
	public ProductDTO product_image(int bot_idx);
	
	// 상품 제거시 이미지 삭제를 위한 이미지 이름 가져오기
	public ArrayList<ProductDTO> product_total_image(List<String> bot_idx);

	public ArrayList<TotalProductDTO> show_product_list(int sub_idx);
}