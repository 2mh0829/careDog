package care.dog.mungstargram.vo;

public class MungstarRVO extends MungstarDVO {
	private int photoCount;
	
	public int getPhotoCount() {
		return photoCount;
	}
	public void setPhotoCount(int photoCount) {
		this.photoCount = photoCount;
	}

	@Override
	public String toString() {
		return "MungstarRVO [photoCount=" + photoCount + ", " + super.toString() + "]";
	}

}
