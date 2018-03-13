<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.myPetList-list {
	margin-top:15px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 8px 6px;
}
</style>
<script>
	/* $(function(){
	 var a = $("#asc132").text();
	 console.log(a);
	 }); */
</script>
<div class="myPetList-body">
	<div class="myPetList-list">
		<div class="myPetList-detail">
			<div class="myPetList-detail-thumb-wrap">
				<div class="myPetList-detail-thumb"></div>
			</div>
			<div class="myPetList-detail-text-wrap">
				<div class="myPetList-detail-text">
					<p>
						흰둥이<br> (말티즈, 수컷, 5살)
					</p>
					<p>
						<a href="#">상세보기</a>
					</p>
					<p class="myPetInfoEditBtn">
						<a href="#">수정하기</a>
					</p>

				</div>
			</div>

		</div>
	</div>
	<div class="myPetList-list">
		<div class="myPetList-detail">
			<div class="myPetList-detail-thumb-wrap">
				<div class="myPetList-detail-thumb"></div>
			</div>
			<div class="myPetList-detail-text-wrap">
				<div class="myPetList-detail-text">
					<p>
						검둥이<br> (말티즈, 수컷, 5살)
					</p>
					<div class="myPetListEditBtn">

						<p>
							<a href="#">상세보기</a>
						</p>
						<p>
							<a class="myPetInfoEditBtn" href="#">수정하기</a>
						</p>
					</div>

				</div>
			</div>

		</div>
	</div>
	<div class="myPetList-add">
		<a href="#">+ 반려견 추가하기</a>
	</div>
</div>