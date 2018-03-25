<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	/* aa */
	String cp = request.getContextPath();
%>
 
		<%-- <tiles:insertAttribute name="myPageRight" /> --%>
	<%--	<tiles:insertAttribute name="myPageRight2" /> --%>
	
<jsp:include page="/WEB-INF/view/myPage/sch/sch2.jsp" flush="true"/>