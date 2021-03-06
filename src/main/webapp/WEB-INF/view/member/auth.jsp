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

#countBox {
	color: red;
}

</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<script>

setTimeout(function() { $("#countBox").html("2초후 종료"); }, 1000);
setTimeout(function() { $("#countBox").html("1초후 종료"); }, 2000);
setTimeout(function() { window.close(); }, 3000);

</script>

<div class="body-container">
	<div id="join-img-box">
		<img src="<%=cp %>/resource/img/join3.jpg">
	</div>

	<div align="center" class="ok-container">
		<h1><b>${msg }</b></h1>
		<br>
		<div id='countBox'>3초후 종료</div>
		<br><br><br><br>
	</div>
</div>

