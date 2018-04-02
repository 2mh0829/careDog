<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();

%>

<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/css/strayDog/volunteer.css" />
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    function check() {
        var title = $(".input__form").find("input").val();
        var content = $("#content").val();

        if(!title || title=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            title.focus();
            return false;
        }
        if(!content || content=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            content.focus();
            return false;
        }


        return true;
    }
</script>


<div class="body-container">
<h1 class="page-tit">애견 정보 글 입력</h1>
	<form name="dhCreatedForm" method="post" onsubmit="submitContents(this);">
	<table class="table1 mt20">
			<thead>
				</thead><colgroup>
					<col width="216px">
					<col width="auto">
				</colgroup>
			
			<tbody>
				<tr class="table1__tr">
					<th class="table1__th">제목</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" id="title" name="title" class="input1 wd100p">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">내용</th>
					<td class="table1__td">
						<div class="input__form">
							<textarea name="content" id="content" rows="3" cols="3" class="textarea1 wd100p" style="display: none;"></textarea>
						</div>
					</td>
				</tr>
			
			</tbody>
		</table>
			<div class="center__group mt40">
				<button class="btn btn1 wd80">확인</button>
				<a href="javascript:document.board.reset();history.back();" class="btn btn2 wd80">취소</a>
			</div>
		</form>
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	console.log(elClickedObj)
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	oEditors.getById['content'].getIR();
		var title = $("#title").val().trim();
		var content = $("#content").val();
		console.log(title+":"+content);
		if(! title){
			alert("제목을 입력하세요");
			return false;
		}
		
		var f = document.dhCreatedForm;
		 f.action = "<%=cp%>/admin/dog119/dhInput";
		 return true;
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>    