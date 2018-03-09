<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
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


// 포스트 글쓰기 폼
function postInsert() {
	var url="${blogUrl}/postInsert";
	$.get(url, {temp:new Date().getTime()}, function(data){
		$("#blog-content").html(data);
	});
}

function profile() {
	var url="${blogUrl}/profile";
	$.get(url, {temp:new Date().getTime()}, function(data){
		$("#blog-content").html(data);
	});
	
}
</script>

<div class="blog-left">
     <div class="profile-photo">
          <c:if test="${empty  blogInfo.profilePhoto}">
              <img src="<%=cp%>/resource/images/noimage.png" width="164" height="164">
          </c:if>
          <c:if test="${not empty  blogInfo.profilePhoto}">
              <img src="<%=cp%>/uploads/blog/${blogInfo.memberId}/${blogInfo.profilePhoto}" width="164" height="164">
          </c:if>
     </div>
     <div style="padding: 10px 2px 5px; white-space:pre;">${blogInfo.introduce}</div>
     <c:if test="${blogInfo.memberId==sessionScope.member.memberId}">
         <div style="padding: 5px 2px; text-align: center;">
             [<a href="javascript:postInsert();"><b>포스트 글쓰기</b></a>]
         </div>
     </c:if>
     <div style="padding: 5px 2px; text-align: center;">
             <a href="javascript:profile()">프로필</a>
             <c:if test="${blogInfo.memberId!=sessionScope.member.memberId}">
                 | <a href="">이웃추가</a>
             </c:if>
             <c:if test="${blogInfo.memberId==sessionScope.member.memberId}">
                  | <a href="${blogUrl}/manage">관리</a>
             </c:if>
             | <a href="">쪽지</a>
     </div>
</div>

<div class="blog-left">
    <div class="category-list">
	<a href="<%=cp%>/mypage/editMember">개인정보수정</a><br>
	<a href="#">마이펫</a><br>
	<a href="#">펫시터 등록하기</a><br>
	<a href="#">서비스이용내역</a><br>
	<a href="#">북마크</a><br>
	<a href="#">장바구니</a><br>
	<a href="<%=cp%>/mypage/test">구매내역</a><br>
	<a href="#">봉사/후원 내역</a><br>
	<a href="/mypage/secession">회원탈퇴</a>
	</div>
</div>
