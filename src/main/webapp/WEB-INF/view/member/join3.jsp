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


<div class="body-container">
	<div id="join-img-box">
		<img src="<%=cp %>/resource/img/join3.jpg">
	</div>

	<div align="center" class="ok-container">
		<h1><b>인증메일을 전송하였습니다.</b></h1>
		<br>
		<h4>인증메일 확인 후 로그인 가능합니다.</h4>
		<br><br><br><br>
		<button class="okBtn" onclick="location.href='<%=cp %>/member/login'"><h4>로그인 하기</h4></button>
	</div>
	
	
</div>

