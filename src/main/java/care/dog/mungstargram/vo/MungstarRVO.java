package care.dog.mungstargram.vo;

import java.util.List;

public class MungstarRVO extends MungstarDVO {
	private int photoCount;
	private int tagCount;
	private int likeInfo;
	private int likeCount;
	private int replyCount;
	private List<MungstarDVO> replyList;
	
	public int getPhotoCount() {
		return photoCount;
	}
	public void setPhotoCount(int photoCount) {
		this.photoCount = photoCount;
	}
	public int getTagCount() {
		return tagCount;
	}
	public void setTagCount(int tagCount) {
		this.tagCount = tagCount;
	}
	public int getLikeInfo() {
		return likeInfo;
	}
	public void setLikeInfo(int likeInfo) {
		this.likeInfo = likeInfo;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public List<MungstarDVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<MungstarDVO> replyList) {
		this.replyList = replyList;
	}
	
}
