package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.IChatService;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.MemberDTO;
import com.edu.springboot.jdbc.Room;

@Controller
public class ChatController {
//	@Autowired
//	IChatService cdao;
//	
//	@Autowired
//	IMemberService dao;
//	
//	List<Room> roomList = new ArrayList<Room>();
//
//	
//	static int room_idx = 0;
//	
//	@RequestMapping("/chat")
//	public ModelAndView chat(HttpSession session, Model model) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("chat");
//		return mv;
//	}
//	
//	 //방 페이지
//	@RequestMapping("/supports/room.do")
//	public ModelAndView room(Room room, Model model, HttpSession session, Principal principal) {
//		ModelAndView mv = new ModelAndView();
//		
//		String email = principal.getName();
//		session.setAttribute("siteUserInfo", email);
//		if(session.getAttribute("siteUserInfo")==null) {
//			
//			mv.setViewName("auth/login");
//			
//			return mv;
//		}
//		String idx = dao.idx(email);
//		session.setAttribute("idx", idx);
//		String memberidx = (String)session.getAttribute("idx");
//		ArrayList<Room> selectList = cdao.getRoom(memberidx);
//		
//		String name =(String)session.getAttribute("siteUserInfo");
//		String username = dao.name(name);
//		model.addAttribute("username",username);
//		model.addAttribute("selectList",selectList);
//
//		mv.setViewName("chat/room");
//		
//		return mv;
//	}
//	//방 생성
//	@RequestMapping("/createRoom")
//	public @ResponseBody List<Room> createRoom(
//			@RequestParam HashMap<Object, Object> params,@RequestParam HashMap<Object, Object> paramsidx,
//				MemberDTO memberDTO, Room room, HttpSession session){
//		String roomName = (String) params.get("roomName");
////		int memberidx = Integer.parseInt((String) session.getAttribute("idx"));
//		int memberidx = Integer.parseInt((String) paramsidx.get("member_idx"));
//		System.out.println("가져온 멤버 아이디idx : "+roomName);
//		if(roomName != null && !roomName.trim().equals("")) {
//			room.setMember_idx(memberidx);
//			room.setRoomName(roomName);
//			room.setRoom_idx(++room_idx);
////				System.out.println("?ㅋㅋ"+session.getAttribute("idx"));
//			int createroom = cdao.createRoom(room);
//			System.out.println("추가된 행 : " + createroom);
//			roomList.add(room);
//		}	
//		return roomList;
//	}
//	
//	//방 정보가져오기
//	@RequestMapping("/getRoom")
//	public @ResponseBody List<Room> getRoom(Room room, Model model, HttpSession session, MemberDTO memberDTO){
//		
//		String memberidx = (String)session.getAttribute("idx");
//		
//		ArrayList<Room> selectList = cdao.getRoom(memberidx);
//		
//		model.addAttribute("selectList",selectList);
//		System.out.println(selectList);
//		
//		return roomList;
//	}
//	//채팅방
//	@RequestMapping("/moveChating")
//	public ModelAndView chating(@RequestParam HashMap<Object, Object> params, Model model, Room room, HttpSession session) {
//		
//		int room_idx = Integer.parseInt((String) params.get("room_idx"));
//		ModelAndView mv = new ModelAndView();
//		String name =(String)session.getAttribute("siteUserInfo");
//		String username = dao.name(name);
//		
//		model.addAttribute("username",username); 
//		List<Room> new_list = roomList.stream().filter(o->o.getRoom_idx()==room_idx).collect(Collectors.toList());
//		String start = "채팅이 시작되었습니다.";
//		
//		if(new_list != null && new_list.size() > 0) {
//			mv.addObject("roomName", params.get("roomName"));
//			mv.addObject("room_idx", params.get("room_idx"));
//			mv.setViewName("chat/chat");
//			model.addAttribute("start",start);
//		}
//		else {
//			ArrayList<Room> selectchat = cdao.getChating(room);
//			for (Room dto : selectchat) {
//				String temp = dto.getChatting().replace("\r\n", "<br/>");
//				dto.setChatting(temp);
//				model.addAttribute("selectchat",selectchat);
//			}
//			mv.setViewName("chat/chat");
//		}
//		return mv;
//	}
//	@RequestMapping("/admin/chat.do") 
//	public String chatting() {
//		
//		return "admin/chat";
//	}
	@RequestMapping("/chat")
	public void getChat2(HttpServletRequest request, @RequestParam String id) {
		
		HttpSession session = request.getSession();
		System.out.println("chat param id 값 출력 : "  + id);
		
		if (id.equals("guest")) {
			String name = "guest" + session.toString().substring(session.toString().indexOf("@"));
			session.setAttribute("sessionId", name);
		} else if(id.equals("master")) {
			String name = "master";
			session.setAttribute("sessionId", name);
		}
		
	}
	@RequestMapping("/chat/master")
	public String enterChatAsMaster(HttpServletRequest request) {

		return "/chat";
	}
}