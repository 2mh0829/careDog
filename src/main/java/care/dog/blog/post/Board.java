package care.dog.blog.post;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private String tableName;
	private int blogId;
	private String blogName;
	
	private int num;
	private String subject;
	private String content, created;
	private int hitCount;
	
	private int fileNum;
	private String originalFilename, saveFilename;
	private int fileSize;
	
	// 스프링에서 파일 받기
	private List<MultipartFile> upload; // <input type="file" name="upload"

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public int getFileNum() {
		return fileNum;
	}

	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public String getBlogName() {
		return blogName;
	}

	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	@Override
	public String toString() {
		return "Board [tableName=" + tableName + ", blogId=" + blogId + ", blogName=" + blogName + ", num=" + num
				+ ", subject=" + subject + ", content=" + content + ", created=" + created + ", hitCount=" + hitCount
				+ ", fileNum=" + fileNum + ", originalFilename=" + originalFilename + ", saveFilename=" + saveFilename
				+ ", fileSize=" + fileSize + ", upload=" + upload + "]";
	}
	
}
