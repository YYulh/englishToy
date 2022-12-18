package service;

import java.util.List;

import dao.WordDAO;
import vo.AdminVO;
import vo.WordVO;

public class WordService {

		private WordDAO worddao;
		
		public WordService(WordDAO worddao) {
			this.worddao = worddao;
		}
		public List<WordVO> userWordList(int user_no) {
			return worddao.userWordList(user_no);
		}
		public int update(WordVO vo) {
			return worddao.update(vo);
		}
		public String getMemo(int word_no) {
			return worddao.getMemo(word_no);
		}
		public int delete(int word_no) {
			return worddao.delete(word_no);
		}
		public List<AdminVO> meaningList(String word_name) {
			return worddao.meaningList(word_name);
		}
		public int insert(WordVO vo) {
			return worddao.insert(vo);
		}

	}
