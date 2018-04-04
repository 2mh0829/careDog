<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>
function changeEmail() {
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
		f.email2.focus(); 
    }
    
    if(f.email1.value != "" && f.email2.value != "" && f.memberId.value != ""){
    	emailChecked();
    }else{
    	$("#email-helper").css("color", "#ccc");
    	$("#email-helper").text("모두 입력해주세요.");
    }
   
}

function emailChecked() {
	var f = document.memberForm;
	var url = "<%=cp %>/member/emailChecked";
	var memberId = f.memberId.value;
	var email1 = f.email1.value;
	var email2 = f.email2.value;
	var email = email1 + "@" + email2;
	var data = {memberId:memberId, email:email};
	
	$.ajax({
		url: url
		,data: data
		,type: "post"
		,dataType: "json"
		,success: function(data) {
			if(data != 0){
		    	$("#email-helper").text("");
				openDialog();
			}else{
				$("#email-helper").css("color", "red");
		    	$("#email-helper").text("입력하신 정보가 일치하지 않습니다.");
			}
		}
	});
}

function openDialog() {
	$( "#dialog-confirm" ).css("visibility", "visible");
	$( "#dialog-confirm" ).dialog({
		resizable : false,
		height : "auto",
		width : 400,
		modal : true
	});
}

function changePwd() {
	var url = "<%=cp %>/member/changePwd";
	var memberId = $("#memberId").val();
	var userPwd = $("#userPwd").val();
	var data = {memberId:memberId, userPwd:userPwd};
	$.ajax({
		url: url
		,data: data
		,type: "post"
		,dataType: "json"
		,success: function(data) {
			if(data != 0){
				$("#authNum-Help").css("color", "blue");
		    	$("#authNum-Help").html("패스워드가 변경되었습니다.<br><button class='btn' method='get' onclick='location.href=\"<%=cp %>/member/login\"'>로그인으로 이동</button>");
			}
		}
		,error: function(e) {
			console.log(e);
		}
	});
}

function userPwdChecked1() {
	var str = $("#userPwd").val();
	str = str.trim();
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,12}$/i.test(str)) { 
		$("#userPwd-Help").css("color", "red");
		$("#userPwd-Help").text("패스워드는 5~12자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		$("#userPwd").focus();
		return;
	}
	userPwdChecked2();
}

function userPwdChecked2() {
	if($("#userPwd").val() != "" && $("#userPwdCheck").val() != ""){
		if($("#userPwd").val() != $("#userPwdCheck").val()){
			$("#userPwd-Help").css("color", "red");
			$("#userPwd-Help").text("패스워드가 일치하지 않습니다.");
		}else{
			$("#userPwd-Help").css("color", "blue");
			$("#userPwd-Help").text("패스워드 일치 : 인증메일 발송중...");
			$("#userPwdCheck").attr("onkeyup", "");
			$("#userPwdCheck").attr("onchange", "");
			$("#userPwd").attr("readOnly", "readOnly");
			$("#userPwdCheck").attr("readOnly", "readOnly");
			sendEmailForChangePwd();
		}
	}else{
		$("#userPwd-Help").css("color", "red");
		$("#userPwd-Help").text("패스워드가 일치하지 않습니다.");
	}
}

function sendEmailForChangePwd() {
	var url = "<%=cp %>/member/sendEmailForChangePwd";
	var f = document.memberForm;
	var email1 = f.email1.value;
	var email2 = f.email2.value;
	var email = email1 + "@" + email2;
	var data = {email:email};
	
	$.ajax({
		url: url
		,data: data
		,type: "post"
		,dataType: "json"
		,success: function(data) {
			$("#userPwd-Help").css("color", "black");
			$("#userPwd-Help").html("<p style='color: blue'>인증번호가 발송되었습니다.</p>인증번호 : <input id='authNum' onkeyup='authFun("+data+");' type='text'>");
		}
	});
}

function authFun(authNum) {
	if(authNum == $("#authNum").val()){
		$("#authNum").attr("readOnly", "readOnly");
		$("#authNum-Help").css("color", "blue");
		$("#authNum-Help").html("인증되었습니다.<br><button onclick='changePwd();' style='color: black;'>변경하기</button>");
	}else{
		$("#authNum-Help").css("color", "red");
		$("#authNum-Help").html("인증번호가 일치하지 않습니다.");
	}
}

</script>

<div class="body-container">
	<div style="margin: 0px auto; width:460px;">
		<div>패스워드 찾기</div>
		<form name="memberForm" action="<%=cp %>/member/login" method="get">
			<div>아이디 : <input type="text" id="memberId" name="memberId" class="boxTF"></div>
			<div>이메일 : 
				<p style="margin-top: 1px; margin-bottom: 5px;">
		            <input type="text" name="email1" size="13" maxlength="30" onchange="changeEmail();" class="boxTF">
		            @ 
		            <input type="text" name="email2" size="13" maxlength="30" onchange="changeEmail();" class="boxTF" readonly="readonly">
		            <select name="selectEmail" onchange="changeEmail();" class="selectField">
		                <option value="">선 택</option>
		                <option value="naver.com" >네이버 메일</option>
		                <option value="hanmail.net" >한 메일</option>
		                <option value="hotmail.com" >핫 메일</option>
		                <option value="gmail.com" >지 메일</option>
		                <option value="direct">직접입력</option>
		            </select>
		        </p>
		        <p id="email-helper" class="help-block">모두 입력해주세요.</p>
		        <div>
		        	<button type="button" class="btn" onclick="location.href='<%=cp %>/member/id'">아이디 찾기로 이동</button>
		        	<button type="button" class="btn" onclick="location.href='<%=cp %>/member/login'">로그인으로 이동</button>
		        </div>
	        </div>
		</form>
	</div>
</div>

<div id="dialog-confirm" title="패스워드 재설정" style="visibility: hidden;">
	<p align="right">
		<span style="float: left; margin: 12px 12px 20px 0;"></span>
		변경할 패스워드 : <input type="password" id="userPwd" name="userPwd" maxlength="15" class="boxTF" style="width:55%;" placeholder="패스워드" onchange="userPwdChecked1();">
		패스워드 확인 : <input type="password" id="userPwdCheck" name="userPwdCheck" maxlength="15" class="boxTF" style="width:55%;" placeholder="패스워드" onchange="userPwdChecked1();" onkeyup="userPwdChecked2();">
	</p>
	<p id="userPwd-Help" class="help-block"></p>
	<p id="authNum-Help"></p>
</div>