package com.edu.springboot;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.CategoryService;
import com.edu.springboot.jdbc.ParameterProductDTO;
import com.edu.springboot.jdbc.ProCategoryDTO;
import com.edu.springboot.jdbc.ProductDTO;
import com.edu.springboot.jdbc.ProductInfoDTO;
import com.edu.springboot.jdbc.ProductService;
import com.edu.springboot.jdbc.TotalProductDTO;


@Controller
public class ProductController {

	
	@Autowired
	ProductService product_dao;
	
	@Autowired
	CategoryService pcategory_dao;
	
	
	@RequestMapping("/product_insert")
	public String product_insert1(Model model, HttpServletRequest req) {
		int sub_idx=0;
		if(!(req.getParameter("sub_idx")==null)) {
			sub_idx = Integer.parseInt(req.getParameter("sub_idx"));
		}
		model.addAttribute("cate",pcategory_dao.select_cate_mid(sub_idx));
		return "/product_insert";
	}
	
	@RequestMapping("/product_edit")
	public String product_edit(Model model, HttpServletRequest req) {
		int p_idx = Integer.parseInt(req.getParameter("product_idx"));
		ProductDTO productDetail = product_dao.select_product(p_idx);
		SimpleDateFormat setDate = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date utilDate1 = (java.util.Date)setDate.parse(productDetail.getP_duetime());
			java.util.Date utilDate2 = (java.util.Date)setDate.parse(productDetail.getP_pro_date());
			
			model.addAttribute("p_duetime", utilDate1);
			model.addAttribute("p_pro_date", utilDate2);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("productDetail", productDetail);
		return "/admin/productInfoEdit";
	}
	
	@RequestMapping("/productinfo_editAction")
	public String product_editAction(MultipartHttpServletRequest req) {
		int product_idx = Integer.parseInt(req.getParameter("product_idx"));
		ProductInfoDTO dto = new ProductInfoDTO();
		dto.setPi_idx(product_idx);
		dto.setPi_title(req.getParameter("pi_title"));
		dto.setPi_amount(Integer.parseInt(req.getParameter("pi_amount")));
		dto.setPi_cellcount(Integer.parseInt(req.getParameter("pi_cellcount")));
		dto.setPi_delicom(req.getParameter("pi_delicom"));
		dto.setPi_delifee(Integer.parseInt(req.getParameter("pi_delifee")));
		dto.setPi_discount(Integer.parseInt(req.getParameter("pi_discount")));
		dto.setPi_grade(Integer.parseInt(req.getParameter("pi_grade")));
		dto.setPi_isrocket(Integer.parseInt(req.getParameter("pi_isrocket")));
		dto.setPi_sugcount(Integer.parseInt(req.getParameter("pi_sugcount")));
		dto.setPi_price(Integer.parseInt(req.getParameter("pi_price")));
		
		product_dao.update_product_info(dto);
		
		return "/admin/index";
	}
	
	@ResponseBody
	@RequestMapping("/editProduct")
	public ModelAndView edit_product(HttpServletRequest req) {
		int value = Integer.parseInt(req.getParameter("value"));
		ModelAndView mv = new ModelAndView();
		
		ProductDTO dto = product_dao.product_list(value);
		mv.addObject("dto", dto);
		mv.setViewName("/product/product_edit");
		
		return mv;
	}
	
