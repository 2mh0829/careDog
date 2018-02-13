<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>
$(function() {
	$("#idx1").click(function() {
		var img = document.getElementById("img");
		img.src = "<%=cp %>/resource/img/gif/11.gif";
	});
	$("#idx2").click(function() {
		var img = document.getElementById("img");
		img.src = "<%=cp %>/resource/img/gif/12.gif";
	});
	$("#idx3").click(function() {
		var img = document.getElementById("img");
		img.src = "<%=cp %>/resource/img/gif/13.gif";
	});
});
</script>

<div style="position: fixed; width: 14%;">
	<ul class="nav">
		<li><a id="idx1">1</a></li>
		<li><a id="idx2">2</a></li>
		<li><a id="idx3">3</a></li>
	</ul>
</div>
