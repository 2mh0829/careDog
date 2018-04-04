<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
thead tr{
border-top: 2px solid #888
}
*{
margin:0;
padding:0;
}
tr td{
padding: 23px 18px 24px;
    border-bottom: 1px solid #e6e6e6;
    color: #666;
    font-size: 14px;
    text-align: center;
    line-height: 20px;
    vertical-align: middle;
}
</style>

<div id="listReply">
<table>
<tr>
	<td width="130px;"><strong>${dto.num }번 문의답변</strong></td>
	<td width="669px;">${dto.acontent }</td>
	<td width="112px;">${dto.memberId }</td>
	<td width="112px;">${dto.adate }</td>
</tr>
</table>
</div>