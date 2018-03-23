<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%/* aa */
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function() {
		var idx = "${menu}";
		if (!idx)
			idx = 0;
		var menu = $(".list-menu-item")[idx];
		$(menu).addClass("active");
		console.log($(menu));
	});

var mInterval; <%--메신저 interval 컨트롤 변수--%>

	function editMemberInfo() {
		clearInterval(mInterval);
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[1];
		$(menu).addClass("active");
		var url = "<%=cp%>/member/editMemberInfo";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-layout").html(data);
		})
	}
	function myPetList() {
		clearInterval(mInterval);
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[2];
		$(menu).addClass("active");
		var url = "<%=cp%>/myPage/myPetList";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-layout").html(data);
		})
	}
	function orderManage() {
		clearInterval(mInterval);
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[3];
		$(menu).addClass("active");
		var url = "<%=cp%>/orderManage/main";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-layout").html(data);
		})
	}
	function messenger() {
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[4];
		$(menu).addClass("active");

		var url = "<%=cp%>/messenger";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-layout").html(data);
		})
	}
	function schMain() {
		clearInterval(mInterval);
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[5];
		$(menu).addClass("active");
		var url = "<%=cp%>/sch/schMain";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-layout").empty();
			$(".myPage-layout").html(data);
		})
	}
	function manageCDService() {
		clearInterval(mInterval);
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[6];
		$(menu).addClass("active");
	<%-- 	var url = "<%=cp%>/service/sitter_input";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-body").html(data);
		}) --%>
		alert('준비중입니다');
	}
	function registerPS() {
		clearInterval(mInterval);
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[7];
		$(menu).addClass("active");
		var url = "<%=cp%>/service/sitter_input";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-layout").html(data);
		})
	}
	function historyMain() {
		clearInterval(mInterval);
		$(".list-menu-item").each(function() {
			$(this).removeClass("active");
		});
		var menu = $(".list-menu-item")[8];
		$(menu).addClass("active");
		var url = "<%=cp%>/myPage/historyMain";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPage-layout").html(data);
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
	<!-- 	<li class="list-menu-item"><a href="javascript:schMain();">일정관리</a></li> -->
		<li class="list-menu-item"><a href="javascript:manageCDService();">CareDog 서비스 관리</a></li>
		<li class="list-menu-item"><a href="javascript:registerPS();">펫시터 등록하기</a></li>
		<li class="list-menu-item"><a href="javascript:historyMain();">이용현황</a></li>
	</ul>
</div>
