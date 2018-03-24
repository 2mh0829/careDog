package care.dog.center.onefone;

public class OneFOneVo {
	private int num;
	private String memberId, email, tel, sort, content, qdate;
	private String answerId, acontent, adate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public String getAnswerId() {
		return answerId;
	}
	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	
	@Override
	public String toString() {
		return "OneFOneVo [num=" + num + ", memberId=" + memberId + ", email=" + email + ", tel=" + tel + ", sort="
				+ sort + ", content=" + content + ", qdate=" + qdate + ", answerId=" + answerId + ", acontent="
				+ acontent + ", adate=" + adate + "]";
	} 
	
}
