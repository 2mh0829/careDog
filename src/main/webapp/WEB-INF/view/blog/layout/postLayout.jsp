<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/blog/style.css"
	type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/blog/layout4.css"
	type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/resource/css/font.css?ver=1.2" type="text/css">
<link rel="stylesheet" href="<%=cp %>/resource/css/style.css?ver=1" type="text/css">
<link rel="stylesheet" href="<%=cp %>/resource/css/layout.css?ver=3.1" type="text/css">
<link rel="shortcut icon" href="<%=cp %>/resource/img/icon/favicon.ico" type="image/x-icon" />
<link rel="icon" href="<%=cp %>/resource/img/icon/favicon.ico" type="image/x-icon" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

</head>
<body>
	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="blog-layout">

		<div class="blog-header">
			<tiles:insertAttribute name="blogHeader" />
		</div>

		<div class="blog-body">
			<div class="blog-body-left">
				<tiles:insertAttribute name="blogLeft" />
			</div>
			<div class="blog-body-right">
				<tiles:insertAttribute name="blogBody" />
			</div>
		</div>
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>

	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>