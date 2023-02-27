package com.edu.springboot.jdbc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IBoardService {
	
	

	//기존 리스트에 검색기능을 추가했으므로 매개변수를 DTO로 변경한다.
	//해당 DTO객체에는 검색어와 페이지구간 대한 값이 저장된다.
	public int getTotalCountSearch(String contact, String categoryCode);
	public ArrayList<BoardDTO>
	listPageSearch(String contact, String categoryCode);

	/*
	@Param어노테이션에서 지정한 별칭을 사용해서 인파라미터를 처리한다.
	매퍼에서는 #{별칭} 과 같은 형태로 쿼리문에 사용하면 된다.
	또한 입력을 위한 <insert> 엘리먼트는 쿼리실행 후 결과값을 정수로
	반환하므로 반환타입을 명시하는것이 좋다.
	 */
	public int write(@Param("_contents") String contents,
			@Param("_email") String email,
			@Param("_title") String title);
	
	//기존 게시물의 내용을 인출한다.
	public BoardDTO view(BoardDTO BoardDTO);
	
	public int delete(String idx, String email);
	//Mapper에서 Map 사용하기 
	public ArrayList<BoardDTO> hashMapUse(Map<String, String> hMap);

	public ArrayList<BoardDTO> arrayListUse(List<String> aList);
	
}
