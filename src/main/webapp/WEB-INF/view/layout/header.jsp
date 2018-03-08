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
</style>

<script>

$(window).scroll(function() {
	if($(this).scrollTop() >= 70){
		$(".header-bottom").css("position","fixed");
		$(".header-bottom").css("top","0px");
		$(".menu2").css("position","fixed");
		$(".menu2").css("top","0px");
		$(".menu2").css("height","65px");
		$(".menu2").css("line-height","65px");
	}else{
		$(".header-bottom").css("position","relative");
		$(".header-bottom").css("background","");
		$(".menu2").css("position","absolute");
		$(".menu2").css("height","90px");
		$(".menu2").css("line-height","90px");
	}
});


</script>

<div class="header-top">
	<div class="header-left">
		<div style="float: left; margin-top: 5px;">
			<img src="<%=cp %>/resource/img/dog_icon.png" style="width: 60px;">
		</div>
		<span class="title-font" style="line-height: 70px; margin-left: 10px;">
			<a href="<%=cp %>/">
				cD
			</a>
		</span>
	</div>
	
	<div class="menu-container hidden-xs hidden-sm" align="center">
		<div class="menu">
			<ul id="mainMenu" class="navi">
				<li value="1"><a href="<%=cp %>/intro">Abt.careDog</a></li>
				<li value="2"><a href="<%=cp %>/service">Service</a></li>
				<li value="3"><a href="<%=cp %>/mungstargram">mungstargram</a></li>
				<li value="4"><a href="<%=cp %>/strayDog">유기견</a></li>
				<li value="5"><a href="<%=cp %>/dog119">애견119</a></li>
				<li value="6"><a href="<%=cp %>/info">정보</a></li>
				<li value="7"><a href="<%=cp %>/store">펫스토어</a></li>
				<li value="8"><a href="<%=cp %>/center">고객센터</a></li>
			</ul>
		</div>
	</div>
	
	<div class="header-right" align="right" style="line-height: 70px;">
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
                 &nbsp;|&nbsp;
                <a href="<%=cp%>/messenger">메신저</a>
                <c:if test="${sessionScope.member.memberId=='admin'}">
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/admin">관리자</a>
                </c:if>
            </c:if>
	</div>
	
	
</div>


<%-- 
<div class="header-bottom">
	<div class="menu-container hidden-md hidden-lg" align="center">
		<div style="float: right;">
			<a>▤ </a>
		</div>
	</div>
</div>
--%>
 