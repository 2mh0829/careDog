<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String cp = request.getContextPath();
%>
<style>
.messengerContainer {
	width: 100%;
	height: 100%;
	overflow: hidden;
	float: left;
	/* border-style: solid;
	border-width:1px;
	border-color:#D5D5D5; */
}

.messengerLeft {
	position: relative;
	width: 30%;
	height: 1000px;
	float: left;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5D5D5;
}

.messengerRight {
	width: 70%;
	float: left;
}

.messengerHeader {
	width: 100%;
	height: 70px;
	border-bottom-color: #D5D5D5;
	border-bottom-style: solid;
	border-bottom-width: 1px;
}

.messengerHeaderLeft {
	width: 30%;
	height: 100%;
	float: left; border-right-color : #D5D5D5;
	border-right-style: solid;
	border-right-width: 1px;
	border-right-color: #D5D5D5;
}

.messengerHeaderRight {
	width: 70%;
	float: left;
	text-align: center;
	line-height: 70px;
}

.container {
	/* clear:both; */
	padding-left: 0px;
	padding-right: 0px;
	padding-top: 30px;
}
.messageMemberList{
width:95%;
height:100px;
margin-top:15px;
margin-left:15px;
float:left;
}
.messageBox{
width:100%;

background-color: red;
}
</style>

<div class="messengerContainer">
	<div class="messengerHeader">
		<div class="messengerHeaderLeft">
			<div
				style="font-size: 20px; line-height: 70px; width: 65%; float: left; text-align: right">
				<b>CareDog Messenger</b>
			</div>
			<div style="width: 35%; float: left;">
				<img src="<%=cp%>/resource/img/mypage/addBtn.png"
					style="width: 20px; margin-right: 5px; margin-top: 10px; float: right;">
			</div>
		</div>
		<div class="messengerHeaderRight">이종훈</div>
	</div>
	<div class="messengerLeft">
		<div class="messageMemberList">
			<img src="<%=cp%>/resource/img/mypage/jsh.jpg"
				style="margin-right: 10px; width: 50px; border-radius: 50px; float: left">
			<div style="margin-top: 7px; width: 30%; float: left">
				<div style="font-size: 15px">조세호짱짱맨</div>
				<div style="font-size: 12px; color: #D5D5D5">you: 소지섭님</div>
			</div>
			<div style="text-align: right;color: #D5D5D5; margin-top: 10px; float: right">2017-06-13-15:30</div>		
		</div>
	</div>
	<div class="messengerRight">
		<div class="messageBox">
			hihi
		</div>
	</div>
</div>



