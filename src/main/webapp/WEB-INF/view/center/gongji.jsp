<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<table class="board-list-1s">
						<caption></caption>
						<colgroup>
							<col style="width:9%;">
							<col style="width:79%;">
							<col style="width:12%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list }">
								<tr>
								<td>${dto.num }</td>
								<td class="subject">
								<c:if test="${dto.isGongji == 1}">
								<strong class="FG02">공지사항</strong>
								</c:if>
								${dto.subject }</td>
								<td>${dto.created }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
 
<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
       <c:if test="${dataCount==0 }">
           등록된 게시물이 없습니다.
       </c:if>
       <c:if test="${dataCount!=0 }">
           ${paging}
       </c:if>
	</td>
   </tr>
</table>

<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
   <tr height="40">
      <td align="left" width="100">
          <button type="button" class="btn" onclick="reloadBoard();">새로고침</button>
      </td>
      <td align="right" width="100">
      <c:if test="${sessionScope.member.memberId=='admin' }">
          <button type="button" class="btn" onclick="insertForm();">글올리기</button>
      </c:if>    
      </td>
   </tr>
</table>
