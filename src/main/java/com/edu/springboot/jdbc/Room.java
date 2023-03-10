package com.edu.springboot.jdbc;


public class Room {
//		int roomNumber;
		private int room_idx;
		private int member_idx;
		private String chatting;
		private String roomName;
		
		public int getMember_idx() {
			return member_idx;
		}
		public void setMember_idx(int member_idx) {
			this.member_idx = member_idx;
		}
		
		public String getChatting() {
			return chatting;
		}
		public void setChatting(String chatting) {
			this.chatting = chatting;
		}
		public String getRoomName() {
			return roomName;
		}
		public void setRoomName(String roomName) {
			this.roomName = roomName;
		}
		public int getRoom_idx() {
			return room_idx;
		}
		public void setRoom_idx(int room_idx) {
			this.room_idx = room_idx;
		}
		
		@Override
		public String toString() {
			return "Room [room_idx=" + room_idx + ", member_idx=" + member_idx + "]";
		}	
	}
