<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>
$(function() {
	$("#img1").click(function() {
		var img = document.getElementById("img");
		img.src = "<%=cp %>/resource/img/gif/11.gif";
	});
	$("#img2").click(function() {
		var img = document.getElementById("img");
		img.src = "<%=cp %>/resource/img/gif/12.gif";
	});
	$("#img3").click(function() {
		var img = document.getElementById("img");
		img.src = "<%=cp %>/resource/img/gif/13.gif";
	});
});
</script>

<div>
	<div style="position: fixed; width: 14%;">
		<ul class="nav">
			<li><a id="img1">1</a></li>
			<li><a id="img2">2</a></li>
			<li><a id="img3">3</a></li>
		</ul>
	</div>
</div>
