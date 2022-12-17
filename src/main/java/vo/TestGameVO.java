package vo;

public class TestGameVO {

	private int test_no;
	private int user_no;
	private int test_grade;
	
	public TestGameVO() {
		
	}

	public TestGameVO(int test_no, int user_no, int test_grade) {
		super();
		this.test_no = test_no;
		this.user_no = user_no;
		this.test_grade = test_grade;
	}

	public int getTest_no() {
		return test_no;
	}

	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getTest_grade() {
		return test_grade;
	}

	public void setTest_grade(int test_grade) {
		this.test_grade = test_grade;
	}
	
}
