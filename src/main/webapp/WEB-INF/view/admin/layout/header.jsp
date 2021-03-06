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

.header-left img {
	width: 100px;
}

a {
	color: white;
}

</style>


<div class="header-top">

	<div id='menu-background'>
		<img src="<%=cp %>/resource/img/menu_admin.png">
	</div>
	
	<div class="menu-container" align="center">
		<ul id="mainMenu" class="navi">
			<li><a href="<%=cp %>/admin/member">회원관리&nbsp;</a></li>
			<li><a href="<%=cp %>/admin/mungstar">멍스타그램&nbsp;</a></li>
			<li><a href="<%=cp %>/admin/store">펫#&nbsp;</a></li>
			<li><a href="<%=cp%>/admin/strayDog">유기견&nbsp;</a></li>
			<li><a href="<%=cp%>/admin/dog119/dogHealthInput">펫119&nbsp;</a></li>
			<li><a href="<%=cp %>/admin/center/onefonelist">고객센터&nbsp;</a></li>
		</ul>
	</div>
	
	<div class="header-left">
		<a href="<%=cp %>"><img src="<%=cp %>/resource/img/logo_white.png"></a>	
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
