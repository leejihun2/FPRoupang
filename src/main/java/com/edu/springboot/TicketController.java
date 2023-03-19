package com.edu.springboot;


import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.CategoryDTO;
import com.edu.springboot.jdbc.CategoryService;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.IReviewService;
import com.edu.springboot.jdbc.ParameterTicketDTO;
import com.edu.springboot.jdbc.ReviewDTO;
import com.edu.springboot.jdbc.TempgoodsOrderDTO;
import com.edu.springboot.jdbc.TempgoodsService;
import com.edu.springboot.jdbc.TicketDTO;
import com.edu.springboot.jdbc.TicketInfoDTO;
import com.edu.springboot.jdbc.TicketService;
import com.edu.springboot.jdbc.TotalTicketDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class TicketController {
	
	@Autowired
	IReviewService dao;
	
	@Autowired
	CategoryService cate_dao;
	
	@Autowired
	TicketService ticket_dao;
	
	@Autowired
	TempgoodsService goods_dao;
	
	@Autowired
	IMemberService member_dao;
	
	@RequestMapping("/ticket_edit")
	public String ticket_edit(Model model, HttpServletRequest req) {
		int ti_idx = Integer.parseInt(req.getParameter("product_idx"));
		TicketInfoDTO ticketDetail = ticket_dao.select_ticket_info(ti_idx);
		SimpleDateFormat setDate = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date utilDate1 = (java.util.Date)setDate.parse(ticketDetail.getTi_duetime1());
			java.util.Date utilDate2 = (java.util.Date)setDate.parse(ticketDetail.getTi_duetime2());
			
			model.addAttribute("duetime1",setDate.format(utilDate1));
			model.addAttribute("duetime2",setDate.format(utilDate2));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("ticketDetail",ticketDetail);
		return "/admin/ticketInfoEdit";
	}
	
	@RequestMapping("/ticketinfo_editAction")
	public String ticket_editAction(HttpServletRequest req) {
		int product_idx = Integer.parseInt(req.getParameter("product_idx"));
		TicketInfoDTO dto = new TicketInfoDTO();
		dto.setTi_idx(product_idx);
		dto.setTi_title(req.getParameter("ti_title"));
		dto.setTi_price(Integer.parseInt(req.getParameter("ti_price")));
		dto.setTi_duetime1(req.getParameter("ti_duetime1"));
		dto.setTi_duetime2(req.getParameter("ti_duetime2"));
		dto.setTi_discount(Integer.parseInt(req.getParameter("ti_discount")));
		dto.setTi_intro(req.getParameter("ti_intro"));
		
		ticket_dao.update_ticket_info(dto);
		
		return "/admin/index";
	}
	
	@ResponseBody
	@RequestMapping("/editTicket")
	public ModelAndView edit_ticket(HttpServletRequest req) {
		int value = Integer.parseInt(req.getParameter("value"));
		ModelAndView mv = new ModelAndView();
		
		TicketDTO dto = ticket_dao.ticket_list(value);
		
		mv.addObject("dto",dto);
		mv.setViewName("/ticket/ticket_edit");
		return mv;
	}
	
	@RequestMapping("/editTicketAction")
	public String edit_ticket_action(MultipartFile[] sub_image, MultipartFile title_image, Model model, MultipartHttpServletRequest req) throws Exception { 

		int value = Integer.parseInt(req.getParameter("value"));

		TicketDTO dto = new TicketDTO();
		TicketDTO delete_dto = ticket_dao.ticket_image(value);
		if(!(title_image.getOriginalFilename().equals(""))) {
			dto.setT_title_image(saveFile(title_image));
			deleteFile(delete_dto.getT_title_image());
		}
		deleteFile(delete_dto.getT_image1());
		deleteFile(delete_dto.getT_image2());
		deleteFile(delete_dto.getT_image3());
		deleteFile(delete_dto.getT_image4());
		int index=1;
		for(MultipartFile f: sub_image) {
			if(!(f.getOriginalFilename().equals(""))) {
				String imgName = saveFile(f);
				switch(index) {
					case 1:dto.setT_image1(imgName); break;
					case 2:dto.setT_image2(imgName); break;
					case 3:dto.setT_image3(imgName); break;
					case 4:dto.setT_image4(imgName); break;
				}
				index++;
			}else {
				break;
			}
		}
		
		dto.setBot_idx(value);
		dto.setNotice(req.getParameter("notice"));
		dto.setT_booking(req.getParameter("t_booking"));
		dto.setT_cancelfee(req.getParameter("t_cancelfee"));
		dto.setT_cancelnoti(req.getParameter("t_cancelnoti"));
		String[] chkService = req.getParameterValues("t_conservice");
		String ServiceVal = "";
		for(int i = 0; i < chkService.length ; i++) {
		 	ServiceVal += chkService[i];
			if(i!=chkService.length-1) {
					 ServiceVal += ",";
			}
		}
		dto.setT_conservice(ServiceVal);
		String[] chkfac=req.getParameterValues("t_fac");
		String facVal = "";
		for(int i = 0 ; i < chkfac.length ; i++) {
				facVal += chkfac[i];
				if(i!=chkfac.length-1) {
					facVal += ",";
				}
		}
		dto.setT_incmatters(req.getParameter("t_incmatters"));
		dto.setT_intro(req.getParameter("t_intro"));
		dto.setT_notice(req.getParameter("t_notice"));
		dto.setT_fac(facVal);
		
		ticket_dao.update_ticket(dto);
			 
		return "/home";
	}
	
	public String deleteFile(String FileName) {
		
		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/")
					.toPath().toString();
			
			File delete_file = new File(path + File.separator + FileName);
			
			if(delete_file.exists()) {
				delete_file.delete();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "success";
	}
	
	public String saveFile(MultipartFile file) {
		UUID uid = UUID.randomUUID();
		String saveName = uid + "_" + file.getOriginalFilename();
		
		String path ="";
		try {
			path = ResourceUtils.getFile("classpath:static/uploads/")
					.toPath().toString(); 
		}catch (Exception e) {}
		
		File fileinfo = new File(path,saveName);
		
		try {
			file.transferTo(fileinfo);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return saveName;
	}
	
	@ResponseBody
	@RequestMapping("/category_list.do")
	public ArrayList<ParameterTicketDTO> cate_list(HttpServletRequest req, Model model){
		int sub_idx=0;
		if(!(req.getParameter("sub_idx")==null)) {
			sub_idx=Integer.parseInt(req.getParameter("sub_idx"));
		}
		String level = req.getParameter("level");
		if(level.equals("1")) {
			ArrayList<ParameterTicketDTO> sub_cate = cate_dao.select_cate(sub_idx);
			model.addAttribute("mid_cate_idx",sub_idx);
			return sub_cate;
		}else{
			String company_name=req.getParameter("company_name");
			ArrayList<ParameterTicketDTO> sub_cate = cate_dao.select_cate_bot(sub_idx,company_name);
			return sub_cate;
		}
	}
	@ResponseBody
	@RequestMapping("/category_list2")
	public ArrayList<ParameterTicketDTO> cate_list2(HttpServletRequest req, Model model){
		int sub_idx=0;
		if(!(req.getParameter("sub_idx")==null)) {
			sub_idx=Integer.parseInt(req.getParameter("sub_idx"));
		}
		
		ArrayList<ParameterTicketDTO> sub_cate = cate_dao.select_cate2(sub_idx);
		model.addAttribute("mid_cate_idx",sub_cate);
		
		return sub_cate;
	}
	
	@ResponseBody
	@RequestMapping("/ticketInfo")
	public TicketDTO select_ticket(HttpServletRequest req){
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx"));
		TicketDTO ticket = ticket_dao.ticket_list(bot_idx);
		return ticket;
	}

	@ResponseBody
	@RequestMapping("/ticketDetailInfo")
	public ArrayList<TicketInfoDTO> select_ticket_list(HttpServletRequest req){
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx"));
		ArrayList<TicketInfoDTO> ticketDetail = ticket_dao.ticket_info_list(bot_idx);
		return ticketDetail;
	}
	
	@RequestMapping("/ticketInsertAction")
	public ModelAndView ticket_insert2(MultipartFile[] sub_image, MultipartFile title_image, Model model, MultipartHttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();
		int value= Integer.parseInt(req.getParameter("value"));		
		String member_idx = req.getParameter("member_idx");
		TicketDTO t_dto = new TicketDTO();
		
		
		if(value==0) {
			ticket_dao.insert_bot_title(req.getParameter("bot_title"),
					Integer.parseInt(req.getParameter("mid_category")),
					req.getParameter("company_name"));
			
			t_dto.setT_title_image(saveFile(title_image));
			int index=1;
			for(MultipartFile f: sub_image) {
				String imgName = saveFile(f);
				switch(index) {
					case 1:t_dto.setT_image1(imgName); break;
					case 2:t_dto.setT_image2(imgName); break;
					case 3:t_dto.setT_image3(imgName); break;
					case 4:t_dto.setT_image4(imgName); break;
				}
				index++;
			}
				
			String[] chkService = req.getParameterValues("t_conservice");
			String ServiceVal = "";
			for(int i = 0 ; i < chkService.length ; i++) {
				ServiceVal += chkService[i];
				if(i!=chkService.length-1) {
					ServiceVal += ",";
				}
			}
			t_dto.setT_conservice(ServiceVal);
			String[] chkfac= req.getParameterValues("t_fac");
			String facVal = "";
			for(int i = 0 ; i < chkfac.length ; i++) {
				facVal += chkfac[i];
				if(i!=chkfac.length-1) {
					facVal += ",";
				}
			}
			t_dto.setT_fac(facVal);
			t_dto.setT_intro(req.getParameter("product_intro"));
			t_dto.setNotice(req.getParameter("notice"));
			t_dto.setT_notice(req.getParameter("product_notice"));
			t_dto.setT_incmatters(req.getParameter("t_incmatters"));
			t_dto.setT_booking(req.getParameter("product_booking"));
			t_dto.setT_cancelfee(req.getParameter("product_cancelfee"));
			t_dto.setT_cancelnoti(req.getParameter("product_cancelnoti"));
			t_dto.setMember_idx(member_idx);
			
			value=ticket_dao.select_new_idx();
		}
		try {
		TicketInfoDTO ti_dto = new TicketInfoDTO();
		ti_dto.setBot_idx(value);
		
		ti_dto.setTi_duetime1(req.getParameter("product_duetime1"));
		ti_dto.setTi_duetime2(req.getParameter("product_duetime2"));
		
		ti_dto.setTi_price(Integer.parseInt(req.getParameter("product_price")));
		ti_dto.setTi_title(req.getParameter("product_title"));
		ti_dto.setTi_intro(req.getParameter("product_intro"));
		ticket_dao.insert_ticket_info(ti_dto);
		}catch (Exception e) {}
		if(!(req.getParameter("product_intro").equals(""))) {
			ticket_dao.insert_ticket(t_dto);
		}
		
		mv.setViewName("redirect:/admin/index.do");
		
		return mv;
	}
	
	@RequestMapping("/all_delete_ticket")
	public String all_delete_ticket(HttpServletRequest req) {
		String company_name = req.getParameter("company_name");
		String value = req.getParameter("value");
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();
		
		for(int i = 0 ; i < list.length ; i++) {
			val.add(list[i]);
		}
		
		ArrayList<TicketDTO> total_image = ticket_dao.ticket_Total_image(val);
		ArrayList<String> image = new ArrayList<String>();
		
		for(int i = 0 ; i < total_image.size(); i++) {
			TicketDTO dto = total_image.get(i);
			image.add(dto.getT_title_image());
			if(dto.getT_image1()!=null) {
				image.add(dto.getT_image1());
				if(dto.getT_image2()!=null) {
					image.add(dto.getT_image2());
					if(dto.getT_image3()!=null) {
						image.add(dto.getT_image3());
						if(dto.getT_image4()!=null) {
							image.add(dto.getT_image4());
						}
					}
				}
			}
		}
		for(int i = 0 ; i < image.size(); i++) {
			deleteFile(image.get(i));
		}
		
		ticket_dao.delete_ticket(val);
		ticket_dao.alldelete_ticket_info(val);
		ticket_dao.delete_bot_category(val, company_name);
		
		return "redirect:/admin/index.do";
	}
	
	@RequestMapping("/detail_delete_ticket")
	public String delete(HttpServletRequest req) {
		String company_name = req.getParameter("company_name");
		String value = req.getParameter("value");
		
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();
		
		for(int i = 0 ; i < list.length ; i++) {
			val.add(list[i]);
		}
		
		ticket_dao.delete_ticket_info(val, company_name);
		return "redirect:/admin/index.do";
	}
	
	@RequestMapping("/ticket_List")
	public ModelAndView Show_Ticket_List(HttpServletRequest req) {
		int sub_idx = Integer.parseInt(req.getParameter("category"));
		
		String location = ""; 
		if(req.getParameter("location")!=null) {
			location = req.getParameter("location");
			ticket_dao.log(location);
		}
		
		ModelAndView mv = new ModelAndView();
		ArrayList<TotalTicketDTO> ticket_list = ticket_dao.show_ticket_list(sub_idx, location);
		String category_title = cate_dao.select_one_cate(sub_idx);
		mv.addObject("sub_idx",sub_idx);
		mv.addObject("category_title",category_title);
		mv.addObject("ticket_list", ticket_list);

		mv.setViewName("/ticket/ticketList");
		return mv;
	}
	
	@RequestMapping("/ticketDetail")
	public String movepage(HttpServletRequest req, Model model) {
		int value = Integer.parseInt(req.getParameter("value"));
		
		ReviewDTO totalstar = dao.starcount(value);
		model.addAttribute("totalstar", totalstar);
		ArrayList<ReviewDTO> lists = 
				dao.reviewList(value);
		
		for (ReviewDTO dto : lists) {
			String temp = dto.getReview()
					.replace("\r\n", "<br/>");
			dto.setReview(temp);
		}
		model.addAttribute("lists", lists);
		
		TicketDTO Total_Ticket = ticket_dao.ticket_list(value);
		model.addAttribute("Total_Ticket",Total_Ticket);
		
		model.addAttribute("Company_Addr",member_dao.GetCompanyAddr(Integer.parseInt(Total_Ticket.getMember_idx())));
		
		
		String category_title = cate_dao.select_bot_cate(value);
		model.addAttribute("t_title",category_title);
		
		ArrayList<TicketInfoDTO> Total_Ticket_info = ticket_dao.ticket_info_list(value);
		model.addAttribute("Total_Ticket_info",Total_Ticket_info);
		
		return "/ticket/ticket_detail_view";
	}
	
	@RequestMapping("/showModal")
	public String modalPopUp(HttpServletRequest req, Model model) {
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx")); 
		String title = cate_dao.select_bot_cate(bot_idx);


		
		model.addAttribute("title", title);
		model.addAttribute("seller_idx",req.getParameter("seller_idx"));
		
		ArrayList<TicketInfoDTO> Total_Ticket_info = ticket_dao.ticket_info_list(bot_idx);
		model.addAttribute("Total_Ticket_info",Total_Ticket_info);
		
		TicketDTO image = ticket_dao.ticket_image(bot_idx);
		model.addAttribute("goods_image",image.getT_title_image());
		
		return "/ticket/ticket_modal";
	}
	
	@ResponseBody
	@RequestMapping("/cellProduct")
	public String test(HttpServletRequest req, Principal principal) {
		String email = principal.getName();
		
		TempgoodsOrderDTO gdto = new TempgoodsOrderDTO();
		gdto.setBuyer_idx(member_dao.member_idx(email));
		gdto.setBot_idx(req.getParameter("bot_idx"));
		gdto.setPrice(Integer.parseInt(req.getParameter("price")));
		gdto.setAmount(Integer.parseInt(req.getParameter("amount")));
		gdto.setGoods_idx(req.getParameter("ti_idx"));
		gdto.setGoods_image(req.getParameter("goods_image"));
		gdto.setSeller_idx(req.getParameter("seller_idx"));
		gdto.setTop_title(req.getParameter("top_title"));
		gdto.setMain_title(req.getParameter("main_title"));
		gdto.setSorting(Integer.parseInt(req.getParameter("table_sort")));
		
		//상품 구매시 로그에 남기기
		int result = goods_dao.InsertOrder(gdto);
		int result2 = goods_dao.InsertOrderItem(gdto);
		
		if (result == 0 ) {
			System.out.println("insert 에러");
		}else {
			System.out.println("정상 동작");
		}
		
		return "/";
	}

}
