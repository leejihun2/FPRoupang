package com.edu.springboot.jdbc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JourneyService {
	//상품 목록 가져오기
	public ArrayList<JourneyInfoDTO> journey_info_list(int title_idx);
	
	//상세 삼품 목록 가져오기
	public JourneyDTO journey_list(int bot_idx);
	public JourneyInfoDTO select_journey_info(int ji_idx);
	
	//상품 입력
	public int insert_bot_title(String title, int mid_idx, String company_name);
	public int insert_journey(JourneyDTO journeyDTO);
	public int insert_journey_info(JourneyInfoDTO journeyInfoDTO);
	public int select_new_idx();
	
	//선택한 상품 업데이트
	public int update_journey(JourneyDTO journeyDTO);
	public int update_journey_info(JourneyInfoDTO journeyInfoDTO); 
	
	//선택한 상품 관련 전체 삭제
	public int delete_journey(List<String> ji_idx);
	public int alldelete_journey_info(List<String> ji_idx);
	public int delete_bot_category_j(List<String> idx, String company_name);
	
	//상세 상품 삭제
	public int delete_journey_info(List<String> ji_idx, String company_name);

	//상품 이미지 수정 시 이전 이미지 삭제를 위한 이미지 이름 가져오기
	public JourneyDTO journey_image(int bot_idx);
	public JourneyInfoDTO journeyinfo_image(int bot_idx);
	
	//상품 제거시 이미지 삭제를 위한 이미지 이름 가져오기
	public ArrayList<JourneyDTO> journey_Total_image(List<String> bot_idx);
	public ArrayList<JourneyInfoDTO> journeyinfo_Total_image(List<String> bot_idx);
	
	public ArrayList<String> like_journey_List(String location);

	public ArrayList<String> like_journey_List_S(String title);
	
	public ArrayList<TotalJourneyDTO> show_journey_list(TotalJourneyDTO totaljourneyDTO);
	public ArrayList<TotalJourneyDTO> show_journey_list_s(TotalJourneyDTO totaljourneyDTO);

	public ArrayList<JourneyInfoDTO> journeyDetailSearch(JourneyInfoDTO journeyInfoDTO);
	
	public int log(String search_word);
}