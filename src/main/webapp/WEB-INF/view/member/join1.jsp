<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
body {
	background: #f6f6f6;
}

.header {
	background: #f6f6f6;
}

.footer {
	background: #f6f6f6;
}

#join-img-box img {
	width: 100%;
}

.container {
	padding-top: 0;
}

</style>



<div class="body-container">
	<div id="join-img-box">
		<img src="<%=cp %>/resource/img/join1.jpg">
	</div>
</div>


