<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>

#menu-background {
	height: 75px;
	overflow: hidden;
}

#background {
	position: absolute;
	top: 0;
	left: 0;
}

.header-left img {
	width: 100px;
}

</style>

<script>

$(window).scroll(function() {
	if($(this).scrollTop() < 65){
		$(".header-bottom").css("position", "absolute");
		$(".header-bottom").css("margin-top", "65px");
		/* $(".header-bottom").attr("onmouseover", "menuOverAction();"); */
	}else if($(this).scrollTop() >= $(".header-bottom").offset().top){
		$(".header-bottom").css("position", "fixed");
		$(".header-bottom").css("margin-top", "0");
		$(".header-bottom").css("top", "0");
/* 		$(".header-bottom").attr("onmouseover", "");
		$(".header-bottom").attr("onmouseout", ""); */
	}
});

/*
function menuOverAction() {
	$(".header-bottom").animate({top: "40px"}, {queue : false, duration : 300});
}

$(function() {
	$(".header-bottom").attr("onmouseover", "menuOverAction();");
	$(document).mousemove(function(e) {
		if(e.pageY > 130 && document.activeElement != document.getElementById("inpTx")){
			$(".header-bottom").animate({top: "0"}, {queue : false, duration : 100});
		} 
	});
});
 */
</script>


<div class="header-top">

	<div id='menu-background'>
		<img src="<%=cp %>/resource/img/menu.png">
		<div style="position: absolute; width: 189px; top: 0; left: 50px; margin-left: -50px; overflow: hidden;">
			<img src="<%=cp %>/resource/img/menu.png">
		</div>
	</div> 
	
	<div class="menu-container" align="center">
		<ul id="mainMenu" class="navi">
			<li><a href="<%=cp %>/service">서비스</a></li>
			<li><a href="<%=cp %>/mungstargram">멍스타그램</a></li>
			<li><a href="<%=cp %>/strayDog">유기견</a></li>
			<li><a href="<%=cp %>/dog119">펫119</a></li>
			<li><a href="<%=cp %>/info">정보</a></li>
			<li><a href="<%=cp %>/store">펫#</a></li>
			<li><a href="<%=cp %>/center">고객센터</a></li>
		</ul>
	</div>
	
	<div class="header-left">
		<a href='<%=cp %>'><img src='<%=cp %>/resource/img/logo_black.png'></a>	
	</div>
	
	<div class="header-right" align="right" style="line-height: 65px;">
	<c:if test="${empty sessionScope.member }">
		<a href="<%=cp %>/member/login"><span class="glyphicon glyphicon-log-in">&nbsp;</span>sign in</a> &nbsp;&nbsp;
		<a href="<%=cp %>/member/join1"><span class="glyphicon glyphicon-user">&nbsp;</span>sign up</a>
	</c:if>
	<c:if test="${not empty sessionScope.member }">
	  <span style="color: #4596d1;">${sessionScope.member.userName}</span>님
                &nbsp;|&nbsp;
      <a href="<%=cp%>/member/logout">로그아웃</a>
                &nbsp;|&nbsp;
                <a href="<%=cp%>/myPage">마이페이지</a>
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