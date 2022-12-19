package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class LoginDAO {
	private SqlSession sqlSession;
	
	public LoginDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public Integer loginCheck(UserVO vo) {
		return sqlSession.selectOne("login.loginCheck",vo);
	}
	
	
}
