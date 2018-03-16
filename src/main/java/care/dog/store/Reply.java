package care.dog.store;

public class Reply {
	
	private int listNum, num;//페이징
	
	private int replyId;
	private String replyContent;
	private int grade;
	private String created;
	private int productId;
	private String memberId;
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
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "Reply [listNum=" + listNum + ", num=" + num + ", replyId=" + replyId + ", replyContent=" + replyContent
				+ ", grade=" + grade + ", created=" + created + ", productId=" + productId + ", memberId=" + memberId
				+ "]";
	}

}
