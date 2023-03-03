package com.edu.springboot.jdbc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TicketService {
	//상품 목록 가져오기
	public ArrayList<TicketInfoDTO> ticket_info_list(int title_idx);
	
	//상세 삼품 목록 가져오기
	public TicketDTO ticket_list(int bot_idx);
	public TicketInfoDTO select_ticket_info(int ti_idx);
	
	//상품 입력
	public int insert_bot_title(String title, int mid_idx, String company_name);
	public int insert_ticket(TicketDTO ticketDTO);
	public int insert_ticket_info(TicketInfoDTO ticketInfoDTO);
	public int select_new_idx();
	
	//선택한 상품 업데이트
	public int update_ticket(TicketDTO ticketDTO);
	public int update_ticket_info(TicketInfoDTO ticketInfoDTO); 
	
	//선택한 상품 관련 전체 삭제
	public int delete_ticket(List<String> ti_idx);
	public int alldelete_ticket_info(List<String> ti_idx);
	public int delete_bot_category(List<String> idx, String company_name);
	
	//상세 상품 삭제
	public int delete_ticket_info(List<String> ti_idx, String company_name);

	//상품 이미지 수정 시 이전 이미지 삭제를 위한 이미지 이름 가져오기
	public TicketDTO ticket_image(int bot_idx);
	
	//상품 제거시 이미지 삭제를 위한 이미지 이름 가져오기
	public ArrayList<TicketDTO> ticket_Total_image(List<String> bot_idx);
	
	//상품 소비자에게 출력
	public ArrayList<TotalTicketDTO> show_ticket_list(int sub_idx, String location);
}