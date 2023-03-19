package com.edu.springboot.jdbc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMainService {
	
	
	ArrayList<TotalJourneyDTO> adDigital_list();
	ArrayList<TotalJourneyDTO> adBeauty_list();
	ArrayList<TotalJourneyDTO> adJourney_list();
	ArrayList<TotalJourneyDTO> todayShop();
	ArrayList<TotalJourneyDTO> likeCate();
	ArrayList<TotalJourneyDTO> todayDiscovery();
}
