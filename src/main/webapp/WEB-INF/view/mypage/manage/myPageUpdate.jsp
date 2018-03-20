<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%/* aa */
   String cp = request.getContextPath();
%>

<script type="text/javascript">
  function sendMyPage() {
        var f = document.myPageForm;

        
    	str = f.introduce.value;
        if(!str || str.length>150) {
            alert("150자 이내의 마이페이지 소개를 입력 하세요. ");
            f.introduce.focus();
            return;
        }
        
    	str = f.nickName.value;
        if(!str || str.length>10) {
            alert("10자 이내의 닉네임을 입력 하세요. ");
            f.nickName.focus();
            return;
        }

    	str = f.city.value;
        if(!str) {
            alert("지역를 선택 하세요. ");
            f.city.focus();
            return;
        }

    	if(f.upload.value!="") {
    		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
    			alert("사진은 이미지 파일만 가능합니다. ");
    			f.upload.focus();
    			return false;
    		}
    	}        

       f.action = "<%=cp%>/myPage/${dto.myPageId}/updateMyPage";
            
       f.submit();
  }
  
  function profileImageDelete() {
		if(confirm("등록된 사진을 삭제 하시겠습니까 ?")) {
			var url="<%=cp%>/myPage/${dto.myPageId}/deleteImageMyPage";
			var filename="${dto.photoFilename}";
			var uid="${dto.userId}";
			$.post(url, {filename:filename, userId:uid}, function(data){
				var state=data.state;
				if(state=="loginFail") {
					location.href="<%=cp%>/member/login";
					return;
				}
				// $("#profilePhoto").attr("src", "<%=cp%>/resource/images/noimage.png");
				$("#image-layout").html("");
			},"json");
		}
	}
  
</script>

