<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="body-container">
	insert.
	
	
	<button type="submit" class="btn">등록</button>
	<button type="button" class="btn" onclick="location.href='<%=cp %>/mungstargram'">취소</button>	
</div>