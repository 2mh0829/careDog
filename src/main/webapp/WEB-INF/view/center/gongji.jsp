<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
  <tr><td height="1" colspan="5" bgcolor="#cccccc"></td></tr>
  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
      <th width="60" style="color: #787878;">번호</th>
  	  <th width="80" style="color: #787878;">분류</th>
      <th style="color: #787878;">제목</th>
      <th width="80" style="color: #787878;">작성일</th>
  </tr>
 
 <c:forEach var="dto" items="${gongjiList}">
  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
      <td><span style="display: inline-block;width: 28px;height:18px;line-height:18px; background: #ED4C00;color: #FFFFFF">공지</span></td>
      <td align="left" style="padding-left: 10px;">
           <a href="javascript:articleBoard('${dto.num}', '${pageNo}');">${dto.subject}</a>
      </td>
      <td>${dto.created}</td>
  </tr>
</c:forEach>

<c:forEach var="dto" items="${list}">
  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
      <td>${dto.num}</td>
      <td align="left" style="padding-left: 10px;">
           <a href="javascript:contentBoard('${dto.num}', '${pageNo}');">${dto.subject}</a>
      </td>
      <td>${dto.isGongji }</td>
      <td>${dto.subject }</td>
      <td>${dto.created}</td>
  </tr>
  </c:forEach>
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
      <td align="center">
          <form name="searchForm" action="" method="post">
              <select id="searchKey" name="searchKey" class="selectField">
                  <option value="subject">제목</option>
                  <option value="content">내용</option>
                  <option value="created">등록일</option>
            </select>
            <input type="text" id="searchValue" name="searchValue" class="boxTF">
            <button type="button" class="btn" onclick="searchList();">검색</button>
        </form>
      </td>
      <td align="right" width="100">
          <button type="button" class="btn" onclick="insertForm();">글올리기</button>
      </td>
   </tr>
</table>
