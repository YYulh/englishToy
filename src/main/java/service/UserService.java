package service;

import dao.UserDAO;
import vo.WordVO;

public class UserService {

		private UserDAO userdao;
		
		public UserService(UserDAO userdao) {
			this.userdao = userdao;
		}
//		public int update(WordVO vo) {
//			return worddao.update(vo);
//		}

	}
