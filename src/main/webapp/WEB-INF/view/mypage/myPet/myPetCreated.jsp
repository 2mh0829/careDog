<<<<<<< HEAD:src/main/webapp/WEB-INF/view/myPage/myPet/myPetCreated.jsp
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
	border: 1px dotted black;
	margin-left: 150px;
	padding-top: 70px; text-align : center;
	width: 200px;
	text-align: center;
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
	<span style="text-decoration: underline;">Q. 현재 반려동물을 키우고 있습니까?</span><br>
	<br> <input type="radio" name="havePet" id="havePet" value="1">현재 키우고 있음<br> <br> 
	<input type="radio" name="havePet" value="0">현재 키우고 있지 않지만 키운적이 있음<br> <br> <br> <br>
	<div style="border-bottom: 1px solid black;"></div>
	<br> <br> <br>
	<div class="inputPhoto">
		강아지가 잘 보일 수<br> 있는 사진을 올려주세요.<br>
			<input type="file" name="upload" value="+">
	</div>
	<br>
	<br>
	<br>
	<div style="width: 100%">
		<input placeholder="이름" name="myPetName"
			style="border-radius: 5px; border: 1px solid black; width: 47%; float: left; height: 30px;"
			type="text"><select
			style="border-radius: 5px; border: 1px solid black; height: 30px; float: right; width: 47%"
			name="myPetGender">
			<option value="">성별</option>
			<option value="m">수컷</option>
			<option value="f">암컷</option>
		</select>
	</div>
	<br>
	<br>
	<div style="width: 100%">
		<input placeholder="품종" name="myPetType"
			style="border-radius: 5px; border: 1px solid black; width: 47%; float: left; height: 30px;"
			type="text"><select
			style="border-radius: 5px; border: 1px solid black; height: 30px; float: right; width: 47%"
			name="myPetWeight">
			<option value="">무게</option>
			<option value="small">소형견(0~10kg)</option>
			<option value="large">대형견(10~20kg)</option>
		</select>
	</div>
	<div><br><br>
		<select name="myPetYear" style="border-radius: 5px; border: 1px solid black; width:100px; height: 30px;" name="gender">
			<option value="">년</option>
			<option value=1991>1991</option>
			<option value=1992>1992</option>
			<option value=1993>1993</option>
			<option value=1994>1994</option>
			<option value=1995>1995</option>
			<option value=1996>1996</option>
			<option value=1997>1997</option>
			<option value=1998>1998</option>
			<option value=1999>1999</option>
			<option value=2000>2000</option>
			<option value=2001>2001</option>
			<option value=2002>2002</option>
			<option value=2003>2003</option>
			<option value=2004>2004</option>
			<option value=2005>2005</option>
			<option value=2006>2006</option>
			<option value=2007>2007</option>
			<option value=2008>2008</option>
			<option value=2009>2009</option>
			<option value=2010>2010</option>
			<option value=2011>2011</option>
			<option value=2012>2012</option>
			<option value=2013>2013</option>
			<option value=2014>2014</option>
			<option value=2015>2015</option>
			<option value=2016>2016</option>
			<option value=2017>2017</option>
			<option value=2018>2018</option>
		</select> 
		<select name="myPetMonth" style="border-radius: 5px; border: 1px solid black; width:100px; height: 30px;" name="gender">
			<option value="">월</option>
			<option value=1>1월</option>
			<option value=2>2월</option>
			<option value=3>3월</option>
			<option value=4>4월</option>
			<option value=5>5월</option>
			<option value=6>6월</option>
			<option value=7>7월</option>
			<option value=8>8월</option>
			<option value=9>9월</option>
			<option value=10>10월</option>
			<option value=11>11월</option>
			<option value=12>12월</option>
		</select>
	</div>
	<br><br><br>
	<span style="text-decoration: underline;">Q. 반려동물 등록을 하였습니까?</span><br><br>
		<input type="radio" name="registerMyPet" value="1">내장형 무선식별장치 개체삽입<br><br>
		<input type="radio" name="registerMyPet" value="2">외장형 무선식별장치 부착<br><br>
		<input type="radio" name="registerMyPet" value="3">등록인식표 부착<br><br>
		<input type="radio" name="registerMyPet" value="4">하지 않음<br><br><br>
		
	<span style="text-decoration: underline;">Q. 중성화 수술 여부</span><br><br>
		<input type="radio" name="neutralization" value="1" >YES
		<input type="radio" name="neutralization" value="2">NO
		<input type="radio" name="neutralization" value="3">모름<br><br><br>
	
	<span style="text-decoration: underline;">Q. 다른개와 친화적인가요?</span><br><br>
		<input type="radio" name="friendly" value="1">YES
		<input type="radio" name="friendly" value="2">NO
		<input type="radio" name="friendly" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. 잘 짖습니까?</span><br><br>
		<input type="radio" name="bark" value="1" >YES
		<input type="radio" name="bark" value="2">NO
		<input type="radio" name="bark" value="3">모름<br>
		<input type="text" name="whenBark" disabled="disabled" style="width:600px;height:40px;" placeholder="짖는다면 어떤  상황에서 짖나요?&#13;짖을 경우에 따로 주의를 주는 행동이 있나요?"><br><br><br>
		
	<span style="text-decoration: underline;">Q. 앓고 있는 지병이나 이전에 다쳤던 적이 있나요?</span><br><br>
		<input type="radio" name="disease" value="1" >YES
		<input type="radio" name="disease" value="2">NO
		<input type="radio" name="disease" value="3">모름<br>	
		<input type="text" name="aboutDisease" disabled="disabled" style="width:600px;height:40px;" placeholder="아프거나 아팠던 적이 있다면, 관련해서 주의해야 할 행동이 있다면 적어주세요"><br><br><br>
	
	<span style="text-decoration: underline;">Q. 당신의 반려견은 대소변을 잘 가리는 편입니까?</span><br><br>
		<input type="radio" name="ddong" value="1">YES
		<input type="radio" name="ddong" value="2">NO<br>	
		<input type="text" name="whereDdong" disabled="disabled" style="width:600px;height:40px;" placeholder="주로 어느곳에 대소변을 하는지 알려주세요"><br><br><br>
	
	<span style="text-decoration: underline;">Q. 반려견은 실내에서 마킹(영역표시)를 하나요?</span><br><br>
		<input type="radio" name="territory" value="1" >YES
		<input type="radio" name="territory" value="2">NO<br>	
		<input type="text" name="whereTerritory" disabled="disabled" style="width:600px;height:40px;" placeholder="마킹을 한다면 주로 어느곳에 마킹을 하는지 알려주세요"><br><br><br>
		
	<span style="text-decoration: underline;">Q. 평소 분리불안증이 있는 편인가요? 있다면 이에 대처할 수 있는 방법은 무엇인가요?</span><br><br>
		<input type="radio" name="anxiety" value="1" >YES
		<input type="radio" name="anxiety" value="2">NO<br>	
		<input type="text" name="aboutAnxiety" disabled="disabled" style="width:600px;height:40px;" placeholder="분리불안 증상을 보일 경우 어떻게 하면 좋은지 알려주세요"><br><br><br>
		
	!!!예방접종 (아래 사항 중 한 가지라도 접종(복용)이 안 될 경우 산책이 금지 됩니다.)<br><br>
	
	<span style="text-decoration: underlinev  ;">Q. (심장사상충)약을 복용하였습니까?(월 1회/미 복용시 산책 금지)</span><br><br>
		<input type="radio" name="heartWorm" value="1">YES
		<input type="radio" name="heartWorm" value="2">NO
		<input type="radio" name="heartWorm" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. (종합 7종 백신)접종을 하였습니까?(연 1회)</span><br><br>
		<input type="radio" name="vaccine" value="1" >YES
		<input type="radio" name="vaccine" value="2">NO
		<input type="radio" name="vaccine" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. (코로나 장염)접종을 하였습니까?(연 1회)</span><br><br>
		<input type="radio" name="coronaEnteritis" value="1" >YES
		<input type="radio" name="coronaEnteritis" value="2">NO
		<input type="radio" name="coronaEnteritis" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. (켄넬코프)접종을 하였습니까?(연 1회)</span><br><br>
		<input type="radio" name="kennelCough" value="1">YES
		<input type="radio" name="kennelCough" value="2">NO
		<input type="radio" name="kennelCough" value="3">모름<br><br><br>
		
	<div style="border-bottom: 1px solid black;"></div><br><br><br>
	
	반려동물이 자주 다니는 동물병원을 입력해주세요.<br>
	위급시 사용될 수 있는 중요한 정보입니다.<br><br>
	<input type="radio" name="isHospital" value="1">있다
	<input type="radio" name="isHospital" value="2">없다<br><br>
	<input class="hospitalInfo" name="hospitalName" placeholder="병원명" style="border-radius: 5px; border: 1px solid black; width: 200px; float: left; height: 30px;"type="text"><br><br>
	<input class="hospitalInfo" name="hospitalTel1" value=""style="border-radius: 5px; border: 1px solid black; width: 50px; height: 30px;"type="text"> -
	<input class="hospitalInfo" name="hospitalTel2" value=""style="border-radius: 5px; border: 1px solid black; width: 50px; height: 30px;"type="text"> -
	<input class="hospitalInfo" name="hospitalTel3" value=""style="border-radius: 5px; border: 1px solid black; width: 50px; height: 30px;"type="text"><br><br>
	<input class="hospitalInfo" name="zipCode" id="zipCode" value=""style="border-radius: 5px; border: 1px solid black; width: 100px; float: left; height: 30px;"type="text">&nbsp;
	
	<button class="hospitalInfo" type="button" onClick="daumPostcode();">우편번호 검색</button><br><br>
	<input class="hospitalInfo" name="addr1" id="addr1" value=""style="border-radius: 5px; border: 1px solid black; width: 500px; float: left; height: 30px;"type="text"><br><br>
	<input class="hospitalInfo" name="addr2" id="addr2" placeholder="나머지 주소" style="border-radius: 5px; border: 1px solid black; width: 500px; float: left; height: 30px;"type="text"><br><br><br>
	<button type="button" name="sendButton" onClick="myPetOk();"
	style="margin-left:200px;">확인</button>
	
	</form>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
