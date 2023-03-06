package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class JourneyDTO {
	private int bot_idx;
	private String location; //위치
	private String j_intro; //소개
	private String notice; //알려드리는 말
	private String common_items; //공통 구비품목
	private String j_conservice; //편의서비스
	private String j_confacility; //편의시설
	private String traffic_info; //교통정보
	private String loging_policy; //숙소정책
	private String check_io; //체크인/아웃
	private String j_booking; //예약문의
	private String add_fare; //인원 추가요금
	private String add_bed; //침구류 추가요금
	private String breakfast_noti; //조식유의사항
	private String j_notice; //유의사항
	private String j_cancelfee; //취소수수료
	private String j_cancelnoti; //취소 유의사항
	private String j_title_image; //메인 이미지
	private String j_image1; //이미지1
	private String j_image2; //이미지2
	private String j_image3; //이미지3
	private String j_image4; //이미지4
}
