<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/* aa */
	String cp = request.getContextPath();
%>
<style>
.myPetList-list {
	margin-top: 15px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 8px 6px;
}
</style>
<script>
<<<<<<< HEAD
$(document).ready(function(){
	getMyPetList();
	
})

function getMyPetList(){
	var url="<%=cp%>/myPet/getMyPetList";
 	$.ajax({
		type:"POST",
		url:url,
		success:function(data){
			
			for(i=0;i<data.myPetList.length;i++){
				var year = data.myPetList[i].myPetYear;
				var d = new Date();
				var age = d.getFullYear()-year;
				$(".myPetList-body").append("<div class='myPetList-list'>"
					+"	<div class='myPetList-detail'>"
				+"<div class='myPetList-detail-thumb-wrap'>"
				+"	<div class='myPetList-detail-thumb'></div>"
			+"</div>"
				+"<div class='myPetList-detail-text-wrap'>"
					+"<div class='myPetList-detail-text'><img style='border-radius: 50px;' src='<%=cp%>/uploads/myPet/"+data.myPetList[i].memberId+"/"+data.myPetList[i].myPetPhoto+"' width='50' height='50'>"
						+"<p>"+data.myPetList[i].myPetName+" ("+data.myPetList[i].myPetType+","+data.myPetList[i].myPetGender+","+age+")</p>"
							+"<p><a href='javascript:myPetInfoDetail("+data.myPetList[i].myPetInfoId+");'>상세보기</a></p>"
						+"</div></div></div>");
			}
		},
		error:function(e){
			alert("연결 오류가 발생했습니다.");
		}
	}) 
}

=======
>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
function myPetCreated(){
	var url = "<%=cp%>/myPet/myPetCreated";
	$.get(url, function(data) {
		$(".myPage-layout").html(data);
	})
}
<<<<<<< HEAD
function myPetInfoDetail(myPetInfoId){
	var url = "<%=cp%>/myPet/myPetInfoDetail?myPetInfoId="+myPetInfoId;
	$.get(url, function(data) {
		$(".myPage-layout").html(data);
	})
}
function myPetInfoEdit(){
	var url = "<%=cp%>/myPet/myPetInfoDetail";
	$.get(url, function(data) {
		$(".myPage-layout").html(data);
	})
}

</script>
<div class="myPetList-body">
	
</div>
<div class="myPetList-add">
		<a href="javascript:myPetCreated();">+ 반려견 추가하기</a>
	</div>
=======

</script>
<div class="myPetList-body">
	<div class="myPetList-list">
		<div class="myPetList-detail">
			<div class="myPetList-detail-thumb-wrap">
				<div class="myPetList-detail-thumb"></div>
			</div>
			<div class="myPetList-detail-text-wrap">
				<div class="myPetList-detail-text">
					<p>흰둥이 (말티즈, 수컷, 5살)</p>
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
		<a href="javascript:myPetCreated();">+ 반려견 추가하기</a>
	</div>
</div>
>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
