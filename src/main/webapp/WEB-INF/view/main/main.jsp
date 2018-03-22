<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
   String cp = request.getContextPath();
%>

<style>

body {
	margin : 0;
	padding : 0;
	background : black;
	overflow: hidden;
}

ul.navi li a {
	color: white;
}

.header-right a {
	color: white;
}

#main-vidio{
	position: absolute;
	width: 100%;
	top: 0; 
	left: 0;
}

video {
	/* position : fixed; */
	top : -50;
	left : 0;
	min-width : 100%;
	min-height : 100%;
	width : 100%;
	height : auto;
	z-index : -1;
}

.header-left {
	color: white;
	font-size: 30px;
	font-weight: bold;
}

</style>

<script type="text/javascript">

	$("#menu-background").html("");
	$(".header-left").html("<a href='<%=cp %>'><img src='<%=cp %>/resource/img/logo_white.png'></a>");
	
</script>

<div id="main-vidio">
	<video autoplay loop>
		<source src="<%=cp %>/resource/vidio/main_vidio.mp4">
	</video>
</div>

<div class="body-container" style="width: 70%; height: 800px;">

</div>