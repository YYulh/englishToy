package vo;

public class GradeVO {

	private int grade_no;
	private String grade_name;
	
	public GradeVO() {
		
	}

	public GradeVO(int grade_no, String grade_name) {
		super();
		this.grade_no = grade_no;
		this.grade_name = grade_name;
	}

	public int getGrade_no() {
		return grade_no;
	}

	public void setGrade_no(int grade_no) {
		this.grade_no = grade_no;
	}

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	
	
}
