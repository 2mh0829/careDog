<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%/* aa */
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

.messageList {
	overflow: auto;
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: #DADADA;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #DADADA;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #DADADA;
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
	height: 60px;
	margin-top: 15px;
	margin-left: 15px;
	float: left;
}

.messageListBox {
	height: 40px;
	weight: 100%;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 10px;
}

.messageTextLeft {
	font-size: 15px;
	background-color: #D5D5D5;
	border-radius: 20px;
	padding-left: 5px;
	padding-right: 5px;
}

.messageTextRight {
	color: white;
	font-size: 15px;
	background-color: skyblue;
	border-radius: 20px;
	padding-left: 5px;
	padding-right: 5px;
}

.messageInput {
	height: 40px;
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #D5D5D5;
	padding-left: 15px;
	padding-top: 10px;
	color: #D5D5D5;
	font-size: 17px;
}

.addFriendBtn {
	cursor: pointer
}

.friendList {
	cursor: pointer
}

.pointer {
	cursor: pointer
}

input {
	outline-width: 0
}
</style>
<script>
var messageCount=0;
var friendNameTemp=0;
	$(document).ready(function() {
		adjustMessengerLayoutSize();
		getMessageMemberList(); <!--메신저페이지들어오면 대화기록있는 친구리스트 불러오기-->
		mInterval = setInterval("checkChanged()",1500);<%--메세지검사--%>
		$("#inputMessage").on("click",function(){
			$(this).prop("value","");
		});
	
	})
	function getMessageMemberList(){
		var url="<%=cp%>/messenger/getMessageMemberList";
 		$.ajax({
			type:"POST",
			url:url,
			success:function(data){
				console.log(data.mML.length);
			 	for(i=0;i<data.mML.length;i++){
					getFriend(data.mML[i].receiverUserName,data.mML[i].receiverId,data.mML[i].msg,data.mML[i].msgTime);
				}
				if(data.mML.length>=0)
				getMessageList(data.mML[0].receiverUserName,data.mML[0].receiverId);
				getMessages();
			},
		
			error:function(e){
				alert("연결 오류가 발생했습니다.");
			}
		}) 
	}
	function adjustMessengerLayoutSize(){ <!--메신저크기조정-->
		var a = 0;
		for (i = 0; i < $(".messageTextLeft").length; i++) {
			var temp = "ㅤ" + $(".messageTextLeft").eq(i).text() + "ㅤ";
			$(".messageTextLeft").eq(i).text(temp);
		}
		for (i = 0; i < $(".messageTextRight").length; i++) {
			var temp = "ㅤ" + $(".messageTextRight").eq(i).text() + "ㅤ";
			$(".messageTextRight").eq(i).text(temp);
		}
		var a = getDocHeight();
		$(".myPage-layout").css("height", a - 210);
		$(".messengerBody").css("height", a - 240);
		var c = $(".messengerBody").height();
		var d = $(".messageInput").height();
		$(".messageList").css("height",c-60);
	}
	
	function getDocHeight() {
		var doc = document;
		return Math.max(doc.body.scrollHeight,
				doc.documentElement.scrollHeight, doc.body.offsetHeight,
				doc.documentElement.offsetHeight, doc.body.clientHeight,
				doc.documentElement.clientHeight);
	}
	function findFriends(){<!--친구추가버튼-->
		var url="<%=cp%>/messenger/findFriends";
 		$.ajax({
			type:"POST",
			url:url,
			success:function(data){
				$(".modal-body").html("");
				for(i=0;i<data.friendList.length;i++){
					$(".modal-body").append("<div class='friendList' onClick='getFriend(\""+data.friendList[i].userName+"\",\""+data.friendList[i].memberId+"\",\"\",\"\");' data-dismiss='modal'>"+data.friendList[i].memberId+"("+data.friendList[i].userName+")</div>");
					$("#myModal").modal();
				}
			},
			error:function(e){
				alert("연결 오류가 발생했습니다.");
			}
		}) 
	}
	function getFriend(userName,memberId,msg,msgTime){<!--친구받아와서 목록에 추가-->
		
		<!--기존에 친구대화목록이 있으면 추가하지 않기-->
		if(checkDuplicationFriend(userName)==0){
			alert('이미 친구가 대화목록에 있습니다');
			return;
		}
		if(msg.length>30) 
			msg=msg.substr(0,30)+"...";
		
			// $(".messengerLeft").append("<div class='messageMemberList pointer'  data-userName='"+userName+"' onClick='getMessageList(\""+userName+"\",\""+memberId+"\","+$('.messageMemberList').index(this)+");'>"
		$(".messengerLeft").append("<div class='messageMemberList pointer'  data-userName='"+userName+"' data-memberId='"+memberId+"'>"
						+"<img src='https://pbs.twimg.com/media/CJdjthrUEAAjkCl.jpg'"
						+"	style='margin-right: 10px; width: 50px; border-radius: 50px; float: left'>"
						+"	<div style='margin-top: 7px; width: 30%; float: left'>"
						+"	<div class='messageMemberName' style='font-size: 15px'>"+userName+"</div>"
						+"	<div class='messageMsg' style='font-size: 12px; width:auto;color: #D5D5D5'>"+msg+"</div></div>"
						+"	<div class='messageTime' style='text-align: right; color: #D5D5D5; margin-top: 10px; float: right'>"+msgTime+"</div></div>");
		
	}
	
	function getMessageList(userName,memberId){
		//alert(userName+$(this).index());
		$(".messengerHeaderRight").text(userName);
		$(".headerMemberId").text(memberId);
		$(".messageList").html("");
		messageCount=0;
		getMessages();
	};
	$(function(){
	$("body").on("click",".messageMemberList",function(){
		getMessageList($(this).attr("data-userName"),$(this).attr("data-memberId"));
	});
	})
	function checkDuplicationFriend(userName){
		var mML =$(".messageMemberList");
		for(i = 0 ;i<mML.length;i++){
			if(userName==$(".messageMemberList .messageMemberName").eq(i).text())
			return 0;
		}
	}
	function sendMessage(){
		var url="<%=cp%>/messenger/sendMessage";		
		var data = "receiverId="+$(".headerMemberId").text()+"&msg="+$("#inputMessage").val();
 		$.ajax({
			type:"POST",
			url:url,
			data:data,
			dataType:"JSON",
			success:function(data){
			getMessages();
		
			}
			,error:function(e){
				alert("연결 오류가 발생했습니다.");
			}
		}) 
	}
	function getMessages(){
		var url="<%=cp%>/messenger/getMessages";
		var data = "receiverId="+$(".headerMemberId").text();
 		$.ajax({
			type:"POST",
			url:url,
			data:data,
			dataType:"JSON",
			success:function(data){
				$(".messageListBox").remove();
				for(i=0;i<data.messageList.length;i++){
					if(data.messageList[i].senderId=='${sessionScope.member.memberId}'){
						$(".messageList").append("<div class='messageListBox'><div class='messageTextRight' style='float: right'>"+data.messageList[i].msg+"</div></div>");
					}else{
						$(".messageList").append("<div class='messageListBox'><div class='messageTextLeft' style='float: left'>"+data.messageList[i].msg+"</div></div>");
					}
				}
				if (messageCount<data.messageList.length){  <%--메세지 변동사항 생기면 아래로 스크롤하고 친구목록 메세지와 시간 변경하기--%>
					$(".messageList").scrollTop($(".messageList")[0].scrollHeight);
					messageCount=data.messageList.length;
					 for(i=0;i<$('.messageMemberName').length;i++){
							if($('.messageMemberName').eq(i).text()==$(".messengerHeaderRight").text()){
								$('.messageMsg').eq(i).text(data.messageList[data.messageList.length-1].msg);
								$('.messageTime').eq(i).text(data.messageList[data.messageList.length-1].msgTime);
							}
						} 
				}
			}
			,error:function(e){
				alert("연결 오류가 발생했습니다.");
				clearInterval(mInterval);
			}
		}) 
	}
	function checkChanged(){
		getMessages();
	}
