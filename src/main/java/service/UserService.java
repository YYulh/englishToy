package service;

import dao.UserDAO;

public class UserService {

		private UserDAO userdao;
		
		public UserService(UserDAO userdao) {
			this.userdao = userdao;
		}
//		public MemberVO selectOne(int no) {
//			return updatedao.selectOne(no);
//		}

	}
