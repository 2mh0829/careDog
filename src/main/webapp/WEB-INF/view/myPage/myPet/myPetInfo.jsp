<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%/* aa */
	String cp = request.getContextPath();
%>
<style>
.myPetInfo-frame {
	margin-top: 15px;
	margin-bottom:15px;
	border-radius:5px;
	border: 1px solid #ccc;
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

	function get() {
		var a = console.log(a);
	}
</script>
<div class="myPetInfo-frame">
	<div class="myPetInfo-header">강아지 정보 보기</div>
	<div class="myPetInfo-body">
		개정보<br> 말티즈<br> 15살<br> 수컷<br>
	</div>

</div>
