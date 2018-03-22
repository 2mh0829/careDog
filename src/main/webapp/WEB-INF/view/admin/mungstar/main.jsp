<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
	
#mungstarImg {
	position: absolute;
	top: 60px;
	left: 0;
	width: 100%;
}

#mungstarImg img {
	width: 100%;
}

.btn_rect_more {
    position: absolute;
    display: inline-block;
    width: 70px;
    height: 70px;
    margin: 20px 0 0 16px;
    top: 60%;
    right: 15%;
}

.square {
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0.5;
    display: inline-block;
    width: 70px;
    height: 70px;
    z-index: 100;
}

.line-top {
    transition: width 0.3s ease-out;
    width: 100%;
    left: 0;
    top: 0;
}

.line-right {
    transition: height 0.3s ease-out 0.3s;
    height: 100%;
    top: 0;
    right: 0;
}

.line-bottom {
    transition: width 0.3s ease-out 0.6s;
    width: 100%;
    right: 0;
    bottom: 0;
}

.line-left {
    transition: height 0.3s ease-out .9s;
    height: 100%;
    bottom: 0;
    left: 0;
}

.line-h {
	display: inline-block;
    width: 8px;
    height: 0;
    background: #fff;
    position: absolute;
    z-index: 1;
}

.line-w {
	display: inline-block;
	width: 0;
    height: 8px;
    background: #fff;
    position: absolute;
    z-index: 1;
}

.btn_rect_more .btn_more2 {
    position: relative;
    margin-top: 28px;
    margin-left: -16px;
    z-index: 101;
}

.btn_more2 {
    display: inline-block;
    color: #fff;
    vertical-align: middle;
    line-height: 14px;
}

</style>

<script>

$(function() {
	$(".btn_rect_more").one("hover", function() {
		$(".line-w").css("width", "70px");
		$(".line-h").css("height", "70px");
	});
	
	$(".btn_rect_more").trigger("hover");
});

</script>

<div id="mungstarImg">
	<img src="<%=cp %>/resource/img/mungstar/mungstar.png"> 
	
	<a href="" class="btn_rect_more">
		<div class="btn_more2">
			더보기&nbsp;<span class="glyphicon glyphicon-arrow-right"></span>
		</div>
		<span class="square">
			<span class="line-w line-top"></span>
			<span class="line-h line-right"></span>
			<span class="line-w line-bottom"></span>
			<span class="line-h line-left"></span>
		</span>
	</a>

</div>
