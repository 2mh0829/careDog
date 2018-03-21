<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.menu2 {
	background: silver;
}
li{
display: inline-block;
}
</style>

<div class="header-bottom" align="center">
	<ul class="center_list">
				<li>
					<a onclick="javascript:location.href='<%=cp%>/center/faq'">FAQ</a>
				</li>
				<li>
					<a onclick="javascript:location.href='<%=cp%>/center';">공지사항/이벤트</a>
				</li>
				<li>
					<a onclick="javascript:location.href='<%=cp %>/center/onefonelist';">1:1문의</a>
				</li>
			</ul>
</div>