<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
body {
	background: #f6f6f6;
}

.header {
	background: #f6f6f6;
}

.footer {
	background: #f6f6f6;
}

#join-img-box img {
	width: 100%;
}

.container {
	padding-top: 0;
}

.ok-container {
	margin: 100px auto;
}

h1 {
	color: #4286f4;
}

.okBtn {
	width: 450px;
	height: 60px;
	background: #4286f4;
	color: white;
	border: none;
}

</style>

<script>
var i = 59;
var time1 = setInterval(function() {
	if(i == 0){
		$("#time").html("02:00");
		clearInterval(time1);
		
		i = 60;
		var time2 = setInterval(function() {
			if(i == 0){
				$("#time").html("01:00");
				clearInterval(time2);
				
				i = 60;
				var time3 = setInterval(function() {
					if(i == 0){
						$("#time").html("00:00");
						authCheck();
						clearInterval(time3);
					}else if(i < 10){
						$("#time").html("00:0" + i);
					}else {
						$("#time").html("00:" + i);
					}
					i--;
				}, 1000);
				
			}else if(i < 10){
				$("#time").html("01:0" + i);
			}else {
				$("#time").html("01:" + i);
			}
			i--;
		}, 1000);
		
	}else if(i < 10){
		$("#time").html("02:0" + i);
	}else {
		$("#time").html("02:" + i);
	}
	i--;
}, 1000);


function authCheck() {
	var url = "<%=cp %>/member/auth_completed";
	var data = "";
	$.ajax({
		url: url
		,data: data
		,success: function(){
			alert("secces");
		}
	});
}

</script>

<div class="body-container">
	<div id="join-img-box">
		<img src="<%=cp %>/resource/img/join3.jpg">
	</div>

	<div align="center" class="ok-container">
		<h1><b>인증메일이 발송되었습니다.</b></h1>
		<br>
		<h4>인증메일 확인 후 로그인 가능합니다.</h4>
		<br>
		<div><span id="time" style="color: red;">03:00</span><span>&nbsp;초 남음</span></div>
		<br><br><br><br>
		<button class="okBtn" onclick="location.href='<%=cp %>/member/login'"><h4>로그인 하기</h4></button>
	</div>
	
	
</div>

