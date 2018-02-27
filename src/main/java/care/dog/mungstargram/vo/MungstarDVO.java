package care.dog.mungstargram.vo;

import java.util.Date;

public class MungstarDVO {
	// mungstar 
	private int num;			// pk
	private String context;
	private int hitCount;
	private Date created;
	private int userNum;		// fk_member1
	
	// mungstarPhoto
	private int photoNum;		// pk
	private String filename;
//	private int num				// fk_mungstar

	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Override
	public String toString() {
		return "MungstarDVO [num=" + num + ", context=" + context + ", hitCount=" + hitCount + ", created=" + created
				+ ", userNum=" + userNum + ", photoNum=" + photoNum + ", filename=" + filename + "]";
	}
	
}
