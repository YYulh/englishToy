package dao;

import org.apache.ibatis.session.SqlSession;

public class TransDAO {
	private SqlSession sqlSession;
	
	public TransDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