</script>

<div class="messengerHeader">
	<div class="messengerHeaderLeft">
		<div
			style="font-size: 20px; line-height: 70px; width: 65%; float: left; text-align: right">
			<b>CareDog Messenger</b>
		</div>
		<div style="width: 35%; float: left;">
			<img class="addFriendBtn" onClick="findFriends();"
				src="<%=cp%>/resource/img/myPage/addBtn.png"
				style="width: 20px; margin-right: 5px; margin-top: 10px; float: right;">
		</div>
	</div>
	<div class="messengerHeaderRight">11</div>
</div>
<div class="messengerBody">
	<div class="messengerLeft">

		<!-- 		<div class="messageMemberList">
			<img src="https://pbs.twimg.com/media/CJdjthrUEAAjkCl.jpg"
				style="margin-right: 10px; width: 40px; border-radius: 30px; float: left">
			<div style="margin-top: 7px; width: 30%; float: left">
				<div class='messageMemberName' style="font-size: 15px">조세호짱짱맨</div>
				<div style="font-size: 12px; color: #D5D5D5">you: 소지섭님</div>
			</div>
			<div
				style="text-align: right; color: #D5D5D5; margin-top: 10px; float: right">2017-06-13-15:30</div>
		</div> -->

	</div>
	<div class="messengerRight">
		<div class="messageList">
			<!-- 		<div class="messageListBox">
				<div class="messageTextRight" style="float: right">aaa</div>
			</div>
			<div class="messageListBox">
				<div class="messageTextLeft" style="float: left">bbb</div>
			</div>
			<div class="messageListBox">
				<div class="messageTextRight" style="float: right">ccc</div>
			</div> -->
		</div>

		<div class="messageInput">
			<div style="width: 80%; float: left">
				<input style="border: none; width: 100%;" id="inputMessage"
					type="text" value="Type a message..">
			</div>
			<div
				style="padding-right: 25px; float: right; width: auto; height: 30px;">
				<input type="button" onClick="sendMessage();" value="send">
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">회원목록</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div class="headerMemberId" style="display: none;"></div>
