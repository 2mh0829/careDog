<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>

#background {
	position: absolute;
	top: 0;
	left: 0;
}

#menu-background {
	height: 75px;
	overflow: hidden;
}

.header-left img {
	width: 80px;
}

</style>


<div class="header-top">

	<div id='menu-background'>
		<img src="<%=cp %>/resource/img/menu.png">
		<div style="position: absolute; width: 189px; top: 0; left: 50px; margin-left: -50px; overflow: hidden;">
			<img src="<%=cp %>/resource/img/menu.png">
		</div>
	</div>
	
	<div class="menu-container" align="center">
		<ul id="mainMenu" class="navi">
			<li><a href="<%=cp %>/service">Service&nbsp;</a></li>
			<li><a href="<%=cp %>/mungstargram">mungstargram&nbsp;</a></li>
			<li><a href="<%=cp %>/strayDog">유기견&nbsp;</a></li>
			<li><a href="<%=cp %>/dog119">애견119&nbsp;</a></li>
			<li><a href="<%=cp %>/info">정보&nbsp;</a></li>
			<li><a href="<%=cp %>/store">펫스토어&nbsp;</a></li>
			<li><a href="<%=cp %>/center">고객센터&nbsp;</a></li>
		</ul>
	</div>
	
	<div class="header-left">
		<a href="<%=cp %>"><img src="<%=cp %>/resource/img/logo.png"></a>	
	</div>
	
	<div class="header-right" align="right" style="line-height: 65px;">
	<c:if test="${empty sessionScope.member }">
		<a href="<%=cp %>/member/login"><span class="glyphicon glyphicon-log-in">&nbsp;</span>sign in</a> &nbsp;&nbsp;
		<a href="<%=cp %>/member/signUp"><span class="glyphicon glyphicon-user">&nbsp;</span>sign up</a>
	</c:if>
	<c:if test="${not empty sessionScope.member }">
	  <span style="color:blue;">${sessionScope.member.userName}</span>님
                &nbsp;|&nbsp;
      <a href="<%=cp%>/member/logout">로그아웃</a>
                &nbsp;|&nbsp;
                <a href="<%=cp%>/nblog">마이페이지</a>
                <c:if test="${sessionScope.member.memberId=='admin'}">
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/admin">관리자</a>
                </c:if>
            </c:if>
	</div>
	
</div>

