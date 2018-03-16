<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function() {
		var idx = "${menu}";
		if (!idx)
			idx = 0;
		var menu = $(".list-menu-item")[idx];
		$(menu).addClass("active");
	});

	function guestbook() {
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[3];
		$(menu).addClass("active");

		var url = "${myPageUrl}/guest";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$("#myPage-content").html(data);
		});
	}

	function photoView() {
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[2];
		$(menu).addClass("active");

		var url = "${myPageUrl}/photo";
		var owner = "${owner}";
		var bid = "${myPageInfo.memberId}";
		$.post(url, {
			bid : bid,
			owner : owner,
			tmp : new Date().getTime()
		}, function(data) {
			$("#myPage-content").html(data);
		});
	}

	function prologue() {
		var url = "${myPageUrl}/prologue";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$("#myPage-content").html(data);
		});
	}
	function messenger() {
		var url = "<%=cp%>/messenger";
	/* 	$('.myPage-body-left').remove(); */
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-body").html(data);
		})
	}
	function editMemberInfo() {
		var url = "<%=cp%>/member/editMemberInfo";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-body").html(data);
		})
	}
	function myPetList() {
		var url = "<%=cp%>/myPage/myPetList";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-body").html(data);
		})
	}
	function orderManage() {
		var url = "<%=cp%>/orderManage/main";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-body").html(data);
		})
	}
</script>

<%-- <div class="myPage-header-top">
	<div style="float: right; text-align: right;">
		<c:if test="${myPageInfo.memberId!=sessionScope.member.memberId}">
			<a href="<%=cp%>/nmyPage/me">내 블로그</a>
								&nbsp;|&nbsp;
						</c:if>
		<a href="">이웃 블로그</a> &nbsp;|&nbsp; <a href="<%=cp%>/nmyPage">전체 블로그</a>
	</div>
</div> --%>

<div class="myPage-header-menu">
	<ul class="nav">
		<li class="list-menu-item"><a href="${myPageUrl}">메인</a></li>
		<li class="list-menu-item"><a href="javascript:editMemberInfo();">개인정보수정</a></li>
	<!-- 	<li class="list-menu-item"><a href="javascript:photoView();">포토</a></li> -->
		<li class="list-menu-item"><a href="javascript:myPetList();">마이펫</a></li>
		<li class="list-menu-item"><a href="javascript:orderManage();">주문관리</a></li>
		<li class="list-menu-item"><a href="javascript:messenger();">메신저</a></li>
		<li class="list-menu-item"><a href="javascript:messenger();">일정관리</a></li>
		<li class="list-menu-item"><a href="javascript:messenger();">친구관리</a></li>
		<li class="list-menu-item"><a href="javascript:messenger();">펫시터 서비스 관리</a></li>
		<li class="list-menu-item"><a href="javascript:messenger();">펫시터 등록하기</a></li>
		<li class="list-menu-item"><a href="javascript:messenger();">이용현황</a></li>
	</ul>
</div>
