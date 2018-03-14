package care.dog.center.faq;

public class FAQ {
	
	private int listNum, num;
	private String memberId;
	private String subject;
	private String content;
	private int faqsort;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFaqsort() {
		return faqsort;
	}
	public void setFaqsort(int faqsort) {
		this.faqsort = faqsort;
	}

}
