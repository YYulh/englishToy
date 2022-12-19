package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class JoinDAO {
	private SqlSession sqlSession;
	
	public JoinDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(UserVO vo) {
		return sqlSession.insert("join.insert",vo);
	}

	public String checkid(String id) {
		return sqlSession.selectOne("join.checkid",id);
	}
	
	
	
}
