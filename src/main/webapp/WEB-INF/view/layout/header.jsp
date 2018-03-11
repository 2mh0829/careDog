<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
.menu2 {
    animation-name: example;
    animation-duration: 1s;
}

#background {
	position: absolute;
	top: 0;
	left: 0;
}

.header-left img {
	width: 80px;
}

</style>

<script>

$(window).scroll(function() {
	if($(this).scrollTop() >= 65){
		$(".menu2").css("height","65px");
		$(".menu2").css("line-height","65px");
	}else{
		$(".menu2").css("height","90px");
		$(".menu2").css("line-height","90px");
	}
});


</script>


<div class="header-top">

	<div id='menu-background'>
		<img src="<%=cp %>/resource/img/menu.png">
	</div>
	
	<div class="header-left">
		<img src="<%=cp %>/resource/img/main-dog.png">	
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
	
	<div class="header-right" align="right" style="line-height: 65px;">
	<c:if test="${empty sessionScope.member }">
		<a href="<%=cp %>/member/login"><span class="glyphicon glyphicon-log-in">&nbsp;</span>sign in</a> &nbsp;&nbsp;
		<a href="<%=cp %>/member/join"><span class="glyphicon glyphicon-user">&nbsp;</span>sign up</a>
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

<!-- 
<div class="header-bottom">
	<div class="menu-container" align="center">
		<div style="float: right;">
			<a>▤ </a>
		</div>
	</div>
</div>
 -->