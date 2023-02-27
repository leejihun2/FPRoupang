package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.springboot.jdbc.BoardDTO;
import com.edu.springboot.jdbc.IBoardService;

import util.PagingUtil;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	@RequestMapping("/board/returnPolicy.do")
	public String returnPolicy() {
		return "/board/returnPolicy";
	}


	
	
	@Autowired
	IBoardService daoo;
	
	@RequestMapping("/board/faq.do")
	public String lists(Model model, HttpServletRequest req) {
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setSearchField(req.getParameter("searchField"));
		boardDTO.setSearchTxt(req.getParameter("searchTxt"));
		boardDTO.setCategoryCode(req.getParameter("categoryCode"));
		
		//검색어가 있는 경우 파라미터를 저장한 DTO를 Mapper로 전달한다.
		//이를 통해 where절을 <if>문으로 조건부로 삽입할 수 있다.
		int totalRecordCount = 
				daoo.getTotalCountSearch(boardDTO);
		
		//페이지 관련 설정값
		int pageSize = 4; //한 페이지당 게시물 수
		int blockPage = 2;//한 블럭당 페이지번호 수
		
		//전체 페이지수 계산
		//int totalPage = (int) Math.ceil((double) totalRecordCount / blockPage);
		
		//현재 페이지 번호 가져오기
		int nowPage = (req.getParameter("nowPage") == null 
				|| req.getParameter("nowPage").equals("")) 
				? 1	: Integer.parseInt(req.getParameter("nowPage"));
		
		//출력할 페이지의 구간 계산
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		//계산된 값은 DTO객체에 저장.
		boardDTO.setStart(start);
		boardDTO.setEnd(end);
		
		ArrayList<BoardDTO> lists = 
				daoo.listPageSearch(boardDTO);
		
		//페이지번호 바로가기 문자열 처리(기존의 클래스를 그대로 사용한다.)
		String pagingImg = 
				PagingUtil.pagingImg(totalRecordCount, pageSize, 
						blockPage, nowPage,
						req.getContextPath()+"/board/faq.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리(방명록은 내용보기가 별도로 없고, 목록에 내용이 바로 출력된다.)
		for (BoardDTO dto : lists) {
			String temp = dto.getContents()
					.replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		
		//출력할 내용을 모델객체에 저장한 후 뷰를 호출한다.
		model.addAttribute("lists", lists);
		return "board/faq";
	}
	
	@RequestMapping("/board/notice.do")
	public String lists2() {
		return "/board/notice";
	}
	
	@RequestMapping("/board/write.do")
	public String write(Model model, HttpSession session,
			HttpServletRequest req) {
		if(session.getAttribute("siteUserInfo")==null)
		{
			model.addAttribute("backUrl", "board/write");
			return "redirect:login.do";
		}
		
		return "board/write";
	}
	
	// 글쓰기 처리
	@RequestMapping(value = "/board/writeAction.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, HttpSession session, Principal principal) {

		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		/*
		 * 전송된 파라미터를 이용해서 쓰기 처리를 위해 write()메서드를 호출한다. 이 때 아이디의 경우 세션영역에 저장되어 있으므로 형변환 후
		 * getter()를 통해 아이디를 읽어온다. 메서드 실행후 정수형 반환값을 통해 입력 성공/실패 여부를 확인 할 수 있다.
		 * ((MemberDTO)session.getAttribute("siteUserInfo")).getEmail()
		 * model.addAttribute("email", email); session.setAttribute("siteUserInfo",
		 * email);
		 */
		String email = principal.getName();
		int applyRow = daoo.write(req.getParameter("contents"), 
								email, 
								req.getParameter("title"));
		System.out.println("입력된행의갯수:" + applyRow);

		return "redirect:faq.do?categoryCode";
	}
	
	@RequestMapping("/myLogin.do")
	public String login1(Principal principal, Model model) {
		try {
			String user_id = principal.getName();
			model.addAttribute("user_id", user_id);
		}
		catch (Exception e) {
			System.out.println("로그인 전입니다.");
		}
		return "auth/login";
	}
	
	
	@RequestMapping("/myError.do")
	public String login2() {		
		return "auth/error";
	}

	@RequestMapping("/denied.do")
	public String login3() {		
		return "auth/denied";
	}
	
	
}
