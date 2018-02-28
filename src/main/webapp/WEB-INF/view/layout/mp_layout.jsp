<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dog Mate</title>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="shortcut icon" href="<%=cp %>/resource/img/icon/favicon.ico" type="image/x-icon" />
<link rel="icon" href="<%=cp %>/resource/img/icon/favicon.ico" type="image/x-icon" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp %>/resource/css/font.css?ver=1.2" type="text/css">
<link rel="stylesheet" href="<%=cp %>/resource/css/style.css?ver=1" type="text/css">
<link rel="stylesheet" href="<%=cp %>/resource/css/layout.css?ver=2.3" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/jquery-ui.min.css" type="text/css">

<style>

.left-container {
width:20%;
background-color:yellow;
text-align:center;
float:left;}   

.main-container {b
width:80%;
background-color:pink;
float:left;}
</style>

</head>
<body>

<div class="header">
	<tiles:insertAttribute name="header" />
</div>

<div class="container">
	<div class="left-container">
		<tiles:insertAttribute name="left" />
	</div>
	
	<div class="main-container">
		<tiles:insertAttribute name="body" />
	</div>
</div>

<div class="footer">
	<tiles:insertAttribute name="footer" />
</div>


<div class="chatbot">
	<!-- <h1 align="center"><a>챗봇</a></h1> -->
	<tiles:insertAttribute name="bot" />
</div>

</body>
</html>