	@RequestMapping("/edipProductAction")
	public String edit_product_action(MultipartFile[] sub_image, MultipartFile title_image, Model model, HttpServletRequest req) {
		
		int value = Integer.parseInt(req.getParameter("value"));
		
		ProductDTO dto = new ProductDTO();
		ProductDTO delete_dto = product_dao.product_image(value);
		if(!(title_image.getOriginalFilename().equals(""))) {
			dto.setP_title_image(saveFile(title_image));
			deleteFile(delete_dto.getP_title_image());
		}
		deleteFile(delete_dto.getP_image1());
		deleteFile(delete_dto.getP_image2());
		deleteFile(delete_dto.getP_image3());
		deleteFile(delete_dto.getP_image4());
		int index = 1;
		for(MultipartFile f: sub_image) {
			if(!(f.getOriginalFilename().equals("")))  {
				String imgName = saveFile(f);
				switch(index) {
					case 1:dto.setP_image1(imgName); break;
					case 2:dto.setP_image2(imgName); break;
					case 3:dto.setP_image3(imgName); break;
					case 4:dto.setP_image4(imgName); break;
				}
				index++;
			}
			else {
				break;
			}
		}
		dto.setBot_idx(value);
		dto.setP_as_info(req.getParameter("p_as_info"));
		dto.setP_assurance(req.getParameter("p_assurance"));
		dto.setP_callnum(req.getParameter("p_callnum"));
		dto.setP_caution(req.getParameter("p_caution"));
		dto.setP_composition(req.getParameter("p_composition"));
		dto.setP_cup_num(req.getParameter("p_cup_num"));
		dto.setP_duetime(req.getParameter("p_duetime"));
		dto.setP_pro_country(req.getParameter("p_pro_country"));
		dto.setP_pro_date(req.getParameter("p_pro_date"));
		dto.setP_production(req.getParameter("p_production"));
		dto.setP_size(req.getParameter("p_size"));
		dto.setP_useway(req.getParameter("p_useway"));
		
		product_dao.update_product(dto);
		
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
			
		}
		catch (Exception e) {
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
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		File fileinfo = new File(path,saveName);
		
		try {
			file.transferTo(fileinfo);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
	}
	
	@ResponseBody
	@RequestMapping("/category_list_p")
	public ArrayList<ParameterProductDTO> cate_list(HttpServletRequest req, Model model) {
		int sub_idx = 0;
		if (!(req.getParameter("sub_idx") == null)) {
			sub_idx = Integer.parseInt(req.getParameter("sub_idx"));
		}
		String level = req.getParameter("level");
		
		if (level.equals("1")) {
			ArrayList<ParameterProductDTO> sub_cate = pcategory_dao.select_cate_mid(sub_idx);
			model.addAttribute("mid_cate_idx", level);
			return sub_cate;
		}
		else {
			String company_name = req.getParameter("company_name");
			ArrayList<ParameterProductDTO> sub_cate = pcategory_dao.select_cate_bot_p(sub_idx, company_name);
			return sub_cate;
		}
	}
	
	@ResponseBody
	@RequestMapping("/productInfo")
	public ProductDTO select_product(HttpServletRequest req) {
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx"));
		ProductDTO product = product_dao.product_list(bot_idx);
		return product;
	}
	
	@ResponseBody
	@RequestMapping("/productDetailInfo")
	public ArrayList<ProductInfoDTO> select_product_list(HttpServletRequest req) {
		int bot_idx = Integer.parseInt(req.getParameter("bot_idx"));
		ArrayList<ProductInfoDTO> productDetail = product_dao.product_info_list(bot_idx);
		return productDetail;
	}
	
	@RequestMapping("/productInsertAction")
	public ModelAndView product_insert2(MultipartFile[] sub_image,
			@RequestParam(value="p_title_image", required = false) MultipartFile title_image,
			Model model, MultipartHttpServletRequest req) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		int value = Integer.parseInt(req.getParameter("value"));
		ProductDTO dto = new ProductDTO();
		
		if (value == 0) {
			product_dao.insert_bot_category(req.getParameter("p_title"),
					Integer.parseInt(req.getParameter("mid_category")),
					req.getParameter("company_name"));
			
			value = product_dao.select_new_idx();
			dto.setP_title_image(saveFile(title_image));
			int idx = 1;
			for (MultipartFile f : sub_image) {
				String imgName = saveFile(f);
				switch(idx) {
				case 1: dto.setP_image1(imgName); break;
				case 2: dto.setP_image2(imgName); break;
				case 3: dto.setP_image3(imgName); break;
				case 4: dto.setP_image4(imgName); break;
				}
				idx++;
			}
			dto.setBot_idx(value);
			dto.setP_as_info(req.getParameter("p_as_info"));
			dto.setP_assurance(req.getParameter("p_assurance"));
			dto.setP_callnum(req.getParameter("p_callnum"));
			dto.setP_caution(req.getParameter("p_caution"));
			dto.setP_composition(req.getParameter("p_composition"));
			dto.setP_cup_num(req.getParameter("p_cup_num"));
			dto.setP_duetime(req.getParameter("p_duetime"));
			dto.setP_pro_country(req.getParameter("p_pro_country"));
			dto.setP_pro_date(req.getParameter("p_pro_date"));
			dto.setP_production(req.getParameter("p_production"));
			dto.setP_size(req.getParameter("p_size"));
			dto.setP_title(req.getParameter("p_title"));
			dto.setP_useway(req.getParameter("p_useway"));
			
		}
		try {
			ProductInfoDTO pi_dto = new ProductInfoDTO();
			pi_dto.setBot_idx(value);
			pi_dto.setPi_amount(Integer.parseInt(req.getParameter("pi_amount")));
			pi_dto.setPi_delicom(req.getParameter("pi_delicom"));
			pi_dto.setPi_delifee(Integer.parseInt(req.getParameter("pi_delifee")));
			pi_dto.setPi_discount(Integer.parseInt(req.getParameter("pi_discount")));
			pi_dto.setPi_isrocket(Integer.parseInt(req.getParameter("pi_isrocket")));
			pi_dto.setPi_price(Integer.parseInt(req.getParameter("pi_price")));
			pi_dto.setPi_title(req.getParameter("pi_title"));
			
			product_dao.insert_product_info(pi_dto);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		if(!(req.getParameter("p_cup_num").equals(""))) {
			product_dao.insert_product(dto);
		}
		mv.setViewName("/home");
		return mv;
	}
	
	@RequestMapping("/all_delete_product")
	public String all_delete(HttpServletRequest req) {
		String company_name = req.getParameter("company_name");
		String value = req.getParameter("value");
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();
		
		for (int i = 0; i < list.length; i++) {
			val.add(list[i]);
		}
		
		ArrayList<ProductDTO> total_image = product_dao.product_total_image(val);
		ArrayList<String> image = new ArrayList<String>();
		
		for (int i = 0; i < total_image.size(); i++) {
			ProductDTO dto = total_image.get(i);
			image.add(dto.getP_title_image());
			if(dto.getP_image1()!=null) {
				image.add(dto.getP_image1());
				if(dto.getP_image2()!=null) {
					image.add(dto.getP_image2());
					if(dto.getP_image3()!=null) {
						image.add(dto.getP_image3());
						if(dto.getP_image4()!=null) {
							image.add(dto.getP_image4());
						}
					}
				}
			}
		}
		for (int i = 0; i < image.size(); i++) {
			deleteFile(image.get(i));
		}
		product_dao.delete_product(val);
		product_dao.delete_product_info(val, company_name);
		
		return "/home";
	}
	
	@RequestMapping("/detail_delete_product")
	public String delete(HttpServletRequest req) {
		String company_name = req.getParameter("company_name");
		String value = req.getParameter("value");
		
		System.out.println(value +","+ company_name);
		String[] list = value.split(",");
		List<String> val = new ArrayList<String>();
		
		for (int i = 0; i < list.length; i++) {
			val.add(list[i]);
		}
		
		product_dao.delete_product_info(val, company_name);
		return "/home";
	}
	
	@RequestMapping("/product_List")
	public ModelAndView Show_Product_List(HttpServletRequest req) {
		int sub_idx = Integer.parseInt(req.getParameter("category"));
		
		ModelAndView mv = new ModelAndView();
		ArrayList<TotalProductDTO> product_list = product_dao.show_product_list(sub_idx);
		String category_title = pcategory_dao.select_one_cate(sub_idx);
		
		mv.addObject("sub_idx", sub_idx);
		mv.addObject("category_title", category_title);
		mv.addObject("product_list", product_list);
		
		mv.setViewName("/product/productList");
		
		return mv;
	}
	
	//////////////////////////////////////////////////////////////////
	
}