function daumPostcode(){
	daum.postcode.load(function(){
   		 new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    });
}
</script>
		
=======
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
	border: 1px dotted black;
	margin-left: 150px;
	padding-top: 70px; text-align : center;
	width: 200px;
	text-align: center;
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

/* 요요yoyo sdasdasdsdasd */
	str = f.myPetPhoto.value;
	str = str.trim();
	if(!str||str=="") {
		alert("강아지 사진을 업로드 해주세요.");
		return;
	}
	if(f.myPetPhoto.value!="") {
        if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.myPetPhoto.value)) {
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
	<span style="text-decoration: underline;">Q. 현재 반려동물을 키우고 있습니까?</span><br>
	<br> <input type="radio" name="havePet" id="havePet" value="1">현재 키우고 있음<br> <br> 
	<input type="radio" name="havePet" value="0">현재 키우고 있지 않지만 키운적이 있음<br> <br> <br> <br>
	<div style="border-bottom: 1px solid black;"></div>
	<br> <br> <br>
	<div class="inputPhoto">
		강아지가 잘 보일 수<br> 있는 사진을 올려주세요.<br>
			<input type="file" name="myPetPhoto" value="+">
	</div>
	<br>
	<br>
	<br>
	<div style="width: 100%">
		<input placeholder="이름" name="myPetName"
			style="border-radius: 5px; border: 1px solid black; width: 47%; float: left; height: 30px;"
			type="text"><select
			style="border-radius: 5px; border: 1px solid black; height: 30px; float: right; width: 47%"
			name="myPetGender">
			<option value="">성별</option>
			<option value="m">수컷</option>
			<option value="f">암컷</option>
		</select>
	</div>
	<br>
	<br>
	<div style="width: 100%">
		<input placeholder="품종" name="myPetType"
			style="border-radius: 5px; border: 1px solid black; width: 47%; float: left; height: 30px;"
			type="text"><select
			style="border-radius: 5px; border: 1px solid black; height: 30px; float: right; width: 47%"
			name="myPetWeight">
			<option value="">무게</option>
			<option value="small">소형견(0~10kg)</option>
			<option value="large">대형견(10~20kg)</option>
		</select>
	</div>
	<div><br><br>
		<select name="myPetYear" style="border-radius: 5px; border: 1px solid black; width:100px; height: 30px;" name="gender">
			<option value="">년</option>
			<option value=1991>1991</option>
			<option value=1992>1992</option>
			<option value=1993>1993</option>
			<option value=1994>1994</option>
			<option value=1995>1995</option>
			<option value=1996>1996</option>
			<option value=1997>1997</option>
			<option value=1998>1998</option>
			<option value=1999>1999</option>
			<option value=2000>2000</option>
			<option value=2001>2001</option>
			<option value=2002>2002</option>
			<option value=2003>2003</option>
			<option value=2004>2004</option>
			<option value=2005>2005</option>
			<option value=2006>2006</option>
			<option value=2007>2007</option>
			<option value=2008>2008</option>
			<option value=2009>2009</option>
			<option value=2010>2010</option>
			<option value=2011>2011</option>
			<option value=2012>2012</option>
			<option value=2013>2013</option>
			<option value=2014>2014</option>
			<option value=2015>2015</option>
			<option value=2016>2016</option>
			<option value=2017>2017</option>
			<option value=2018>2018</option>
		</select> 
		<select name="myPetMonth" style="border-radius: 5px; border: 1px solid black; width:100px; height: 30px;" name="gender">
			<option value="">월</option>
			<option value=1>1월</option>
			<option value=2>2월</option>
			<option value=3>3월</option>
			<option value=4>4월</option>
			<option value=5>5월</option>
			<option value=6>6월</option>
			<option value=7>7월</option>
			<option value=8>8월</option>
			<option value=9>9월</option>
			<option value=10>10월</option>
			<option value=11>11월</option>
			<option value=12>12월</option>
		</select>
	</div>
	<br><br><br>
	<span style="text-decoration: underline;">Q. 반려동물 등록을 하였습니까?</span><br><br>
		<input type="radio" name="registerMyPet" value="1">내장형 무선식별장치 개체삽입<br><br>
		<input type="radio" name="registerMyPet" value="2">외장형 무선식별장치 부착<br><br>
		<input type="radio" name="registerMyPet" value="3">등록인식표 부착<br><br>
		<input type="radio" name="registerMyPet" value="4">하지 않음<br><br><br>
		
	<span style="text-decoration: underline;">Q. 중성화 수술 여부</span><br><br>
		<input type="radio" name="neutralization" value="1" >YES
		<input type="radio" name="neutralization" value="2">NO
		<input type="radio" name="neutralization" value="3">모름<br><br><br>
	
	<span style="text-decoration: underline;">Q. 다른개와 친화적인가요?</span><br><br>
		<input type="radio" name="friendly" value="1">YES
		<input type="radio" name="friendly" value="2">NO
		<input type="radio" name="friendly" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. 잘 짖습니까?</span><br><br>
		<input type="radio" name="bark" value="1" >YES
		<input type="radio" name="bark" value="2">NO
		<input type="radio" name="bark" value="3">모름<br>
		<input type="text" name="whenBark" disabled="disabled" style="width:600px;height:40px;" placeholder="짖는다면 어떤  상황에서 짖나요?&#13;짖을 경우에 따로 주의를 주는 행동이 있나요?"><br><br><br>
		
	<span style="text-decoration: underline;">Q. 앓고 있는 지병이나 이전에 다쳤던 적이 있나요?</span><br><br>
		<input type="radio" name="disease" value="1" >YES
		<input type="radio" name="disease" value="2">NO
		<input type="radio" name="disease" value="3">모름<br>	
		<input type="text" name="aboutDisease" disabled="disabled" style="width:600px;height:40px;" placeholder="아프거나 아팠던 적이 있다면, 관련해서 주의해야 할 행동이 있다면 적어주세요"><br><br><br>
	
	<span style="text-decoration: underline;">Q. 당신의 반려견은 대소변을 잘 가리는 편입니까?</span><br><br>
		<input type="radio" name="ddong" value="1">YES
		<input type="radio" name="ddong" value="2">NO<br>	
		<input type="text" name="whereDdong" disabled="disabled" style="width:600px;height:40px;" placeholder="주로 어느곳에 대소변을 하는지 알려주세요"><br><br><br>
	
	<span style="text-decoration: underline;">Q. 반려견은 실내에서 마킹(영역표시)를 하나요?</span><br><br>
		<input type="radio" name="territory" value="1" >YES
		<input type="radio" name="territory" value="2">NO<br>	
		<input type="text" name="whereTerritory" disabled="disabled" style="width:600px;height:40px;" placeholder="마킹을 한다면 주로 어느곳에 마킹을 하는지 알려주세요"><br><br><br>
		
	<span style="text-decoration: underline;">Q. 평소 분리불안증이 있는 편인가요? 있다면 이에 대처할 수 있는 방법은 무엇인가요?</span><br><br>
		<input type="radio" name="anxiety" value="1" >YES
		<input type="radio" name="anxiety" value="2">NO<br>	
		<input type="text" name="aboutAnxiety" disabled="disabled" style="width:600px;height:40px;" placeholder="분리불안 증상을 보일 경우 어떻게 하면 좋은지 알려주세요"><br><br><br>
		
	!!!예방접종 (아래 사항 중 한 가지라도 접종(복용)이 안 될 경우 산책이 금지 됩니다.)<br><br>
	
	<span style="text-decoration: underlinev  ;">Q. (심장사상충)약을 복용하였습니까?(월 1회/미 복용시 산책 금지)</span><br><br>
		<input type="radio" name="heartWorm" value="1">YES
		<input type="radio" name="heartWorm" value="2">NO
		<input type="radio" name="heartWorm" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. (종합 7종 백신)접종을 하였습니까?(연 1회)</span><br><br>
		<input type="radio" name="vaccine" value="1" >YES
		<input type="radio" name="vaccine" value="2">NO
		<input type="radio" name="vaccine" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. (코로나 장염)접종을 하였습니까?(연 1회)</span><br><br>
		<input type="radio" name="coronaEnteritis" value="1" >YES
		<input type="radio" name="coronaEnteritis" value="2">NO
		<input type="radio" name="coronaEnteritis" value="3">모름<br><br><br>
		
	<span style="text-decoration: underline;">Q. (켄넬코프)접종을 하였습니까?(연 1회)</span><br><br>
		<input type="radio" name="kennelCough" value="1">YES
		<input type="radio" name="kennelCough" value="2">NO
		<input type="radio" name="kennelCough" value="3">모름<br><br><br>
		
	<div style="border-bottom: 1px solid black;"></div><br><br><br>
	
	반려동물이 자주 다니는 동물병원을 입력해주세요.<br>
	위급시 사용될 수 있는 중요한 정보입니다.<br><br>
	<input type="radio" name="isHospital" value="1">있다
	<input type="radio" name="isHospital" value="2">없다<br><br>
	<input class="hospitalInfo" name="hospitalName" placeholder="병원명" style="border-radius: 5px; border: 1px solid black; width: 200px; float: left; height: 30px;"type="text"><br><br>
	<input class="hospitalInfo" name="hospitalTel1" value=""style="border-radius: 5px; border: 1px solid black; width: 50px; height: 30px;"type="text"> -
	<input class="hospitalInfo" name="hospitalTel2" value=""style="border-radius: 5px; border: 1px solid black; width: 50px; height: 30px;"type="text"> -
	<input class="hospitalInfo" name="hospitalTel3" value=""style="border-radius: 5px; border: 1px solid black; width: 50px; height: 30px;"type="text"><br><br>
	<input class="hospitalInfo" name="zipCode" id="zipCode" value=""style="border-radius: 5px; border: 1px solid black; width: 100px; float: left; height: 30px;"type="text">&nbsp;
	
	<button class="hospitalInfo" type="button" onClick="daumPostcode();">우편번호 검색</button><br><br>
	<input class="hospitalInfo" name="addr1" id="addr1" value=""style="border-radius: 5px; border: 1px solid black; width: 500px; float: left; height: 30px;"type="text"><br><br>
	<input class="hospitalInfo" name="addr2" id="addr2" placeholder="나머지 주소" style="border-radius: 5px; border: 1px solid black; width: 500px; float: left; height: 30px;"type="text"><br><br><br>
	<button type="button" name="sendButton" onClick="myPetOk();"
	style="margin-left:200px;">확인</button>
	
	</form>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
function daumPostcode(){
	daum.postcode.load(function(){
   		 new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    });
}
</script>
		
>>>>>>> e3627eb54de605c15cde7d5898983e2424b3b4a0:src/main/webapp/WEB-INF/view/mypage/myPet/myPetCreated.jsp
</div>