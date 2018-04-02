<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%/* aa */
	String cp = request.getContextPath();
%>
<style>
.myPetInfo-frame {
	border-radius:5px;
	width:100%;
	float:left;
		padding:15px;
		background-color:white;
}

.myPetInfo-header {
	padding:5px;
	border-bottom: 1px solid #ccc;
}

.myPetInfo-body {
	padding:5px;
	display: none;
}
</style>

<script>
$(function(){
	var url = "<%=cp%>/myPage/myPetList";
		$.get(url, {
			tmp : new Date().getTime()
		}, function(data) {
			$(".myPetInfo-body").html(data);
			$(".myPetInfo-body").html($(".myPetList-list").eq(0).html());
			$(".myPetInfo-body").css("display", "block");
			$(".myPetInfoEditBtn").css("display", "none");
			$(".myPetList-list").css("margin-top", "15px");
			//	get();
		})
	});

</script>
<div class="myPetInfo-frame">
	<div class="myPetInfo-header">강아지 정보 보기</div>
	<div class="myPetInfo-body">
	</div>

</div>
>>>>>>> e3627eb54de605c15cde7d5898983e2424b3b4a0:src/main/webapp/WEB-INF/view/mypage/myPet/myPetInfo.jsp
