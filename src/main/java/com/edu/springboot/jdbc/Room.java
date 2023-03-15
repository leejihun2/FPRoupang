package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class Room {
//		int roomNumber;
		private int room_idx;
		private int member_idx;
		private String chatting;
		private String roomName;
		private String regidate;
		
		@Override
		public String toString() {
			return "Room [room_idx=" + room_idx + ", member_idx=" + member_idx +"]";
		}	
	}
