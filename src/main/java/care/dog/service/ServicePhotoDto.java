package care.dog.service;

public class ServicePhotoDto {
	private String sittingId;
	private int photoId;
	private String fileName;
	
	public String getSittingId() {
		return sittingId;
	}
	public void setSittingId(String sittingId) {
		this.sittingId = sittingId;
	}
	public int getPhotoId() {
		return photoId;
	}
	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@Override
	public String toString() {
		return "ServicePhotoDto [sittingId=" + sittingId + ", photoId=" + photoId + ", fileName=" + fileName + "]";
	}
	
	
	
	
}
