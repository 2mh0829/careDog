package care.dog.member;

public class Member {
	private String memberId,userPwd,userName;
	private String authority;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String userId) {
		this.memberId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
