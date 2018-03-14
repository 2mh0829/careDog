<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
body {
	background: #f6f6f6;
}

.header {
	background: #f6f6f6;
}

.footer {
	background: #f6f6f6;
}

#join-img-box img {
	width: 100%;
}

.container {
	padding-top: 0;
}


.btn1 {
	width: 120px;
	height: 50px;
	font-size: 20px;
	margin: 10px;
}

.okBtn {
	background: #4286f4;
	color: white;
}

.okBtn:hover {
	
}

.cancleBtn {
	background: #ccc;
}

</style>

<script>

function changeEmail() {
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

function joinNext() {
	var f = document.memberForm;
	var str;
	
	str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }
    
    
	f.action = "<%=cp%>/member/join3";
	f.submit();
}

</script>


<div class="body-container">
	<div id="join-img-box">
		<img src="<%=cp %>/resource/img/join2.jpg">
	</div>
	
	<div style="width: 700px; margin: 0 auto;">
	    <div class="body-title">
			회원가입
	    </div>
	    
	        <div> 
	        	<form name="memberForm" method="post">
				  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">아이디</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="text" name="userId" id="userId" value="${dto.userId}"
	                         onchange="userIdCheck();" style="width: 95%;"
	                         ${mode=="update" ? "readonly='readonly' ":""}
	                         maxlength="15" class="boxTF" placeholder="아이디">
				        </p>
				        <p class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
				      </td>
				  </tr>
				
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">패스워드</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="password" name="userPwd" maxlength="15" class="boxTF"
				                       style="width:95%;" placeholder="패스워드">
				        </p>
				        <p class="help-block">패스워드는 5~10자 이내이며, 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</p>
				      </td>
				  </tr>
				
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">패스워드 확인</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="password" name="userPwdCheck" maxlength="15" class="boxTF"
				                       style="width: 95%;" placeholder="패스워드 확인">
				        </p>
				        <p class="help-block">패스워드를 한번 더 입력해주세요.</p>
				      </td>
				  </tr>
				
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">이름</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="text" name="userName" value="${dto.userName}" maxlength="30" class="boxTF"
			                      style="width: 95%;"
			                      ${mode=="update" ? "readonly='readonly' ":""}
			                      placeholder="이름">
				        </p>
				      </td>
				  </tr>
				
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">생년월일</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="text" name="birth" value="${dto.birth}" maxlength="10" 
				                       class="boxTF" style="width: 95%;" placeholder="생년월일">
				        </p>
				        <p class="help-block">생년월일은 2000-01-01 형식으로 입력 합니다.</p>
				      </td>
				  </tr>
				  
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">이메일</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="text" name="email1" value="${dto.email1}" size="13" maxlength="30"  class="boxTF">
				            @ 
				            <input type="text" name="email2" value="${dto.email2}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
				            <select name="selectEmail" onchange="changeEmail();" class="selectField">
				                <option value="">선 택</option>
				                <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
				                <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
				                <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
				                <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
				                <option value="direct">직접입력</option>
				            </select>
				        </p>
				      </td>
				  </tr>
				  
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">전화번호</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <select class="selectField" id="tel1" name="tel1" >
				                <option value="">선 택</option>
				                <option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
				                <option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
				                <option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
				                <option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
				                <option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
				                <option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
				            </select>
				            -
				            <input type="text" name="tel2" value="${dto.tel2}" class="boxTF" maxlength="4">
				            -
				            <input type="text" name="tel3" value="${dto.tel3}" class="boxTF" maxlength="4">
				        </p>
				      </td>
				  </tr>
				  
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">우편번호</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="text" name="zip" value="${dto.zip}"
				                       class="boxTF" readonly="readonly">
				            <button type="button" class="btn" >우편번호</button>          
				        </p>
				      </td>
				  </tr>
				  
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">주소</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="text" name="addr1" value="${dto.addr1}" maxlength="50" 
				                       class="boxTF" style="width: 95%;" placeholder="기본 주소" readonly="readonly">
				        </p>
				        <p style="margin-bottom: 5px;">
				            <input type="text" name="addr2" value="${dto.addr2}" maxlength="50" 
				                       class="boxTF" style="width: 95%;" placeholder="나머지 주소">
				        </p>
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	
	<div align="center">
		<button class="btn btn1 okBtn" onclick="joinNext();">확인</button>
		<button class="btn btn1 cancleBtn" onclick="location.href='<%=cp %>/member/login'">취소</button>
	</div>

	
</div>