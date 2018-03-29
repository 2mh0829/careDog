<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>

.menu2 {
	background: #ffffff;
	border-bottom: 1px solid #e2e2e2;
}

.menu2 a {
	margin-right: 30px;
	font-size: 15px;
	font-weight: normal;
}

</style>

<div class="header-bottom">
	<div class="menu2" align="center">
		<a href="<%=cp%>/store">HOME</a>
		<a href="<%=cp%>/store/list?categoryId=0">ALL</a>
		<a href="<%=cp%>/store/list?categoryId=1">사료 & 간식</a>
		<a href="<%=cp%>/store/list?categoryId=2">목욕 & 위생용품</a>
		<a href="<%=cp%>/store/list?categoryId=3">식기 & 하우스</a>
		<a href="<%=cp%>/store/list?categoryId=4">외출 & 패션</a>
		<a href="<%=cp%>/store/list?categoryId=5">장난감</a>
		<%-- <a href="<%=cp%>/store/list?categoryId=''">HOT & NEW</a> --%>
	</div>
</div>