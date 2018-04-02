package care.dog.dog119.dogHealthVo;

import org.springframework.web.multipart.MultipartFile;

public class DogHealthVo {

	private int boardNum;
	private String title;
	private String content;
	private String created;
	private int hitCount;
	private int dhReplyCount;
	private String memberId;
	private String username;
	private int likeCnt;
	private int listNum;
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeDh) {
		this.likeCnt = likeDh;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
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
	public int getDhReplyCount() {
		return dhReplyCount;
	}
	public void setDhReplyCount(int dhReplyCount) {
		this.dhReplyCount = dhReplyCount;
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
				+ created + ", hitCount=" + hitCount + ", dhReplyNum=" + dhReplyCount  + ", memberId=" + memberId + "]";
	}
	
}
