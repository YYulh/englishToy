package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AdminVO;


public class AdminDAO {
		
	private SqlSession sqlSession;
		
	public AdminDAO(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;				
	}
	public List<AdminVO> WordList() {
		return sqlSession.selectList("admin.WordList");
	}

}
