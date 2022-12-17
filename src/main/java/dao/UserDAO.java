package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;


public class UserDAO {
		
	private SqlSession sqlSession;
		
	public UserDAO(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;				
	}
//	public int delete(int no) {
//		return sqlSession.delete("delete.delete",no);
//	}
}
