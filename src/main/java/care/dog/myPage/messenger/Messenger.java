package care.dog.myPage.messenger;

public class Messenger {//aa
private String senderId,receiverId,msg,msgTime;

public String getSenderId() {
	return senderId;
}

public void setSenderId(String senderId) {
	this.senderId = senderId;
}

public String getReceiverId() {
	return receiverId;
}

public void setReceiverId(String receiverId) {
	this.receiverId = receiverId;
}

public String getMsg() {
	return msg;
}

public void setMsg(String msg) {
	this.msg = msg;
}

public String getMsgTime() {
	return msgTime;
}

public void setMsgTime(String msgTime) {
	this.msgTime = msgTime;
}

}
