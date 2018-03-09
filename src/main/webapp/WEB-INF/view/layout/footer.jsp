<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

.footer-container {
	text-align: center;
	width: 100%;
	height: 150px;
}

.mark-container {
	float: left;
	margin: 15px;
	width: 200px;
}

.info-container {
	float: right;
	text-align: left;
	margin: 15px;
	width: 600px;
}

.info-container p{
	font-weight: bold;
	font-size: 15x;
}

#dog_mark {
	width: 170px;
	float: right;
}

.footer-menu {
	margin: 15px;
	border-top: 1.2px solid #aaaaaa;
	border-bottom: 1.2px solid #dddddd;
	padding: 15px;
	background: #f9f9f9;
	font-size: 15px;
	font-weight: bold;
}

.footer-content {
	width: 880px;
	text-align: center;
	margin: auto;
}


</style>

<script>

$(function() {
	
	var windowWidth = $(window).width();
		
	var x = 0;
	var direction = "right";
	var dog = null;
	var dogArea = windowWidth - 150;
	
	setInterval(function() {
		dog = document.getElementById("runnig_dog");
		
		if(direction == "right"){
			move_right();
		}else{
			move_left();
		}
		dog.style.left = x + "px";
	}, 200);
	
	
	function move_right() {
		x += 10;
		if(x >= dogArea - 20){
			direction = "left";
			dog.src = "<%=cp %>/resource/img/running_dog2.gif";
		}
	}
	
	function move_left() {
		x -= 10;
		if(x == 0){
			direction = "right";
			dog.src = "<%=cp %>/resource/img/running_dog.gif";
		}
	}

});
</script>

<div>
	<img id="runnig_dog" src="<%=cp %>/resource/img/running_dog.gif" style="width: 150px; position: relative; left: 5px; top: 20px;">
</div>

<div class="footer-container">
	<div class="footer-menu">
		<span>회사소개</span>&nbsp;&nbsp;|&nbsp;&nbsp;
		<span>채용안내</span>&nbsp;&nbsp;|&nbsp;&nbsp;
		<span>개인정보취급방침</span>&nbsp;&nbsp;|&nbsp;&nbsp;
		<span>이용약관</span>&nbsp;&nbsp;|&nbsp;&nbsp;
		<span>고객센터</span>
	</div>
	<div class="footer-content">
		<div class="mark-container">
			<img id="dog_mark" src="<%=cp %>/resource/img/dog_mark.jpg">
		</div>
		<div class="info-container">
			<p>CareDog 컴퍼니</p>
			<p style="color: #696969;">대표 : HAN | 사업자등록번호 : 111-22-33333 | 통신판매업허가번호 2018-서울마포-8102</p>
			<p style="border-bottom: 1px solid #aaaaaa; padding-bottom: 10px; color: #696969;">주소 : 서울 마포구 월드컵북로 21 풍성빌딩 | 전화:7979-8282</p>
			<p>COPYRIGHT(C) 2018 CareDog컴퍼니 All right reserved.</p>
		</div>
	</div>
</div>




