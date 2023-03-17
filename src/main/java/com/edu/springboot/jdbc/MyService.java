package com.edu.springboot.jdbc;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

//컨트롤러와 DAO 사이에서 매개 역할

@Mapper
public interface MyService {

	//회원전체목록
	
	////////////////회원관리/////////////////////////
	
	public MyDTO selectOne(String email);
	
	// * 수정하기 
	public int update(MyDTO myDTO);
	
	// * 회원 삭제 
	public int memberDelete(MyDTO myDTO);
	
	public MyDTO memberInfo(String id);
	
	
	////////////////주소관리/////////////////////////
	
	//주소리스트
	public MyDTO adselectOne(String address);
	
	public MyDTO adselect(String address);
	
	//주소 수정
	public int adupdate(MyDTO myDTO);
	
	//주소 수정 2
	public int adinsert(MyDTO myDTO);
	
	//주소 삭제
	public int addelete(MyDTO myDTO);

	
	
	////////////////찜 리스트 /////////////////////////
	
	
//	public List<WishDTO>sewishlist();
//	public List<WishDTO>wishdelete();
//	public List<WishDTO>addwish();
	
//	public int addwish(WishDTO wishDTO);
//	public String wishdelete(WishDTO wishDTO);
//	public List<TicketInfoDTO>wishlist();
//	public int addwish(WishDTO wishDTO);
//	public String wishdelete(WishDTO wishDTO);
//	
	
	
// 	찜하기 ( 추가 )
	public int insert(TicketInfoDTO ticketInfoDTO);
	
	// 찜 목록 확인
	public List<TicketInfoDTO> tiList();
	
	public String deletewish(String ti_idx);
	
	// 찜 목록 1개 삭제
	public boolean delete(@Param("cno")Long cno, @Param("userid")String userid);
	
	// 게시물삭제시 전체삭제
	public boolean deleteAllByCno(Long cno);
	
	// 이미 찜한 게시물인지 조회
	public TicketInfoDTO getByCnoWithUserid(@Param("vo")TicketInfoDTO ticketInfoDTO);
}
	
	
