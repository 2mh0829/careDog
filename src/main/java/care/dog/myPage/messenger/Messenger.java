package care.dog.myPage.messenger;

public class Messenger {//aa
private String senderId,receiverId,msg,msgTime;
private String senderUserName, receiverUserName;

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


public String getSenderUserName() {
	return senderUserName;
}

public void setSenderUserName(String senderUserName) {
	this.senderUserName = senderUserName;
}

public String getReceiverUserName() {
	return receiverUserName;
}

public void setReceiverUserName(String receiverUserName) {
	this.receiverUserName = receiverUserName;
}

@Override
public String toString() {
	return "Messenger [senderId=" + senderId + ", receiverId=" + receiverId + ", msg=" + msg + ", msgTime=" + msgTime
			+ ", senderUserName=" + senderUserName + ", receiverUserName=" + receiverUserName + "]";
}

}
