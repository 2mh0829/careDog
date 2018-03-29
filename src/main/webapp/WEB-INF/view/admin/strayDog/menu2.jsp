<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.menu2 {
	background: #aaaaaa;
}
</style>

<div class="header-bottom">
	<div class="menu2" align="center">
		<a href="<%=cp%>/admin/strayDog">정기후원 리스트&nbsp;&nbsp;</a>
		<a href="<%=cp%>/admin/strayDog/tempSupport">일시후원 리스트&nbsp;&nbsp;</a>
		<a href="<%=cp%>/admin/strayDog/volunteer">자원봉사 리스트&nbsp;&nbsp;</a>
		
	</div>
</div>