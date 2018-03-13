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
		$(".blog-body").html(data);
	});
	
}
function secession() {
	var url = "<%=cp%>/mypage/secession";
	$.get(url, {
		tmp : new Date().getTime()
	}, function(data) {
		$(".blog-body").html(data);
	})
}
</script>

<div class="blog-left">
     <div class="profile-photo">
          <c:if test="${empty  blogInfo.profilePhoto}">
              <img src="<%=cp%>/resource/images/noimage.png" width="250" height="250">
          </c:if>
          <c:if test="${not empty  blogInfo.profilePhoto}">
              <img style="border-radius:200px;" src="<%=cp%>/uploads/blog/${blogInfo.memberId}/${blogInfo.profilePhoto}" width="250" height="250">
          </c:if>
           <c:if test="${blogInfo.memberId==sessionScope.member.memberId}">
         <div style="margin-top:10px; padding: 5px 2px; text-align: center;">
             [<a href="javascript:postInsert();"><b>프로필 사진 수정</b></a> <c:if test="${blogInfo.memberId==sessionScope.member.memberId}">
                  | <a href="${blogUrl}/manage"><b>관리</b></a>
             </c:if>]
         </div>
     </c:if>
     </div>
<%--      <div style="padding: 10px 2px 5px; white-space:pre;">${blogInfo.introduce}</div> --%>
    
   
   
      <div class="category-list">
	<a href="#">펫시터 등록하기</a><br><br><br>
	<a href="#">서비스이용내역</a><br><br><br>
	<a href="#">북마크</a><br><br><br>
	<a href="<%=cp%>/mypage/test">구매내역</a><br><br><br>
	<a href="#">봉사/후원 내역</a><br><br><br>
	<a href="javascript:secession();">회원탈퇴</a>
	</div>
       
</div>

<div class="blog-left"></div>
