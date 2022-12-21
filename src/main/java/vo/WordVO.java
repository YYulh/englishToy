package vo;

public class WordVO {

	private int word_no;
	private int user_no;
	private String word_name;
	private String word_mean;
	private String ediction_word;
	private String kdiction_word;
	
	
	public WordVO() {
		
	}
	
	public WordVO(int word_no, int user_no, String word_name, String word_mean,String ediction_word,String kdiction_word) {
		super();
		this.word_no = word_no;
		this.user_no = user_no;
		this.word_name = word_name;
		this.word_mean = word_mean;
		this.ediction_word = ediction_word;
		this.kdiction_word = kdiction_word;
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
	public String getWord_name() {
		return word_name;
	}
	public void setWord_name(String word_name) {
		this.word_name = word_name;
	}
	public String getWord_mean() {
		return word_mean;
	}
	public void setWord_mean(String word_mean) {
		this.word_mean = word_mean;
	}
	public String geteDiction_word() {
		return ediction_word;
	}
	public void seteDiction_word(String ediction_word) {
		this.ediction_word = ediction_word;
	}
	public String getkDiction_word() {
		return kdiction_word;
	}
	public void setkDiction_word(String kdiction_word) {
		this.kdiction_word=kdiction_word;
	}
	
}
