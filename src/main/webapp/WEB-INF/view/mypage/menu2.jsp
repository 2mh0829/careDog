<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.menu2 {
	background: orange;
}
</style>

<div class="header-bottom">
	<div class="menu2" align="center">
	<a href="<%=cp%>/nblog">내 블로그</a>&nbsp&nbsp&nbsp&nbsp
	<a href="<%=cp%>/mypage/editMember">개인정보수정</a>&nbsp&nbsp&nbsp&nbsp
	<a href="#">마이펫</a>&nbsp&nbsp&nbsp&nbsp
	<a href="#">서비스이용내역</a>&nbsp&nbsp&nbsp&nbsp
	<a href="#">CD Messenger</a>&nbsp&nbsp&nbsp&nbsp
	<a href="#">북마크</a>&nbsp&nbsp&nbsp&nbsp
	<a href="#">장바구니</a>&nbsp&nbsp&nbsp&nbsp
	<a href="<%=cp%>/mypage/test">구매내역</a>&nbsp&nbsp&nbsp&nbsp
	<a href="#">봉사/후원 내역</a>
	</div>
</div>