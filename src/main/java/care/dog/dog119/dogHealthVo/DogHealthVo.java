package care.dog.dog119.dogHealthVo;

public class DogHealthVo {

	private int boardNum;
	private String title;
	private String content;
	private String created;
	private int hitCount;
	private int dhReplyNum;
	private String dhReplyContent;
	private String dhReplyCreated;
	private String memberId;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getDhReplyNum() {
		return dhReplyNum;
	}
	public void setDhReplyNum(int dhReplyNum) {
		this.dhReplyNum = dhReplyNum;
	}
	public String getDhReplyContent() {
		return dhReplyContent;
	}
	public void setDhReplyContent(String dhReplyContent) {
		this.dhReplyContent = dhReplyContent;
	}
	public String getDhReplyCreated() {
		return dhReplyCreated;
	}
	public void setDhReplyCreated(String dhReplyCreated) {
		this.dhReplyCreated = dhReplyCreated;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "DogHealthVo [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", created="
				+ created + ", hitCount=" + hitCount + ", dhReplyNum=" + dhReplyNum + ", dhReplyContent="
				+ dhReplyContent + ", dhReplyCreated=" + dhReplyCreated + ", memberId=" + memberId + "]";
	}
	
}
