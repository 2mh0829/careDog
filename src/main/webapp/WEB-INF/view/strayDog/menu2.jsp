<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.menu2 {
	background: #1991d7;
}
</style>

<div class="header-bottom">
	<div class="menu2" align="center">
		<a href="<%=cp%>/strayDog">유기견&nbsp;</a>
		<a href="<%=cp%>/strayDog/support">단체 후원&nbsp;</a>
		<a href="<%=cp%>/strayDog/volunteer">자원봉사신청&nbsp;</a>		
	</div>
</div>
