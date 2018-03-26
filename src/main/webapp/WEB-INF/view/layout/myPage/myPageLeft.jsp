<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	/* aa */
	String cp = request.getContextPath();
%>
<%-- 		<tiles:insertAttribute name="myPageLeft" />
		<tiles:insertAttribute name="myPageLeft2" />
		<tiles:insertAttribute name="myPageLeft3" /> --%>
<jsp:include page="/WEB-INF/view/myPage/main/myPageProfilePhoto.jsp" flush="true"/>
<jsp:include page="/WEB-INF/view/myPage/main/profile.jsp" flush="true"/>
<jsp:include page="/WEB-INF/view/myPage/myPet/myPetInfo.jsp" flush="true"/>