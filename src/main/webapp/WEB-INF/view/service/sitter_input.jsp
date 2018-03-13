<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>

.input-environment {
	padding: 12px 12px;
    height: 800px;
    background: #ffda7c;
    border: 2px solid #ffcb47;
}

.inputTitle {
	width: 120px;
    height: 34px;
    border-radius: 4px;
    border: 1px solid #ccc;
    background: white;
}

.titleFont {
	font-weight: bold;
    font-size: 20px;
}

</style>

<div class="body-container">
	<h1>sitter_input</h1>
	<div class="input-environment">
		<form class="">
			<label class="titleFont">글 제목</label> : <input type="text" class="inputTitle">
		</form>
	</div>
</div>