package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.ViewPath;
import service.AdminService;
import vo.AdminVO;

@Controller
public class AdminController {

	private AdminService adminService;
	
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	@RequestMapping("/admin/list")
	public String list(Model model) {
		
		List<AdminVO> list = adminService.WordList();

		
		model.addAttribute("list", list);
		
		return ViewPath.VIEW + "admin/list.jsp";
	}

	
}
























