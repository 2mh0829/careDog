<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.thumbnail-wrappper {
	width: 25%;
}

.thumbnail {
	position: relative;
	padding-top: 100%; /* 1:1 ratio */
	overflow: hidden;
}

.thumbnail .centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-transform: translate(50%, 50%);
	-ms-transform: translate(50%, 50%);
	transform: translate(50%, 50%);
}

.thumbnail .centered img {
	position: absolute;
	top: 0;
	left: 0;
	max-width: 100%;
	height: auto;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
</style>


<div class="body-container">
	insert.
	
	<button type="submit" class="btn">등록</button>
	<button type="button" class="btn" onclick="location.href='<%=cp %>/mungstargram'">취소</button>







	<div class="thumbnail-wrapper">
		<div class="thumbnail">
			<div class="centered">
				<img src="<%=cp%>/resource/img/dog1.jpg">
			</div>
		</div>
	</div>







</div>