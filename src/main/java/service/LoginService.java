package service;

import dao.LoginDAO;

public class LoginService {
	private LoginDAO loginDao;
	
	public LoginService(LoginDAO loginDao) {
		this.loginDao = loginDao;
	}
}
