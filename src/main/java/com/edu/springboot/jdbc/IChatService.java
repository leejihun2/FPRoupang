package com.edu.springboot.jdbc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IChatService {
	
	//채팅룸 생성
	public int createRoom(Room room);
	
	//채팅을 주고 받을때 db에 저장
	public int savechatting(Room room);

	public ArrayList<Room> getRoom(String memberidx);
	
	public ArrayList<Room> getChating(Room room);
}
