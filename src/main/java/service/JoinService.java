package service;

import dao.JoinDAO;
import vo.UserVO;

public class JoinService {
	private JoinDAO joinDao;
	
	public JoinService(JoinDAO joinDao) {
		this.joinDao = joinDao;
	}

	public int insert(UserVO vo) {
		return joinDao.insert(vo);
	}
	
	public String checkid(String id) {
		return joinDao.checkid(id);
	}
}
