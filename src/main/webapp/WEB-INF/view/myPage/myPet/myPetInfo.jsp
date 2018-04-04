<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%/* aa */
	String cp = request.getContextPath();
%>
<style>
.myPetInfo-frame {
<<<<<<< HEAD
	border-radius:20px;
=======
	border-radius:5px;
>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
	width:100%;
	float:left;
		padding:15px;
		background-color:white;
<<<<<<< HEAD
		
=======
>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
}

.myPetInfo-header {
	padding:5px;
	border-bottom: 1px solid #ccc;
}

.myPetInfo-body {
	padding:5px;
<<<<<<< HEAD
}
.myPetList-list {
	margin-top: 15px;
	border-bottom: 1px solid #ccc;
	padding: 8px 6px;
=======
	display: none;
>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
}
</style>

<script>
<<<<<<< HEAD
$(document).ready(function(){
	var url="<%=cp%>/myPet/getMyPetList";
 	$.ajax({
		type:"POST",
		url:url,
		success:function(data){
			for(i=0;i<data.myPetList.length;i++){
				var year = data.myPetList[i].myPetYear;
				var d = new Date();
				var age = d.getFullYear()-year;
				$(".myPetInfo-body").append("<div class='myPetList-list'>"
					+"	<div class='myPetList-detail'>"
				+"<div class='myPetList-detail-thumb-wrap'>"
				+"	<div class='myPetList-detail-thumb'></div>"
			+"</div>"
				+"<div class='myPetList-detail-text-wrap'>"
					+"<div class='myPetList-detail-text'><img style='border-radius: 50px;' src='<%=cp%>/uploads/myPet/"+data.myPetList[i].memberId+"/"+data.myPetList[i].myPetPhoto+"' width='50' height='50'>"
						+"<p>"+data.myPetList[i].myPetName+" ("+data.myPetList[i].myPetType+","+data.myPetList[i].myPetGender+","+age+")</p></div></div></div>");
			}
		},
		error:function(e){
			alert("연결 오류가 발생했습니다.");
		}
	}) 
})


</script>
<div class="myPetInfo-frame">
	<div class="myPetInfo-header">강아지 정보 보기</div>
	<div class="myPetInfo-body">
	</div>

</div>
=======
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

>>>>>>> 27f153d7c1f4b21cad243e6b8848f753c90daff8
