package care.dog.dog119.dogHealthVo;

public class DhReplyVo {
	private int boardNum;
	private String memberId;
	private String dhReplyContent;
	private String created;
	
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getDhReplyContent() {
		return dhReplyContent;
	}
	public void setDhReplyContent(String dhReplyContent) {
		this.dhReplyContent = dhReplyContent;
	}
	@Override
	public String toString() {
		return "DhReplyVo [boardNum=" + boardNum + ", memberId=" + memberId + ", dhReplyContent=" + dhReplyContent
				+ ", created=" + created + "]";
	}
	
}
