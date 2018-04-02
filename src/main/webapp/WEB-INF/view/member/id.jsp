<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>

function changeEmail() {
    var str = $("#selectEmail").val();
    if(str!="direct") {
    	$("#email2").val(str);
    	$("#email2").attr("readOnly", "readOnly");
    }
    else {
    	$("#email2").val("");
    	$("#email2").attr("readOnly", "false");
    	$("#email2").focus();
    }
	
	if($("#email1").val() != "" && $("#email2").val() != ""){
		var email = $("#email1").val() + "@" + $("#email2").val();
		var data = {email:email};
		var url = "<%=cp %>/member/findId";
		$.ajax({
			url: url
			,data: data
			,type: "post"
			,dataType: "json"
			,success: function(data) {
				console.log(data);
				console.log(data.findId);
				if(data.findId != ""){
					$("#email-helper").css("color", "black");
					$("#email-helper").text("아이디 : " + data.findId);
				}else{
					$("#email-helper").css("color", "red");
					$("#email-helper").text("검색하신 이메일은 존재하지 않습니다.");
				}
			}
		});
	}else {
		$("#email-helper").css("color", "#ccc");
		$("#email-helper").text("이메일을 입력해주세요.");
	}
}

</script>

<div class="body-container">
	<div style="margin: 0px auto; width:460px;">
		<div>아이디찾기</div>
		<div>이메일 : 
			<p style="margin-top: 1px; margin-bottom: 5px;">
	            <input type="text" id="email1" size="13" maxlength="30" onchange="changeEmail();" class="boxTF">
	            @ 
	            <input type="text" id="email2" size="13" maxlength="30" onchange="changeEmail();" class="boxTF" readonly="readonly">
	            <select id="selectEmail" onchange="changeEmail();" class="selectField">
	                <option value="">선 택</option>
	                <option value="naver.com" >네이버 메일</option>
	                <option value="hanmail.net" >한 메일</option>
	                <option value="hotmail.com" >핫 메일</option>
	                <option value="gmail.com" >지 메일</option>
	                <option value="direct">직접입력</option>
	            </select>
	        </p>
	        <p id="email-helper" class="help-block">이메일을 입력해주세요.</p>
        </div>
	</div>
</div>