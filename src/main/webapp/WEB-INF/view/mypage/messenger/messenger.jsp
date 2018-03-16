<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String cp = request.getContextPath();
%>

<style>
.blog-body-left {
	width: 0%;
	height: 0%;
}

.myPage-layout {
	padding: 0 0 0 0;
	width: 100%;
}

.messengerLeft {
	width: 30%;
	height: 100%;
	float: left;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5D5D5;
	float: left;
}

.messengerRight {
	width: 70%;
	height: 100%;
	float: left;
}
.messageList{
/* background-color:green;
height : 500px; */
}
.messengerHeader {
	float: left;
	width: 100%;
	height: 70px;
	border-bottom-color: #D5D5D5;
	border-bottom-style: solid;
	border-bottom-width: 1px;
}

.messengerHeaderLeft {
	width: 30%;
	height: 100%;
	float: left;
	border-right-color: #D5D5D5;
	border-right-style: solid;
	border-right-width: 1px;
	border-right-color: #D5D5D5;
}

.messengerHeaderRight {
	width: 70%;
	float: left;
	height: 100%;
	text-align: center;
	line-height: 70px;
}

.messageMemberList {
	width: 95%;
	height: 100px;
	margin-top: 15px;
	margin-left: 15px;
	float: left;
}

.messageListBox {
	height: 40px;
	weight: 100%;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
}

.messageTextLeft {
	font-size: 25px;
	background-color: #D5D5D5;
	border-radius: 20px;
}

.messageTextRight {
	color: white;
	font-size: 25px;
	background-color: blue;
	border-radius: 20px;
}
.messageInput{
	height:60px;
	border-top-width: 1px;
	border-top-style:solid;
	border-top-color:#D5D5D5;
	padding-left: 15px;
	padding-top:15px;
	color : #D5D5D5;
	font-size: 17px;
}
</style>
<script>
	$(document).ready(function() {
		var a = 0;
		for (i = 0; i < $(".messageTextLeft").length; i++) {
			var temp = "ㅤ" + $(".messageTextLeft").eq(i).text() + "ㅤ";
			$(".messageTextLeft").eq(i).text(temp);
		}
		for (i = 0; i < $(".messageTextRight").length; i++) {
			var temp = "ㅤ" + $(".messageTextRight").eq(i).text() + "ㅤ";
			$(".messageTextRight").eq(i).text(temp);
		}
		var a = getDocHeight()
		$(".myPage-layout").css("height", a - 172);
		$(".messengerBody").css("height", a - 242);
		var c = $(".messengerBody").height();
		var d = $(".messageInput").height();
		$(".messageList").css("height",c-80);
		
	})
	function getDocHeight() {
		var doc = document;
		return Math.max(doc.body.scrollHeight,
				doc.documentElement.scrollHeight, doc.body.offsetHeight,
				doc.documentElement.offsetHeight, doc.body.clientHeight,
				doc.documentElement.clientHeight);
	}
	function findFriends(){
		var url="<%=cp%>/messenger/findFriends";
		var count=0;
 		$.ajax({
			type:"POST",
			url:url,
			success:function(data){
				for(i=0;i<data.friendList.length;i++){
					count++;
					
				}
				alert(count);
			},
			error:function(e){
				$(".modal-body").text("이이이이이히");
			    $("#myModal").modal();
				alert("연결 오류가 발생했습니다.");
			}
		}) 
	}

</script>

<div class="messengerHeader">
	<div class="messengerHeaderLeft">
		<div
			style="font-size: 20px; line-height: 70px; width: 65%; float: left; text-align: right">
			<b>CareDog Messenger</b>
		</div>
		<div style="width: 35%; float: left;">
			<a id="findFriendsATag" onClick="findFriends();"><img class="addFriendImgBtn" src="<%=cp%>/resource/img/myPage/addBtn.png"
				style="width: 20px; margin-right: 5px; margin-top: 10px; float: right;"></a>
		</div>
	</div>
	<div class="messengerHeaderRight">이종훈</div>
</div>
<div class="messengerBody">
	<div class="messengerLeft">
		<div class="messageMemberList">
			<img src="<%=cp%>/resource/img/myPage/jsh.jpg"
				style="margin-right: 10px; width: 50px; border-radius: 50px; float: left">
			<div style="margin-top: 7px; width: 30%; float: left">
				<div style="font-size: 15px">조세호짱짱맨</div>
				<div style="font-size: 12px; color: #D5D5D5">you: 소지섭님</div>
			</div>
			<div
				style="text-align: right; color: #D5D5D5; margin-top: 10px; float: right">2017-06-13-15:30</div>
		</div>
	</div>
	<div class="messengerRight">
		<div class="messageList">
			<div class="messageListBox">
				<div class="messageTextRight" style="float: right">aaa</div>
			</div>
			<div class="messageListBox">
				<div class="messageTextLeft" style="float: left">
					<img src="<%=cp%>/resource/img/myPage/jsh.jpg">
					<div>bbb</div>
				</div>
			</div>
			<div class="messageListBox">
				<div class="messageTextRight" style="float: right">ccc</div>
			</div>
		</div>
		
		<div class="messageInput">
		<input type="text" style="border:none;" value="Type a message.."><input style="margin-right:30px; float:right;width:50px; height:30px;" type="button" value="send">
		</div>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
