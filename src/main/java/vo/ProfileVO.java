package vo;

public class ProfileVO {

	private int profile_no;
	private int user_no;
	private String profile_filename;
	
	public ProfileVO() {
		
	}
	
	public ProfileVO(int profile_no, int user_no, String profile_filename) {
		super();
		this.profile_no = profile_no;
		this.user_no = user_no;
		this.profile_filename = profile_filename;
	}
	public int getProfile_no() {
		return profile_no;
	}
	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getProfile_filename() {
		return profile_filename;
	}
	public void setProfile_filename(String profile_filename) {
		this.profile_filename = profile_filename;
	}
	
	
}
