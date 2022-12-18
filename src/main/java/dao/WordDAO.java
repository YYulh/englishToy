package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;


public class WordDAO {
		
	private SqlSession sqlSession;
		
	public WordDAO(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;				
	}
//	public int delete(int no) {
//		return sqlSession.delete("delete.delete",no);
//	}
	

}
