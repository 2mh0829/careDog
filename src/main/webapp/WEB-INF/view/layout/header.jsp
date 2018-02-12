<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>

$(window).scroll(function() {
	if($(this).scrollTop() >= 50){
		$(".header-bottom").css("position","fixed");
		$(".header-bottom").css("top","0px");
		$(".header-bottom").css("background","#d26ea5");
		$(".menu").css("position","fixed");
		$(".menu").css("top","0px");
		$("ul.navi li a").css("color","white");
	}else{
		$(".menu").css("position","absolute");
		$(".header-bottom").css("position","relative");
		$(".header-bottom").css("background","");
		$("ul.navi li a").css("color","black");
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
				CareDog
			</a>
		</span>
	</div>
	<div class="header-right" align="right" style="line-height: 70px;">
		<a href="<%=cp %>/login">sign in</a> &nbsp;&nbsp;
		<a href="<%=cp %>/join">sign up</a>
	</div>
	
	
</div>

<div class="header-bottom">
	<div class="menu-container" align="center">
		<div class="menu">
			<ul class="navi">
				<li><a href="<%=cp %>/intro">Abt.careDog</a></li>
				<li><a href="<%=cp %>/service">Service</a></li>
				<li><a href="<%=cp %>/mungstargram">mungstargram</a></li>
				<li><a href="<%=cp %>/strayDog">유기견</a></li>
				<li><a href="<%=cp %>/dog119">애견119</a></li>
				<li><a href="<%=cp %>/info">정보</a></li>
				<li><a href="<%=cp %>/store">펫스토어</a></li>
				<li><a href="<%=cp %>/center">고객센터</a></li>
			</ul>
		</div>
	</div>
</div>
