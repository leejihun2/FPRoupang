package com.edu.springboot;

import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.CategoryService;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.IReviewService;
import com.edu.springboot.jdbc.JourneyDTO;
import com.edu.springboot.jdbc.JourneyInfoDTO;
import com.edu.springboot.jdbc.JourneyService;
import com.edu.springboot.jdbc.ParameterJourneyDTO;
import com.edu.springboot.jdbc.ParameterTicketDTO;
import com.edu.springboot.jdbc.ReviewDTO;
import com.edu.springboot.jdbc.TempgoodsOrderDTO;
import com.edu.springboot.jdbc.TempgoodsService;
import com.edu.springboot.jdbc.TicketDTO;
import com.edu.springboot.jdbc.TicketInfoDTO;
import com.edu.springboot.jdbc.TotalJourneyDTO;
import com.edu.springboot.jdbc.TotalTicketDTO;

@Controller
public class JourneyController {

	@Autowired
	CategoryService cate_dao;

	@Autowired
	JourneyService journey_dao;

	@Autowired
	IReviewService dao;

	@Autowired
	TempgoodsService goods_dao;

	@RequestMapping("/journey_Main")
	public String joureny_Main() {

		return "/journey/journeyMain";
	}

	@RequestMapping("/journey_insert")
	public String journey_insert1(Model model, HttpServletRequest req) {
		int sub_idx = 0;
		if (!(req.getParameter("sub_idx") == null)) {
			sub_idx = Integer.parseInt(req.getParameter("sub_idx"));
		}
		model.addAttribute("cate", cate_dao.select_cate(sub_idx));
		return "/journey/journey_insert_bakup";
	}

	@RequestMapping("/journey_edit")
	public String journey_edit(Model model, HttpServletRequest req) {
		int ti_idx = Integer.parseInt(req.getParameter("product_idx"));
		JourneyInfoDTO journeyDetail = journey_dao.select_journey_info(ti_idx);
		SimpleDateFormat setDate = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date utilDate1 = (java.util.Date) setDate.parse(journeyDetail.getJi_duetime1());
			java.util.Date utilDate2 = (java.util.Date) setDate.parse(journeyDetail.getJi_duetime2());

			model.addAttribute("duetime1", setDate.format(utilDate1));
			model.addAttribute("duetime2", setDate.format(utilDate2));

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("journeyDetail", journeyDetail);
		return "/journey/journey_info_edit";
	}

	@RequestMapping("/journeyinfo_editAction")
	public String journey_editAction(MultipartHttpServletRequest req, MultipartFile[] sub_ji_image) throws Exception {
		int product_idx = Integer.parseInt(req.getParameter("product_idx"));
		JourneyInfoDTO dto = new JourneyInfoDTO();
		JourneyInfoDTO delete_dto = journey_dao.journeyinfo_image(product_idx);
		deleteFile(delete_dto.getJi_image1());
		deleteFile(delete_dto.getJi_image2());
		deleteFile(delete_dto.getJi_image3());
		deleteFile(delete_dto.getJi_image4());
		int index = 1;
		for (MultipartFile f : sub_ji_image) {
			if (!(f.getOriginalFilename().equals(""))) {
				String imgName = saveFile(f);
				switch (index) {
				case 1:
					dto.setJi_image1(imgName);
					break;
				case 2:
					dto.setJi_image2(imgName);
					break;
				case 3:
					dto.setJi_image3(imgName);
					break;
				case 4:
					dto.setJi_image4(imgName);
					break;
				}
				index++;
			} else {
				break;
			}
		}
		dto.setBot_idx(product_idx);
		dto.setJi_duetime1(req.getParameter("ji_duetime1"));
		dto.setJi_duetime2(req.getParameter("ji_duetime2"));
		dto.setJi_price(Integer.parseInt(req.getParameter("ji_price")));
		dto.setJi_title(req.getParameter("ji_title"));
		dto.setJi_adult(Integer.parseInt(req.getParameter("ji_adult")));
		dto.setJi_kid(Integer.parseInt(req.getParameter("ji_kid")));
		dto.setJi_roomnum(Integer.parseInt(req.getParameter("ji_roomnum")));
		dto.setJi_intro(req.getParameter("ji_intro"));

		journey_dao.update_journey_info(dto);

		return "/home";
	}

