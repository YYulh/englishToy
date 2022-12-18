package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AdminVO;
import vo.WordVO;


public class WordDAO {
		
	private SqlSession sqlSession;
		
	public WordDAO(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;				
	}
	public List<WordVO> userWordList(int user_no) {
		return sqlSession.selectList("word.userWordList",user_no);
	}
	public int update(WordVO vo) {
		return sqlSession.update("word.update",vo);
	}
	public String getMemo(int Word_no) {
		return sqlSession.selectOne("word.getMemo",Word_no);
	}
	public int delete(int Word_no) {
		return sqlSession.delete("word.delete",Word_no);
	}
	public List<AdminVO> meaningList(String Word_name) {
		return sqlSession.selectList("word.meaningList",Word_name);
	}
	public int insert(WordVO vo) {
		return sqlSession.insert("word.insert",vo);
	}
	public int updateLike(WordVO vo) {
		return sqlSession.update("word.updateLike",vo);
	}
}
