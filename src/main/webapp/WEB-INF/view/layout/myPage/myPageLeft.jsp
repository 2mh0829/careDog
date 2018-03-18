<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%/* aa */
   String cp = request.getContextPath();
%>

<style type="text/css">

.category-list {
	text-align:center;
}
.category-list ul{
	padding: 0px;
	list-style: none;
}
.category-list li{
	font-family: "Malgun Gothic", "Nanum Gothic", "Dotum";
	height: 22px;
	line-height: 22px;
}
.category-list .li-item{
	cursor: pointer;
}
.category-list .li-item:hover{
	background: #eee;
}
.category-list .li-active{
	background:#ddd;
}
</style>

<script type="text/javascript">
// 왼쪽 카테고리를 선택한 경우



function profile() {
	var url="${myPageUrl}/profile";
	$.get(url, {temp:new Date().getTime()}, function(data){
		$(".myPage-body").html(data);
	});
	
}
function editBlogProfileInfo() {
	var url="<%=cp%>/myPage/editBlogProfileInfo";
	$.get(url, {temp:new Date().getTime()}, function(data){
		$(".myPage-body").html(data);
	});
	
}

</script>

<div class="myPage-left">
     <div class="profile-photo">
          <c:if test="${empty  myPageInfo.profilePhoto}">
              <img src="<%=cp%>/resource/images/noimage.png" width="250" height="250">
          </c:if>
          <c:if test="${not empty  myPageInfo.profilePhoto}">
              <img style="border-radius:200px;" src="<%=cp%>/uploads/myPage/${myPageInfo.memberId}/${myPageInfo.profilePhoto}" width="250" height="250">
          </c:if>
           <c:if test="${myPageInfo.memberId==sessionScope.member.memberId}">
         <div style="margin-top:10px; padding: 5px 2px; text-align: center;">
             [<a href="javascript:editBlogProfileInfo();"><b>프로필 수정</b></a> <c:if test="${myPageInfo.memberId==sessionScope.member.memberId}">
                  | <a href="${myPageUrl}/manage"><b>관리</b></a>
             </c:if>]
         </div>
     </c:if>
     </div>
<%--      <div style="padding: 10px 2px 5px; white-space:pre;">${myPageInfo.introduce}</div> --%>
</div>

<div class="myPage-left"></div>
