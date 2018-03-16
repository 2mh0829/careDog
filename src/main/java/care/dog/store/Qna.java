package care.dog.store;

public class Qna {
	
	private int listNum; //페이징
	
	private int qnaId;
	private String question;
	private String answer;
	private String qCreated, aCreated; //질문작성일, 답변작성일
	private int isAnswered; //답변유무
	private int productId;
	private String memberId;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getQnaId() {
		return qnaId;
	}
	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getqCreated() {
		return qCreated;
	}
	public void setqCreated(String qCreated) {
		this.qCreated = qCreated;
	}
	public String getaCreated() {
		return aCreated;
	}
	public void setaCreated(String aCreated) {
		this.aCreated = aCreated;
	}
	public int getIsAnswered() {
		return isAnswered;
	}
	public void setIsAnswered(int isAnswered) {
		this.isAnswered = isAnswered;
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
		return "Qna [listNum=" + listNum + ", qnaId=" + qnaId + ", question=" + question + ", answer=" + answer
				+ ", qCreated=" + qCreated + ", aCreated=" + aCreated + ", isAnswered=" + isAnswered + ", productId="
				+ productId + ", memberId=" + memberId + "]";
	}
	
}
