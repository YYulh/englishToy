package vo;

import java.sql.Date;

public class UserVO {
	
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_email;
	private Date user_date;
	
	public UserVO() {
	}

	public UserVO(int user_no, String user_id, String user_pw, String user_email, Date user_date) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.user_date = user_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Date getUser_date() {
		return user_date;
	}

	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}

	

	
	
}
