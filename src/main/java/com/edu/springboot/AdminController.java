package com.edu.springboot;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.filefilter.RegexFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.IMainImageService;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.ISupportsService;
import com.edu.springboot.jdbc.MainImageDTO;
import com.edu.springboot.jdbc.SellRightDTO;
import com.edu.springboot.jdbc.SupportsDTO;

@Controller
public class AdminController {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	ISupportsService daoo;

	@Autowired
	IMemberService member_dao;

	@Autowired
	IMainImageService image_dao;

	@RequestMapping("/admin/index.do")
	public String admin(Principal principal, HttpSession session, Model model) {

		String query = "SELECT SEARCH_WORD, to_char(SEARCH_REGIDATE,'HH24') AS SearchRegidate FROM search_log";
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(query);
        // 나이승 나이승 나이승
        try (PrintWriter writer = new PrintWriter(new FileWriter("C:\\Users\\82104\\search_log11.txt"))) {
            rows.stream().map(row -> {
                // 컬럼 이름을 바꿔줍니다.
                Map<String, Object> newRow = new HashMap<>();
                newRow.put("SearchWord", row.get("SEARCH_WORD"));
				newRow.put("SearchRegidate", row.get("SearchRegidate")+"시");
                
                return newRow;
            }).forEach(row -> {
                for (Map.Entry<String, Object> entry : row.entrySet()) {
                    writer.println((entry.getValue() != null ? entry.getValue().toString() : "null"));
                }
                writer.println();
            });
        } catch (IOException e) {
            e.printStackTrace();
        }

		String loginId = principal.getName();

		SellRightDTO dto = member_dao.LoginUser(loginId);

		String Authority = dto.getAuthority();

		if (Authority.equals("ROLE_seller")) {
			return "redirect:/productInsert";
		} else {
			model.addAttribute("member_idx", dto.getMember_idx());
			return "/admin/index";
		}
	}

	@RequestMapping("/admin/adminfaq.do")
	public String adminFaq(Model model, HttpServletRequest req) {
		String category = req.getParameter("categoryCode");
		String contact = req.getParameter("contact");

		ArrayList<SupportsDTO> lists = daoo.listPageSearch("faq", category);

		for (SupportsDTO dto : lists) {
			String temp = dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}

		model.addAttribute("contact", contact);
		model.addAttribute("category", category);
		model.addAttribute("lists", lists);
		return "admin/adminFaq";
	}

	@RequestMapping("/admin/adminnotice.do")
	public String blank1(Model model, HttpServletRequest req) {
		String category = req.getParameter("categoryCode");

		ArrayList<SupportsDTO> lists = daoo.listPageSearch("notice", category);

		for (SupportsDTO dto : lists) {
			String temp = dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}

		model.addAttribute("lists", lists);
		return "admin/adminNotice";
	}

	@RequestMapping("/admin/mainImageUpdate.do")
	public String mainImageGo(Model model) {

		ArrayList<MainImageDTO> image_dto = image_dao.select_images(1);

		model.addAttribute("image_dto", image_dto);

		System.out.println(image_dto);

		return "/admin/mainImage";
	}

	public String saveFile(MultipartFile file, String prevName) {
	    if (file == null || file.getSize() == 0) {
	        return prevName;
	    } 
	    
	    UUID uid = UUID.randomUUID();
	    String saveName = uid + "_" + file.getOriginalFilename();
	    // Save the file
	    String path = "";
	    try {
	        path = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
	    } catch (Exception e) {
	    }
	    File fileinfo = new File(path, saveName);
	    try {
	        file.transferTo(fileinfo);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return prevName;
	    }
	    return saveName;
	}

	@RequestMapping("/admin/mainImageUpdateAct.do")
	public String mainImageUpdate(MultipartHttpServletRequest req, Model model,
			@RequestParam("image1") MultipartFile image1, @RequestParam("image2") MultipartFile image2,
			@RequestParam("image3") MultipartFile image3, @RequestParam("image4") MultipartFile image4,
			@RequestParam("image5") MultipartFile image5, @RequestParam("image6") MultipartFile image6) {

		int idx = Integer.parseInt(req.getParameter("idx"));

		MainImageDTO dto = new MainImageDTO();
		MainImageDTO image_dto = image_dao.select_image(idx);

		dto.setImage1(saveFile(image1, image_dto.getImage1()));
		dto.setImage2(saveFile(image2, image_dto.getImage2()));
		dto.setImage3(saveFile(image3, image_dto.getImage3()));
		dto.setImage4(saveFile(image4, image_dto.getImage4()));
		dto.setImage5(saveFile(image5, image_dto.getImage5()));
		dto.setImage6(saveFile(image6, image_dto.getImage6()));

		int result = image_dao.mainImageUpdate(dto);

		return "/admin/index";
	}

	@RequestMapping("/admin/delete.do")
	public String delete(HttpServletRequest req, HttpSession session, Principal principal) {
		String email = principal.getName();
		session.setAttribute("siteUserInfo", email);
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:/myLogin.do";
		}
		int applyRow = daoo.delete(req.getParameter("idx"), email);

		System.out.println("삭제된 행의 갯수 : " + applyRow);

		return "redirect:/admin/index.do";
	}

	@RequestMapping("/admin/writeSupports.do")
	public String writeSupports(Model model, HttpSession session, HttpServletRequest req, Principal principal) {

		return "/admin/writeSupports";
	}

	@RequestMapping(value = "/admin/writeSupportsAction.do", method = RequestMethod.POST)
	public String writeSupportsAction(Model model, HttpServletRequest req, HttpSession session, Principal principal) {

		String email = principal.getName();
		int applyRow = daoo.writeSupports(req.getParameter("title"), email, req.getParameter("contents"),
				req.getParameter("categorycode"), req.getParameter("contact"));

		System.out.println("입력된행의갯수:" + applyRow);

		return "redirect:/admin/index.do";
	}

	@RequestMapping("/admin/modify.do")
	public ModelAndView modify(Model model, HttpServletRequest req, HttpSession session, SupportsDTO supportsDTO) {

		int idx = Integer.parseInt(req.getParameter("idx"));

		ModelAndView mv = new ModelAndView();

		SupportsDTO dto = daoo.view(idx);

		mv.addObject("dto", dto);
		mv.setViewName("/admin/modify");
		return mv;
	}

	@RequestMapping("/admin/modifyAction.do")
	public String modifyAction(Model model, HttpSession session, SupportsDTO supportsDTO, HttpServletRequest req) {

		String idxStr = req.getParameter("idx");
		if (idxStr == null) {
			return "error";
		}

		int idx = Integer.parseInt(idxStr);
		SupportsDTO dto = new SupportsDTO();
		dto.setIdx(idx);
		dto.setTitle(req.getParameter("title"));
		dto.setContents(req.getParameter("contents"));

		daoo.modifySupports(dto);

		return "redirect:/admin/index.do";
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
}
