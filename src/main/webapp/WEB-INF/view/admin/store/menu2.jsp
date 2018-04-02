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
	color: #000000;
}

</style>

<div class="header-bottom">
	<div class="menu2" align="center">
		<a href="<%=cp%>/admin/store/list">펫상품리스트</a>
	</div>
</div>



