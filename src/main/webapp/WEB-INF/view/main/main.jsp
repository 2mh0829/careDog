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
	background : url (img.jpg) center center fixed no-repeat;
}

#main-vidio{
	position: absolute;
	width: 1200px;
	top: 70px;
	left: 0px;
}

video {
	/* position : fixed; */
	top : 0;
	left : 0;
	min-width : 100 %;
	min-height : 100 %;
	width : auto;
	height : auto;
	z-index : -1;
}

</style>



<div id="main-vidio">
	<video autoplay loop poster="img.jpg">
		<source src="<%=cp %>/resource/vidio/main_vidio.mp4">
	</video>
</div>

<div class="body-container" style="width: 70%; height: 800px;">

</div>