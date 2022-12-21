package service;


import dao.WordDAO;

public class WordService {

		private WordDAO worddao;
		
		public WordService(WordDAO worddao) {
			this.worddao = worddao;
		}
//		public MemberVO selectOne(int no) {
//			return updatedao.selectOne(no);
//		}
		
		public String selectOneE(){
			return worddao.selectOneE();
		}
		
		public String selectOneK(){
			return worddao.selectOneK();
		}
	}
