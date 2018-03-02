package care.dog.blog;

public class Blog {
private int blogId,visitorCount,closed;
private String memberId, title, introduce,created;
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


}
