package care.dog.blog;

import org.springframework.web.multipart.MultipartFile;

public class BlogInfo {
	private int blogId,visitorCount,closed;
	private String memberId,userName, title, introduce,created;
	private int groupNum, themeNum;
	private String gender, city, hobby;
	private String groupSubject, subject;
	private MultipartFile upload;
	private String photoFilename;
	
	private int isUserName, isCity, isGender, isHobby;

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	public int getVisitorCount() {
		return visitorCount;
	}

	public void setVisitorCount(int visitorCount) {
		this.visitorCount = visitorCount;
	}

	public int getClosed() {
		return closed;
	}

	public void setClosed(int closed) {
		this.closed = closed;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public int getThemeNum() {
		return themeNum;
	}

	public void setThemeNum(int themeNum) {
		this.themeNum = themeNum;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getGroupSubject() {
		return groupSubject;
	}

	public void setGroupSubject(String groupSubject) {
		this.groupSubject = groupSubject;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getPhotoFilename() {
		return photoFilename;
	}

	public void setPhotoFilename(String photoFilename) {
		this.photoFilename = photoFilename;
	}

	public int getIsUserName() {
		return isUserName;
	}

	public void setIsUserName(int isUserName) {
		this.isUserName = isUserName;
	}

	public int getIsCity() {
		return isCity;
	}

	public void setIsCity(int isCity) {
		this.isCity = isCity;
	}

	public int getIsGender() {
		return isGender;
	}

	public void setIsGender(int isGender) {
		this.isGender = isGender;
	}

	public int getIsHobby() {
		return isHobby;
	}

	public void setIsHobby(int isHobby) {
		this.isHobby = isHobby;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
