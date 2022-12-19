package service;

import dao.LoginDAO;
import vo.UserVO;

public class LoginService {
	private LoginDAO loginDao;
	
	public LoginService(LoginDAO loginDao) {
		this.loginDao = loginDao;
	}

	public Integer loginCheck(UserVO vo) {
		return loginDao.loginCheck(vo);
	}
	
	
}
