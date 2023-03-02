package com.edu.springboot;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.CategoryDTO;
import com.edu.springboot.jdbc.CategoryService;
import com.edu.springboot.jdbc.ParameterTicketDTO;
import com.edu.springboot.jdbc.TicketDTO;
import com.edu.springboot.jdbc.TicketInfoDTO;
import com.edu.springboot.jdbc.TicketService;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class TicketController {
	
	@Autowired
	CategoryService cate_dao;
	
	@Autowired
	TicketService ticket_dao;
	
	@RequestMapping("/ticket_insert")
	public String ticket_insert1(Model model, HttpServletRequest req) {
		int sub_idx=0;
		if(!(req.getParameter("sub_idx")==null)) {
			sub_idx = Integer.parseInt(req.getParameter("sub_idx"));
		}
		model.addAttribute("cate",cate_dao.select_cate(sub_idx));
		return "/ticket/ticket_insert";
	}
	
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
		return "/ticket/ticket_info_edit";
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
		
		return "/home";
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
	public String edit_ticket_action(HttpServletRequest req) {
		//최대 사이즈 5M
		int size = 1024 * 1024 * 5;
		
		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/")
					.toPath().toString();
			
			MultipartRequest multi = new MultipartRequest(req, path, size, 
					"UTF-8", new DefaultFileRenamePolicy()); 
			
			int value = Integer.parseInt(multi.getParameter("value"));
			
			List<String> val = new ArrayList<String>();
			val.add(multi.getParameter("value"));
			
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
			File file;
			for(int i = 0 ; i < image.size(); i++) {
				file = new File(path + File.separator + image.get(i));
				if(file.exists()) {
					file.delete();
				}
			}

			TicketDTO dto = new TicketDTO();
			Enumeration files = multi.getFileNames();
			int idx = 1;
			while(files.hasMoreElements()) {
				String str = (String)files.nextElement();
				if(multi.getOriginalFileName(str)!=null) {
					if(str.equals("t_title_image")) {
						dto.setT_title_image(multi.getFilesystemName(str));
					}else {
						switch(idx) {
						case 1:dto.setT_image1(multi.getFilesystemName(str)); break;
						case 2:dto.setT_image2(multi.getFilesystemName(str)); break;
						case 3:dto.setT_image3(multi.getFilesystemName(str)); break;
						case 4:dto.setT_image4(multi.getFilesystemName(str)); break;
						}
						idx++;
					}
				}
			}
			dto.setBot_idx(value);
			dto.setNotice(multi.getParameter("notice"));
			dto.setT_booking(multi.getParameter("t_booking"));
			dto.setT_cancelfee(multi.getParameter("t_cancelfee"));
			dto.setT_cancelnoti(multi.getParameter("t_cancelnoti"));
			String[] chkService = multi.getParameterValues("t_conservice");
			String ServiceVal = "";
			for(int i = 0; i < chkService.length ; i++) {
			 	ServiceVal += chkService[i];
				if(i!=chkService.length-1) {
						 ServiceVal += ",";
				}
			}
			dto.setT_conservice(ServiceVal);
			String[] chkfac=multi.getParameterValues("t_fac");
			String facVal = "";
			for(int i = 0 ; i < chkfac.length ; i++) {
					facVal += chkfac[i];
					if(i!=chkfac.length-1) {
						facVal += ",";
					}
			}
			dto.setT_incmatters(multi.getParameter("t_incmatters"));
			dto.setT_intro(multi.getParameter("t_intro"));
			dto.setT_notice(multi.getParameter("t_notice"));
			dto.setT_fac(facVal);
			ticket_dao.update_ticket(dto);
			 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/home";
	}
	
	@ResponseBody
	@RequestMapping("/category_list.do")
	public ArrayList<ParameterTicketDTO> cate_list(HttpServletRequest req){
		int sub_idx=0;
		if(!(req.getParameter("sub_idx")==null)) {
			sub_idx=Integer.parseInt(req.getParameter("sub_idx"));
		}
		String level = req.getParameter("level");
		if(level.equals("1")) {
			ArrayList<ParameterTicketDTO> sub_cate = cate_dao.select_cate(sub_idx);
			return sub_cate;
		}else{
			String company_name=req.getParameter("company_name");
			ArrayList<ParameterTicketDTO> sub_cate = cate_dao.select_cate_bot(sub_idx,company_name);
			return sub_cate;
		}
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
	public ModelAndView ticket_insert2(Model model, HttpServletRequest req) {
		int size = 1024 * 1024 * 5;
		ModelAndView mv = new ModelAndView();
		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/")
					.toPath().toString();
			
			MultipartRequest multi = new MultipartRequest(req, path, size, 
					"UTF-8", new DefaultFileRenamePolicy()); 
			
			int value= Integer.parseInt(req.getParameter("value"));		
			TicketDTO t_dto = new TicketDTO();
			if(value==0) {
				ticket_dao.insert_bot_title(multi.getParameter("bot_title"),
						Integer.parseInt(multi.getParameter("mid_category")),
						multi.getParameter("company_name"));
				
				Enumeration files = multi.getFileNames();
				int idx = 1;
				while(files.hasMoreElements()) {
					String str = (String)files.nextElement();
					if(multi.getOriginalFileName(str)!=null) {
						if(str.equals("t_title_image")) {
							t_dto.setT_title_image(multi.getFilesystemName(str));
						}else {
							switch(idx) {
							case 1:t_dto.setT_image1(multi.getFilesystemName(str)); break;
							case 2:t_dto.setT_image2(multi.getFilesystemName(str)); break;
							case 3:t_dto.setT_image3(multi.getFilesystemName(str)); break;
							case 4:t_dto.setT_image4(multi.getFilesystemName(str)); break;
							}
							idx++;
						}
					}
				}
				String[] chkService = multi.getParameterValues("t_conservice");
				String ServiceVal = "";
				for(int i = 0 ; i < chkService.length ; i++) {
					ServiceVal += chkService[i];
					if(i!=chkService.length-1) {
						ServiceVal += ",";
					}
				}
				t_dto.setT_conservice(ServiceVal);
				String[] chkfac= multi.getParameterValues("t_fac");
				String facVal = "";
				for(int i = 0 ; i < chkfac.length ; i++) {
					facVal += chkfac[i];
					if(i!=chkfac.length-1) {
						facVal += ",";
					}
				}
				t_dto.setT_fac(facVal);
				t_dto.setT_intro(multi.getParameter("t_intro"));
				t_dto.setNotice(multi.getParameter("notice"));
				t_dto.setT_notice(multi.getParameter("t_notice"));
				t_dto.setT_incmatters(multi.getParameter("t_incmatters"));
				t_dto.setT_booking(multi.getParameter("t_booking"));
				t_dto.setT_cancelfee(multi.getParameter("t_cancelfee"));
				t_dto.setT_cancelnoti(multi.getParameter("t_cancelnoti"));

				value=ticket_dao.select_new_idx();
			
			}
			try {
			TicketInfoDTO ti_dto = new TicketInfoDTO();
			ti_dto.setBot_idx(value);
			ti_dto.setTi_duetime1(multi.getParameter("ti_duetime1"));
			ti_dto.setTi_duetime2(multi.getParameter("ti_duetime2"));
			ti_dto.setTi_price(Integer.parseInt(multi.getParameter("ti_price")));
			ti_dto.setTi_title(multi.getParameter("ti_title"));
			ti_dto.setTi_intro(multi.getParameter("ti_intro"));
			ticket_dao.insert_ticket_info(ti_dto);
			}catch (Exception e) {}
			if(!(multi.getParameter("t_intro").equals(""))) {
				ticket_dao.insert_ticket(t_dto);
			}
			mv.setViewName("/home");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/all_delete_ticket")
	public String all_delete(HttpServletRequest req) {
		String company_name = req.getParameter("company_name");
		String value = req.getParameter("value");
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();
		
		for(int i = 0 ; i < list.length ; i++) {
			val.add(list[i]);
		}
		
		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/")
					.toPath().toString();
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
			File file;
			for(int i = 0 ; i < image.size(); i++) {
				file = new File(path + File.separator + image.get(i));
				if(file.exists()) {
					file.delete();
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		ticket_dao.delete_ticket(val);
		ticket_dao.alldelete_ticket_info(val);
		ticket_dao.delete_bot_category(val, company_name);
		
		return "/home";
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
		return "/home";
	}
}
