package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.WordVO;


public class WordDAO {
		
	private SqlSession sqlSession;
		
	public WordDAO(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;				
	}
//	public int delete(int no) {
//		return sqlSession.delete("delete.delete",no);
//	}
	public String selectOneE() {
		return sqlSession.selectOne("word.selectOneE");
	}
	
	public String selectOneK(){
		return sqlSession.selectOne("word.selectOneK");
	}

}
