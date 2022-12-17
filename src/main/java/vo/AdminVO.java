package vo;

public class AdminVO {
	private int kDiction_no;
	private String kDiction_word;
	private int kcnt;
	
	private int eDiction_no;
	private String eDiction_word;
	private int ecnt;
	
	public AdminVO() {
		
	}

	public AdminVO(int kDiction_no, String kDiction_word, int kcnt, int eDiction_no, String eDiction_word, int ecnt) {
		super();
		this.kDiction_no = kDiction_no;
		this.kDiction_word = kDiction_word;
		this.kcnt = kcnt;
		this.eDiction_no = eDiction_no;
		this.eDiction_word = eDiction_word;
		this.ecnt = ecnt;
	}

	public int getkDiction_no() {
		return kDiction_no;
	}

	public void setkDiction_no(int kDiction_no) {
		this.kDiction_no = kDiction_no;
	}

	public String getkDiction_word() {
		return kDiction_word;
	}

	public void setkDiction_word(String kDiction_word) {
		this.kDiction_word = kDiction_word;
	}

	public int getKcnt() {
		return kcnt;
	}

	public void setKcnt(int kcnt) {
		this.kcnt = kcnt;
	}

	public int geteDiction_no() {
		return eDiction_no;
	}

	public void seteDiction_no(int eDiction_no) {
		this.eDiction_no = eDiction_no;
	}

	public String geteDiction_word() {
		return eDiction_word;
	}

	public void seteDiction_word(String eDiction_word) {
		this.eDiction_word = eDiction_word;
	}

	public int getEcnt() {
		return ecnt;
	}

	public void setEcnt(int ecnt) {
		this.ecnt = ecnt;
	}
	
	
}
