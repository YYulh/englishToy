package vo;

public class WordVO {

	private int word_no;
	private int user_no;
	private String word_Ename;
	private String word_Kname;
	private String word_memo;
	private int word_like;
	public WordVO() {
		
	}
	public WordVO(int word_no, int user_no, String word_Ename, String word_Kname, String word_memo, int word_like) {
		super();
		this.word_no = word_no;
		this.user_no = user_no;
		this.word_Ename = word_Ename;
		this.word_Kname = word_Kname;
		this.word_memo = word_memo;
		this.word_like = word_like;
	}
	public int getWord_no() {
		return word_no;
	}
	public void setWord_no(int word_no) {
		this.word_no = word_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getWord_Ename() {
		return word_Ename;
	}
	public void setWord_Ename(String word_Ename) {
		this.word_Ename = word_Ename;
	}
	public String getWord_Kname() {
		return word_Kname;
	}
	public void setWord_Kname(String word_Kname) {
		this.word_Kname = word_Kname;
	}
	public String getWord_memo() {
		return word_memo;
	}
	public void setWord_memo(String word_memo) {
		this.word_memo = word_memo;
	}
	public int getWord_like() {
		return word_like;
	}
	public void setWord_like(int word_like) {
		this.word_like = word_like;
	}

	
	
}
