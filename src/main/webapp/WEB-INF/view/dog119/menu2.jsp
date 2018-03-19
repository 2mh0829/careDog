<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.menu2 {
	background: blue;
}
</style>

<div class="header-bottom">
	<div class="menu2" align="center">
		<a href="<%=cp%>/dog119">실종 신고&nbsp;</a>
		<a href="<%=cp%>/dog119/dogHospital">동물병원&nbsp;</a>
		<a href="<%=cp%>/dog119/dogHealth">애견 건강정보&nbsp;</a>
	</div>
</div>