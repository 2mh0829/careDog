<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
   String cp = request.getContextPath();
%>

<style>
.main-image{
	position: absolute;
	top: 0px;
	left: 0px;
}
</style>

<script>
var i = 0;
setInterval(function() {
	if(i == 4) i = 0;
	i++;
	var mainImg = document.getElementById("mainImg");
	mainImg.src = "<%=cp %>/resource/img/dog" + i + ".jpg";
}, 5000);
</script>

<div class="main-image">
	<img id="mainImg" src="<%=cp %>/resource/img/dog1.jpg" style="width: 100%;">
</div>

<div class="body-container" style="width: 70%;">
</div>