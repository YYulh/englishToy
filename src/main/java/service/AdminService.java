package service;

import java.util.List;

import dao.AdminDAO;
import vo.AdminVO;

public class AdminService {

		private AdminDAO admindao;
		
		public AdminService(AdminDAO admindao) {
			this.admindao = admindao;
		}
		public List<AdminVO> WordList() {
			return admindao.WordList();
		}


	}