<div>
         <div style="width: 100%; height: 30px; line-height: 30px; border-bottom: 1px solid #212121;">
              <b>마이페이지 수정</b>
         </div>
         
        <div style="width: 100%; clear: both;">
    		<form name="myPageForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">

			  <tr> 
			      <td width="100" style="text-align: left; padding-top:5px;" valign="top">마이페이지 소개<br>(150자 이내)</td>
			      <td colspan="2" valign="top" style="padding:5px 0px 5px 0px;"> 
			           <textarea name="introduce" cols="75" rows="5" class="boxTA" style="width:98%; height: 50px;">${dto.introduce}</textarea>
			      </td>
			  </tr>
			   
			  <tr height="40">
			      <td width="100" style="text-align: left;">이름</td>
			      <td width="250"> 
						<input type="text" name="userName" maxlength="10" class="boxTF" value="${sessionScope.member.userName}"
						            readonly="readonly" style="width: 210px;">
				  </td>
                  <td> 				  
						 <input type="checkbox" name="isUserName" value="1" ${dto.isUserName=="1"?"checked='checked'":"" }> <span>공개</span>
			      </td>
			  </tr>

			
			  <tr height="40">
			      <td width="100" style="text-align: left;">성별</td>
			      <td width="250"> 
			            <select name="gender" class="selectField" style="width: 222px;">
			                <option value="남자" ${dto.gender=="남자" ? "selected='selected'" : ""}>남자</option>
			                <option value="여자" ${dto.gender=="여자" ? "selected='selected'" : ""}>여자</option>
			            </select>
				  </td>
                  <td> 				  
						 <input type="checkbox" name="isGender" value="1" ${dto.isGender=="1"?"checked='checked'":"" }> <span>공개</span>
			      </td>
			  </tr>
			
			  <tr height="40">
			      <td width="100" style="text-align: left;">지역</td>
			      <td width="250"> 
			            <select name="city" class="selectField" style="width: 222px;">
			                <option value="">:: 선택 ::</option>
			                <option value="서울" ${dto.city=="서울" ? "selected='selected'" : ""}>서울</option>
			                <option value="부산" ${dto.city=="부산" ? "selected='selected'" : ""}>부산</option>
			                <option value="대구" ${dto.city=="대구" ? "selected='selected'" : ""}>대구</option>
			                <option value="인천" ${dto.city=="인천" ? "selected='selected'" : ""}>인천</option>
			                <option value="광주" ${dto.city=="광주" ? "selected='selected'" : ""}>광주</option>
			                <option value="대전" ${dto.city=="대전" ? "selected='selected'" : ""}>대전</option>
			                <option value="울산" ${dto.city=="울산" ? "selected='selected'" : ""}>울산</option>
			                <option value="세종" ${dto.city=="세종" ? "selected='selected'" : ""}>세종</option>
			                <option value="강원" ${dto.city=="강원" ? "selected='selected'" : ""}>강원</option>
			                <option value="경기" ${dto.city=="경기" ? "selected='selected'" : ""}>경기</option>
			                <option value="충남" ${dto.city=="충남" ? "selected='selected'" : ""}>충남</option>
			                <option value="충북" ${dto.city=="충북" ? "selected='selected'" : ""}>충북</option>
			                <option value="전남" ${dto.city=="전남" ? "selected='selected'" : ""}>전남</option>
			                <option value="전북" ${dto.city=="전북" ? "selected='selected'" : ""}>전북</option>
			                <option value="경남" ${dto.city=="경남" ? "selected='selected'" : ""}>경남</option>
			                <option value="경북" ${dto.city=="경북" ? "selected='selected'" : ""}>경북</option>
			                <option value="제주" ${dto.city=="제주" ? "selected='selected'" : ""}>제주</option>
			            </select>
				  </td>
                  <td> 				  
						 <input type="checkbox" name="isCity" value="1" ${dto.isCity=="1"?"checked='checked'":"" }> <span>공개</span>
			      </td>
			  </tr>

			  <tr height="40">
			      <td width="100" style="text-align: left;">취미</td>
			      <td width="250"> 
						<input type="text" name="hobby" maxlength="10" class="boxTF" value="${dto.hobby}"  style="width: 210px;">
				  </td>
                  <td> 				  
						 <input type="checkbox" name="isHobby" value="1" ${dto.isHobby=="1"?"checked='checked'":"" }> <span>공개</span>
			      </td>
			  </tr>

			  <tr height="40" >
			      <td width="100" style="text-align: left;">사진</td>
			      <td  colspan="2"> 
                      <input type="file" name="upload" class="boxTF"  size="61"  style="width:98%; height: 25px;">			           
			       </td>
			  </tr>

			  <tr height="50" >
			      <td width="100">등록이미지</td>
			      <td colspan="2"> 
                      <c:if test="${not empty dto.photoFilename}">
                           <div id="image-layout">
                              <span style="display: inline-block; padding-top: 5px;"><img src="<%=cp%>/uploads/myPage/${sessionScope.member.userId}/${dto.photoFilename}" id="profilePhoto" width="30" height="30"></span>
                              <span style="position:relative; top: -10px;"><button type="button" class="btn1" onclick="profileImageDelete();">삭제</button></span>
                            </div>
                      </c:if>			           
			       </td>
			  </tr>

			  <tr height="40">
			      <td width="100" style="text-align: left;">마이페이지공개</td>
			      <td colspan="2"> 
			            <input type="radio" value="0" name="closed" ${dto.closed=="0"?"checked='checked'":"" }> 공개&nbsp;&nbsp;&nbsp;
			            <input type="radio" value="1" name="closed" ${dto.closed=="1"?"checked='checked'":"" }> 비공개
			      </td>
			  </tr>

			  <tr> 
			      <td width="100" style="text-align: left; padding-top:5px;" valign="top">프롤로그</td>
			      <td colspan="2" valign="top" style="padding:5px 0px 5px 0px;"> 
			        <textarea name="prologue" cols="75" rows="7" class="boxTA" style="width:98%; height: 100px;">${dto.prologue}</textarea>
			      </td>
			  </tr>
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
					   <button type="button" class="btn1" onclick="sendMyPage();"> 수정완료 </button>
                       <button type="button" class="btn1" onclick="javascript:location.href='<%=cp%>/myPage/${dto.myPageId}';"> 수정취소 </button>
                       <input type="hidden" name="photoFilename" value="${dto.photoFilename}">
			      </td>
			    </tr>
			  </table>
			</form>
		</div>
</div>