	@ResponseBody
	@RequestMapping("/editJourney")
	public ModelAndView edit_journey(HttpServletRequest req) {
		int value = Integer.parseInt(req.getParameter("value"));
		ModelAndView mv = new ModelAndView();

		JourneyDTO dto = journey_dao.journey_list(value);

		mv.addObject("dto", dto);
		mv.setViewName("/journey/journey_edit");
		return mv;
	}

	@RequestMapping("/editJourneyAction")
	public String edit_journey_action(MultipartFile[] sub_image, MultipartFile title_image, Model model,
			MultipartHttpServletRequest req) throws Exception {

		int value = Integer.parseInt(req.getParameter("value"));

		JourneyDTO dto = new JourneyDTO();
		JourneyDTO delete_dto = journey_dao.journey_image(value);
		System.out.println(title_image.getOriginalFilename());
		if (!(title_image.getOriginalFilename().equals(""))) {
			dto.setJ_title_image(saveFile(title_image));
			deleteFile(delete_dto.getJ_title_image());
		}
		deleteFile(delete_dto.getJ_image1());
		deleteFile(delete_dto.getJ_image2());
		deleteFile(delete_dto.getJ_image3());
		deleteFile(delete_dto.getJ_image4());
		int index = 1;
		for (MultipartFile f : sub_image) {
			if (!(f.getOriginalFilename().equals(""))) {
				String imgName = saveFile(f);
				switch (index) {
				case 1:
					dto.setJ_image1(imgName);
					break;
				case 2:
					dto.setJ_image2(imgName);
					break;
				case 3:
					dto.setJ_image3(imgName);
					break;
				case 4:
					dto.setJ_image4(imgName);
					break;
				}
				index++;
			} else {
				break;
			}
		}
		dto.setBot_idx(value);
		dto.setLocation(req.getParameter("location"));
		dto.setJ_intro(req.getParameter("j_intro"));
		dto.setNotice(req.getParameter("notice"));
		dto.setTraffic_info(req.getParameter("traffic_info"));
		dto.setLoging_policy(req.getParameter("loging_policy"));
		dto.setCheck_io(req.getParameter("check_io"));
		dto.setJ_booking(req.getParameter("j_booking"));
		dto.setJ_notice(req.getParameter("j_notice"));
		dto.setAdd_fare(req.getParameter("add_fare"));
		dto.setAdd_bed(req.getParameter("add_bed"));
		dto.setBreakfast_noti(req.getParameter("breakfast_noti"));
		dto.setJ_cancelfee(req.getParameter("j_cancelfee"));
		dto.setJ_cancelnoti(req.getParameter("j_cancelnoti"));

		String[] chkCommon = req.getParameterValues("common_items");
		String CommonVal = "";
		for (int i = 0; i < chkCommon.length; i++) {
			CommonVal += chkCommon[i];
			if (i != chkCommon.length - 1) {
				CommonVal += ",";
			}
		}
		dto.setCommon_items(CommonVal);

		String[] chkService = req.getParameterValues("j_conservice");
		String ServiceVal = "";
		for (int i = 0; i < chkService.length; i++) {
			ServiceVal += chkService[i];
			if (i != chkService.length - 1) {
				ServiceVal += ",";
			}
		}
		dto.setJ_conservice(ServiceVal);

		String[] chkfac = req.getParameterValues("j_confacility");
		String facVal = "";
		for (int i = 0; i < chkfac.length; i++) {
			facVal += chkfac[i];
			if (i != chkfac.length - 1) {
				facVal += ",";
			}
		}
		dto.setJ_confacility(facVal);

		journey_dao.update_journey(dto);

		return "/home";
	}
	public String saveFile(MultipartFile file) {
		UUID uid = UUID.randomUUID();
		String saveName = uid + "_" + file.getOriginalFilename();

		String path = "";
		try {
			path = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
		} 
		catch (Exception e) {
		}
		File fileinfo = new File(path, saveName);
		try {
			file.transferTo(fileinfo);
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
	}
	public String deleteFile(String FileName) {

		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();

			File delete_file = new File(path + File.separator + FileName);

			if (delete_file.exists()) {
				delete_file.delete();
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "success";
	}
	@ResponseBody
	@RequestMapping("/category_list.j")
	public ArrayList<ParameterJourneyDTO> cate_list(HttpServletRequest req, Model model) {
		int sub_idx = 0;
		if (!(req.getParameter("sub_idx") == null)) {
			sub_idx = Integer.parseInt(req.getParameter("sub_idx"));
		}
		String level = req.getParameter("level");

		if (level.equals("1")) {
			ArrayList<ParameterJourneyDTO> sub_cate = cate_dao.select_cate_j(sub_idx);
			model.addAttribute("mid_cate_idx", sub_idx);
			return sub_cate;
		} 
		else {
			String company_name = req.getParameter("company_name");
			ArrayList<ParameterJourneyDTO> sub_cate = cate_dao.select_cate_bot_j(sub_idx, company_name);
			System.out.println(sub_cate);
			return sub_cate;
		}
	}

//<<<<<<< HEAD
	@ResponseBody
	@RequestMapping("/journeyInfo")
	public JourneyDTO select_journey(HttpServletRequest req) {
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx"));
		System.out.println(bot_idx);
		JourneyDTO journey = journey_dao.journey_list(bot_idx);
		return journey;
	}

	@ResponseBody
	@RequestMapping("/journeyDetailInfo")
	public ArrayList<JourneyInfoDTO> select_journey_list(HttpServletRequest req) {
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx"));
		ArrayList<JourneyInfoDTO> journeyDetail = journey_dao.journey_info_list(bot_idx);
		return journeyDetail;
	}

	@RequestMapping("/journeyInsertAction")
	public ModelAndView journey_insert2(MultipartFile[] sub_image, MultipartFile title_image,
			MultipartFile[] sub_ji_image, Model model, MultipartHttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();
		int value = Integer.parseInt(req.getParameter("value"));
		System.out.println("됩니까");
		JourneyDTO j_dto = new JourneyDTO();
		if (value == 0) {
			journey_dao.insert_bot_title(req.getParameter("bot_title"),
					Integer.parseInt(req.getParameter("mid_category")), req.getParameter("company_name"));

			j_dto.setJ_title_image(saveFile(title_image));
			int index = 1;
			for (MultipartFile f : sub_image) {
				String imgName = saveFile(f);
				switch (index) {
				case 1:
					j_dto.setJ_image1(imgName);
					break;
				case 2:
					j_dto.setJ_image2(imgName);
					break;
				case 3:
					j_dto.setJ_image3(imgName);
					break;
				case 4:
					j_dto.setJ_image4(imgName);
					break;
				}
				index++;
			}

			String[] chkService = req.getParameterValues("j_conservice");
			String ServiceVal = "";
			for (int i = 0; i < chkService.length; i++) {
				ServiceVal += chkService[i];
				if (i != chkService.length - 1) {
					ServiceVal += ",";
				}
			}
			j_dto.setJ_conservice(ServiceVal);

			String[] chkfac = req.getParameterValues("j_confacility");
			String facVal = "";
			for (int i = 0; i < chkfac.length; i++) {
				facVal += chkfac[i];
				if (i != chkfac.length - 1) {
					facVal += ",";
				}
			}
			j_dto.setJ_confacility(facVal);

			String[] chkcom = req.getParameterValues("common_items");
			String comVal = "";
			for (int i = 0; i < chkcom.length; i++) {
				comVal += chkcom[i];
				if (i != chkcom.length - 1) {
					comVal += ",";
				}
			}
			j_dto.setCommon_items(comVal);

			j_dto.setLocation(req.getParameter("location"));
			j_dto.setJ_intro(req.getParameter("product_intro"));
			j_dto.setNotice(req.getParameter("product_notice"));
			j_dto.setTraffic_info(req.getParameter("traffic_info"));
			j_dto.setLoging_policy(req.getParameter("loging_policy"));
			j_dto.setCheck_io(req.getParameter("check_io"));
			j_dto.setJ_booking(req.getParameter("product_booking"));
			j_dto.setAdd_fare(req.getParameter("add_fare"));
			j_dto.setAdd_bed(req.getParameter("add_bed"));
			j_dto.setBreakfast_noti(req.getParameter("breakfast_noti"));
			j_dto.setJ_notice(req.getParameter("product_notice"));
			j_dto.setJ_cancelfee(req.getParameter("product_cancelfee"));
			j_dto.setJ_cancelnoti(req.getParameter("product_cancelnoti"));

			value = journey_dao.select_new_idx();

		}
		try {
			JourneyInfoDTO ji_dto = new JourneyInfoDTO();
			ji_dto.setBot_idx(value);
			ji_dto.setJi_duetime1(req.getParameter("product_duetime1"));
			ji_dto.setJi_duetime2(req.getParameter("product_duetime2"));
			ji_dto.setJi_price(Integer.parseInt(req.getParameter("product_price")));
			ji_dto.setJi_title(req.getParameter("product_title"));
			ji_dto.setJi_adult(Integer.parseInt(req.getParameter("ji_adult")));
			ji_dto.setJi_kid(Integer.parseInt(req.getParameter("ji_kid")));
			ji_dto.setJi_roomnum(Integer.parseInt(req.getParameter("ji_roomnum")));
			ji_dto.setJi_intro(req.getParameter("product_intro"));
			int index = 1;
			for (MultipartFile f : sub_ji_image) {
				String imgName = saveFile(f);
				switch (index) {
				case 1:
					ji_dto.setJi_image1(imgName);
					break;
				case 2:
					ji_dto.setJi_image2(imgName);
					break;
				case 3:
					ji_dto.setJi_image3(imgName);
					break;
				case 4:
					ji_dto.setJi_image4(imgName);
					break;
				}
				index++;
			}
			journey_dao.insert_journey_info(ji_dto);
		} catch (Exception e) {
		}

		if (!(req.getParameter("product_intro").equals(""))) {
			System.out.println(req.getParameter("product_intro"));
			journey_dao.insert_journey(j_dto);
		}
		mv.setViewName("/home");
		return mv;
	}

	@RequestMapping("/all_delete_journey")
	public String all_delete(HttpServletRequest req) {
		String company_name = req.getParameter("company_name");
		String value = req.getParameter("value");
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();

		for (int i = 0; i < list.length; i++) {
			val.add(list[i]);
		}

		ArrayList<JourneyDTO> total_image = journey_dao.journey_Total_image(val);
		ArrayList<JourneyInfoDTO> total_ji_image = journey_dao.journeyinfo_Total_image(val);
		ArrayList<String> image = new ArrayList<String>();
		ArrayList<String> image_ji = new ArrayList<String>();

		for (int i = 0; i < total_image.size(); i++) {
			JourneyDTO dto = total_image.get(i);
			image.add(dto.getJ_title_image());
			if (dto.getJ_image1() != null) {
				image.add(dto.getJ_image1());
				if (dto.getJ_image2() != null) {
					image.add(dto.getJ_image2());
					if (dto.getJ_image3() != null) {
						image.add(dto.getJ_image3());
						if (dto.getJ_image4() != null) {
							image.add(dto.getJ_image4());
						}
					}
				}
			}
		}
		for (int i = 0; i < image.size(); i++) {
			deleteFile(image.get(i));
		}
		for (int i = 0; i < total_image.size(); i++) {
			JourneyInfoDTO dto = total_ji_image.get(i);
			if (dto.getJi_image1() != null) {
				image_ji.add(dto.getJi_image1());
				if (dto.getJi_image2() != null) {
					image_ji.add(dto.getJi_image2());
					if (dto.getJi_image3() != null) {
						image_ji.add(dto.getJi_image3());
						if (dto.getJi_image4() != null) {
							image_ji.add(dto.getJi_image4());
						}
					}
				}
			}
		}
		for (int i = 0; i < image_ji.size(); i++) {
			deleteFile(image_ji.get(i));
		}

		journey_dao.delete_journey(val);
		journey_dao.alldelete_journey_info(val);
		journey_dao.delete_bot_category_j(val, company_name);

		return "/home";
	}

	@RequestMapping("/detail_delete_journey")
	public String delete(HttpServletRequest req) {
		String company_name = req.getParameter("company_name");
		String value = req.getParameter("value");

		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();

		for (int i = 0; i < list.length; i++) {
			val.add(list[i]);
		}

		journey_dao.delete_journey_info(val, company_name);
		return "/home";
	}

	@RequestMapping("/journeyView")
	public String view() {

		return "journey/journeyView";
	}

	@RequestMapping("/journey_List")
	public ModelAndView show_Journey_List(HttpServletRequest req, HttpSession session,
			TotalJourneyDTO totaljourneyDTO) {
		ModelAndView mv = new ModelAndView();
		int sub_idx = Integer.parseInt(req.getParameter("category"));
		String location = req.getParameter("location");
		String title = req.getParameter("title");
		String ji_duetime1 = "";
		String ji_duetime2 = "";
		int ji_adult = 2;
		int ji_kid = 0;
		if(location!=null) {
			journey_dao.log(location);
		}
		System.out.println(sub_idx);
		if (location != null) {

			ArrayList<String> like_loc = journey_dao.like_journey_List(location);

			mv.addObject("like_loc", like_loc);
		} else if (title != null) {

			ArrayList<TotalJourneyDTO> search_list = cate_dao.search_journey_List(sub_idx, title);

			mv.addObject("search_list", search_list);
		}

		if (session.getAttribute("ji_duetime1") != null) {
			totaljourneyDTO.setJi_duetime1((String) session.getAttribute("ji_duetime1"));
			totaljourneyDTO.setJi_duetime2((String) session.getAttribute("ji_duetime2"));
			System.out.println(session.getAttribute("ji_duetime1"));
			System.out.println(session.getAttribute("ji_duetime2"));
		} else {
			totaljourneyDTO.setJi_duetime1(ji_duetime1);
			totaljourneyDTO.setJi_duetime2(ji_duetime2);
			System.out.println(ji_duetime1);
			System.out.println(ji_duetime2);
		}
		if (session.getAttribute("ji_adult") != null) {
			totaljourneyDTO.setJi_adult(Integer.parseInt((String) (session.getAttribute("ji_adult"))));
			System.out.println(session.getAttribute("ji_adult"));

		} else {
			totaljourneyDTO.setJi_kid(ji_adult);
			System.out.println(ji_adult);
		}
		if (session.getAttribute("ji_kid") != null) {
			totaljourneyDTO.setJi_kid(Integer.parseInt((String) (session.getAttribute("ji_kid"))));
			System.out.println(session.getAttribute("ji_kid"));
		} else {
			totaljourneyDTO.setJi_kid(ji_kid);
			System.out.println(ji_kid);
		}
		
		totaljourneyDTO.setSub_idx(sub_idx);

		System.out.println("성인 :"+ totaljourneyDTO.getJi_adult());
      System.out.println("어린이 :"+ totaljourneyDTO.getJi_kid());
      System.out.println("시작일 :"+ totaljourneyDTO.getJi_duetime1());
      System.out.println("종료일 :"+ totaljourneyDTO.getJi_duetime2());

		String category_title = cate_dao.select_one_cate(sub_idx);

		ArrayList<TotalJourneyDTO> journey_list = journey_dao.show_journey_list(totaljourneyDTO);

		System.out.println(journey_list);

		mv.addObject("sub_idx", sub_idx);

		mv.addObject("category_title", category_title);

		mv.addObject("journey_list", journey_list);

		mv.setViewName("/journey/journeyList");

		session.removeAttribute("ji_adult");
		session.removeAttribute("ji_kid");
		session.removeAttribute("ji_duetime1");
		session.removeAttribute("ji_duetime2");

		return mv;
	}

	// 인원 설정
	@RequestMapping("/personnel")
	@ResponseBody
	public String personnel(HttpSession session, String ji_adult, String ji_kid, HttpServletRequest req) {

		session.setAttribute("ji_adult", ji_adult);
		session.setAttribute("ji_kid", ji_kid);
		System.out.println(session.getAttribute("ji_adult"));
		System.out.println(session.getAttribute("ji_kid"));

		return "/journey/journeyList";
	}

	// 예약일 설정
	@RequestMapping(value = "/dateSave", method = RequestMethod.POST)
	@ResponseBody
	public String dateSave(HttpSession session, @RequestBody Map<String, String> map, HttpServletRequest req) {

		String ji_duetime1 = map.get("ji_duetime1");
		String ji_duetime2 = map.get("ji_duetime2");

		session.setAttribute("ji_duetime1", ji_duetime1);

		session.setAttribute("ji_duetime2", ji_duetime2);

		System.out.println("시작날짜" + session.getAttribute("ji_duetime1"));
		System.out.println("종료날짜" + session.getAttribute("ji_duetime2"));

		return "/journey/journeyList";
	}

	@RequestMapping("/journeyDetail")
	public String movepage(HttpServletRequest req, Model model, JourneyDTO journeyDTO) {
		int value = Integer.parseInt(req.getParameter("value"));

		ReviewDTO totalstar = dao.starcount();
		model.addAttribute("totalstar", totalstar);
		ArrayList<ReviewDTO> lists = dao.reviewList();

		for (ReviewDTO dto : lists) {
			String temp = dto.getReview().replace("\r\n", "<br/>");
			dto.setReview(temp);
		}
		model.addAttribute("lists", lists);

		JourneyDTO Total_Journey = journey_dao.journey_list(value);
//		System.out.println(Total_Journey);
		model.addAttribute("Total_Journey", Total_Journey);

		String category_title = cate_dao.select_bot_cate(value);
		model.addAttribute("j_title", category_title);

		ArrayList<JourneyInfoDTO> Total_Journey_info = journey_dao.journey_info_list(value);
		for (JourneyInfoDTO dto : Total_Journey_info) {
			String temp = dto.getJi_intro().replace("\r\n", "<br/>");
			dto.setJi_intro(temp);
//			System.out.println(temp);
		}
		model.addAttribute("Total_Journey_info", Total_Journey_info);
//		System.out.println(Total_Journey);

		return "/journey/journey_detail_view";
	}

	@ResponseBody
	@RequestMapping("/cellProduct_j")
	public String test(HttpServletRequest req) {
		TempgoodsOrderDTO gdto = new TempgoodsOrderDTO();
		gdto.setBot_idx(req.getParameter("ji_idx"));
		gdto.setPrice(Integer.parseInt(req.getParameter("price")));
		gdto.setAmount(Integer.parseInt(req.getParameter("amount")));

		// 상품 구매시 로그에 남기기
		int result = goods_dao.InsertOrder(gdto);
		int result2 = goods_dao.InsertOrderItem(gdto);

		if (result == 0) {
			System.out.println("insert 에러");
		} else {
			System.out.println("정상 동작");
		}

		return "/";
	}
	@RequestMapping("/showModalRoom")
	public String modalPopUp(HttpServletRequest req, Model model) {
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx")); 
		String title = cate_dao.select_bot_cate(bot_idx);
		model.addAttribute("title", title);
		
		JourneyDTO Total_Journey = journey_dao.journey_list(bot_idx);
		model.addAttribute("Total_Journey", Total_Journey);
		
		System.out.println(Total_Journey);
		
		ArrayList<JourneyInfoDTO> Total_Journey_info = journey_dao.journey_info_list(bot_idx);
		model.addAttribute("Total_Journey_info",Total_Journey_info);
		
//		TicketDTO image = journey_dao.ticket_image(bot_idx);
//		model.addAttribute("goods_image",image.getT_title_image());
		
		return "/journey/journey_modal";
	}
	@ResponseBody
	@RequestMapping("/detailSearch")
	public List<JourneyInfoDTO> journeyDetailSearch(HttpServletRequest req, @RequestParam int bot_idx, @RequestParam int ji_adult, 
	        @RequestParam int ji_kid, @RequestParam String ji_duetime1, @RequestParam String ji_duetime2, Model model,
	        JourneyInfoDTO journeyInfoDTO) {

	    System.out.println(ji_duetime1);
	    System.out.println(ji_duetime2);
	    System.out.println(bot_idx);
	    System.out.println(ji_adult);
	    System.out.println(ji_kid); 
	    	
	    journeyInfoDTO.setBot_idx(bot_idx);
	    journeyInfoDTO.setJi_adult(ji_adult);
	    journeyInfoDTO.setJi_kid(ji_kid); 
	    journeyInfoDTO.setJi_duetime1(ji_duetime1);
	    journeyInfoDTO.setJi_duetime2(ji_duetime2);
	    
	    ArrayList<JourneyInfoDTO> Total_Journey_info = journey_dao.journeyDetailSearch(journeyInfoDTO);
	    model.addAttribute(Total_Journey_info);
	    System.out.println(Total_Journey_info);
	    
	    
	    return Total_Journey_info;
	}


}