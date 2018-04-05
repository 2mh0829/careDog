<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/* aaa */
	String cp = request.getContextPath();
%>
<style>
.myPetCreated-frame {
	border: 1px solid black;
	padding: 40px 200px 40px 200px;
	margin: 100px 200px 0 200px;
}

.inputPhoto {
	width: 200px;
	height: 200px;
	border-radius: 100px;
	margin-left: 150px;
	width: 200px;
}


input {
	padding-left: 5px;
}
</style>
<script>
$(function(){
	checkInputValue();
})
function myPetOk() {
	var f = document.myPetForm;
	var str;
 
	str = f.havePet.value;
	str = str.trim();
	if(!str||str=="") {
		alert("반려동물 키움 여부를 선택해 주세요. ");
		return;
	}

	str = f.upload.value;
	str = str.trim();
	if(!str||str=="") {
		alert("강아지 사진을 업로드 해주세요.");
		return;
	}
	if(f.upload.value!="") {
        if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
           alert("사진은 이미지 파일만 가능합니다. ");
           return false;
        }
     }   

	
    str = f.myPetName.value;
	str = str.trim();
    if(!str||str=="") {
        alert("강아지 이름을 입력하세요. ");
        return;
    }


    str = f.myPetGender.value;
	str = str.trim();
    if(!str||str=="") {
        alert("성별을 선택해 주세요.");
        return;
    }
    
    str = f.myPetType.value;
	str = str.trim();
    if(!str||str=="") {
        alert("품종을 입력해 주세요.");
        return;
    }
 
    str = f.myPetWeight.value;
	str = str.trim();
    if(!str||str=="") {
        alert("무게를 선택해 주세요.");
        return;
    }

    str = f.myPetYear.value;
	str = str.trim();
    if(!str||str=="") {
        alert("생년을 선택해 주세요.");
        return;
    }

    str = f.myPetMonth.value;
	str = str.trim();
    if(!str||str=="") {
        alert("생월를 선택해 주세요.");
        return;
    }
    
    str = f.registerMyPet.value;
	str = str.trim();
    if(!str||str=="") {
        alert("반려동물 등록 여부를 선택해 주세요.");
        return;
    }

    str = f.neutralization.value;
	str = str.trim();
    if(!str||str=="") {
        alert("중성화 수술 여부를 선택해 주세요.");
        return;
    }
    
    str = f.friendly.value;
	str = str.trim();
    if(!str||str=="") {
        alert("친화 여부를 선택해 주세요.");
        return;
    }
    
    str = f.bark.value;
	str = str.trim();
    if(!str||str=="") {
        alert("짖음 여부를 선택해 주세요.");
        return;
    }
    
    str = f.disease.value;
	str = str.trim();
    if(!str||str=="") {
        alert("질병 여부를 선택해 주세요.");
        return;
    }
    
    str = f.ddong.value;
	str = str.trim();
    if(!str||str=="") {
        alert("대소변 가림 여부를 선택해 주세요.");
        return;
    }
    
    str = f.territory.value;
	str = str.trim();
    if(!str||str=="") {
        alert("영역표시 여부를 선택해 주세요.");
        return;
    }
  
    str = f.anxiety.value;
	str = str.trim();
    if(!str||str=="") {
        alert("분리불안증 여부를 선택해 주세요.");
        return;
    }
    
    str = f.heartWorm.value;
	str = str.trim();
    if(!str||str=="") {
        alert("심상사상충 약 복용 여부를 선택해 주세요.");
        return;
    }
    
    str = f.vaccine.value;
	str = str.trim();
    if(!str||str=="") {
        alert("백신 접종 여부를 선택해 주세요.");
        return;
    }
    
    str = f.coronaEnteritis.value;
	str = str.trim();
    if(!str||str=="") {
        alert("코로나 장염 접종 여부를 선택해 주세요.");
        return;
    }
    
    str = f.kennelCough.value;
	str = str.trim();
    if(!str||str=="") {
        alert("켄넬코프 접종 여부를 선택해 주세요.");
        return;
    }
    
    str = f.isHospital.value;
	str = str.trim();
    if(!str||str=="") {
        alert("병원정보 여부를 선택해 주세요.");
        return;
    }
    
    var mode="${mode}";
    
    if(mode=="created")
   		f.action = "<%=cp%>/myPet/myPetCreated";
	else
   		f.action = "<%=cp%>/member/update";

    f.submit();
}
function checkInputValue(){

	$('body').on("change","[name='bark']:checked",function(){
		if($(this).val().trim()==1){
			$('[name="whenBark"]').removeAttr("disabled");
		}else{
			$('[name="whenBark"]').val("");
			$('[name="whenBark"]').attr("disabled","disabled");
			
		}
	})

	$('body').on("change","[name='disease']:checked",function(){
		if($(this).val().trim()==1){
			$('[name="aboutDisease"]').removeAttr("disabled");
		}else{
			$('[name="aboutDisease"]').val("");
			$('[name="aboutDisease"]').attr("disabled","disabled");
			
		}
	})

	$('body').on("change","[name='ddong']:checked",function(){
		if($(this).val().trim()==1){
			$('[name="whereDdong"]').removeAttr("disabled");
		}else{
			$('[name="whereDdong"]').val("");
			$('[name="whereDdong"]').attr("disabled","disabled");
			
		}
	})

	$('body').on("change","[name='territory']:checked",function(){
		if($(this).val().trim()==1){
			$('[name="whereTerritory"]').removeAttr("disabled");
		}else{
			$('[name="whereTerritory"]').val("");
			$('[name="whereTerritory"]').attr("disabled","disabled");
			
		}
	})

	$('body').on("change","[name='anxiety']:checked",function(){
		if($(this).val().trim()==1){
			$('[name="aboutAnxiety"]').removeAttr("disabled");
		}else{
			$('[name="aboutAnxiety"]').val("");
			$('[name="aboutAnxiety"]').attr("disabled","disabled");
			
		}
	})
	$('.hospitalInfo').attr("disabled","disabled");
 	$('body').on("change","[name='isHospital']:checked",function(){
		if($(this).val().trim()==1){
			$('.hospitalInfo').removeAttr("disabled");
		}else{
			$('.hospitalInfo').val("");
			$('.hospitalInfo').attr("disabled","disabled");
			
		}
	})

}
</script>
<div class="myPetCreated-frame">
<form name = "myPetForm" method="post" enctype="multipart/form-data">


	<br> <br> <br>
		<img class="inputPhoto"height=200px width=200px src="<%=cp %>/uploads/myPet/${myPetInfo.memberId}/${myPetInfo.myPetPhoto}">
	<br>
	<br>
	<br>
	<div style="width: 100%">
			이름 : ${myPetInfo.myPetName}<br>
			성멸 : ${myPetInfo.myPetGender}
	</div>
	<br>
	<br>
	<div style="width: 100%">
			${myPetInfo.myPetType}
			${myPetInfo.myPetWeight}
	</div>
	<div><br><br>
		${myPetInfo.myPetYear}년&nbsp;
		${myPetInfo.myPetMonth}월
	</div>
	<br><br><br>
	<span style="text-decoration: underline;">Q. 반려동물 등록을 하였습니까?</span><br><br>
		-> ${myPetInfo.registerMyPet}<br><br><br>
		
	<span style="text-decoration: underline;">Q. 중성화 수술 여부</span><br><br>
		-> ${myPetInfo.neutralization}<br><br><br>
	
	<span style="text-decoration: underline;">Q. 다른개와 친화적인가요?</span><br><br>
		-> ${myPetInfo.friendly}<br><br><br>
		
	<span style="text-decoration: underline;">Q. 잘 짖습니까?</span><br><br>
		-> ${myPetInfo.bark}<br><br>
		<c:if test="${myPetInfo.bark=='YES'}">
		<div style="border:1px solid black;width:600px;height:40px;">${myPetInfo.aboutDisease}</div>
		</c:if><br><br><br>
		
	<span style="text-decoration: underline;">Q. 앓고 있는 지병이나 이전에 다쳤던 적이 있나요?</span><br><br>
		-> ${myPetInfo.disease}<br><br>
		<c:if test="${myPetInfo.disease=='YES'}">
		<div style="border:1px solid black;width:600px;height:40px;">${myPetInfo.aboutDisease}</div>
		</c:if><br><br><br>
	
	<span style="text-decoration: underline;">Q. 당신의 반려견은 대소변을 잘 가리는 편입니까?</span><br><br>
		-> ${myPetInfo.ddong}<br><br>
		<c:if test="${myPetInfo.ddong=='YES'}">
		<div style="border:1px solid black;width:600px;height:40px;">${myPetInfo.wherDdong}</div>
		</c:if><br><br><br>
	
	<span style="text-decoration: underline;">Q. 반려견은 실내에서 마킹(영역표시)를 하나요?</span><br><br>
		-> ${myPetInfo.territory}<br><br>
		<c:if test="${myPetInfo.territory=='YES'}">
		<div style="border:1px solid black;width:600px;height:40px;">${myPetInfo.aboutAnxiety}</div>
		</c:if><br><br><br>
		
	<span style="text-decoration: underline;">Q. 평소 분리불안증이 있는 편인가요? 있다면 이에 대처할 수 있는 방법은 무엇인가요?</span><br><br>
		-> ${myPetInfo.anxiety}<br><br>
		<c:if test="${myPetInfo.anxiety=='YES'}">
		<div style="border:1px solid black;width:600px;height:40px;">${myPetInfo.aboutAnxiety}</div>
		</c:if><br><br><br>
		
	!!!예방접종 (아래 사항 중 한 가지라도 접종(복용)이 안 될 경우 산책이 금지 됩니다.)<br><br>
	
	<span style="text-decoration: underlinev  ;">Q. (심장사상충)약을 복용하였습니까?(월 1회/미 복용시 산책 금지)</span><br><br>
		${myPetInfo.heartWorm}<br><br><br>
		
	<span style="text-decoration: underline;">Q. (종합 7종 백신)접종을 하였습니까?(연 1회)</span><br><br>
		${myPetInfo.vaccine}<br><br><br>
		
	<span style="text-decoration: underline;">Q. (코로나 장염)접종을 하였습니까?(연 1회)</span><br><br>
		${myPetInfo.coronaEnteritis}<br><br><br>
		
	<span style="text-decoration: underline;">Q. (켄넬코프)접종을 하였습니까?(연 1회)</span><br><br>
		${myPetInfo.kennelCough}<br><br><br>
		
	<div style="border-bottom: 1px solid black;"></div><br><br><br>
	
	동물병원 정보<br>
	${myPetInfo.hospitalName }<br><br>
	<button type="button" name="sendButton" onClick="myPetList();" style="margin-left:200px;">확인</button>
	</form>
</div>
