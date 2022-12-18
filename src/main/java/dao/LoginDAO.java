package dao;

import org.apache.ibatis.session.SqlSession;

public class LoginDAO {
	private SqlSession sqlSession;
	
	public LoginDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
