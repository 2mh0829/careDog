package care.dog.mungstargram.vo;

public class MungstarRVO extends MungstarDVO {
	private int photoCount;
	private int tagCount;
	
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
	
	
	@Override
	public String toString() {
		return "MungstarRVO [photoCount=" + photoCount + ", " + super.toString() + "]";
	}
	
}
