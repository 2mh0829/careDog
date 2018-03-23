<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.table1 { width: 100%; border-spacing: 0; border-collapse: collapse; text-align: left; }
.table1__tr { border-top: 1px solid #dedede; }
.table1__th { padding: 22px 30px; background-color: #fafafa; border-bottom: 1px solid #dedede; font-size: 14px; color: #222; text-align:left;}
.table1__td { padding: 22px 30px; border-bottom: 1px solid #dedede; }

.input1 { -webkit-box-sizing: border-box; box-sizing: border-box; height: 30px; padding: 5px; border: 1px solid #dddddd; vertical-align: middle; font-size: 14px; line-height: 1; }
.input1 + .input1 { margin-left: 5px; }

.input__form { margin: -7px 0px; font-size: 0; }
.input__form.type-another { position: relative; }
.input__txt { font-size: 14px; vertical-align: middle; }
.input__calender { overflow: hidden; position: relative; left: -1px; display: inline-block; text-indent: -9999px; width: 30px; height: 30px; background-image: url("../images/content/calender_icon.jpg"); vertical-align: middle; }

.input1 + .input__txt { margin-left: 10px; }

.input__calender + .input__txt { margin-left: 10px; }

.input__wrap { display: inline-block; }
.input__wrap + .input__wrap { margin-top: 5px; }

.dash { margin: 0px 10px; font-size: 14px; vertical-align: middle; }

.button1 { width: 100px; border: 1px solid #ddd; color: #767676; font-weight: 700; background-color: #fff; cursor: pointer; }

.textarea1 { height: 300px; padding: 5px; border: 1px solid #ddd; -webkit-box-sizing: border-box; box-sizing: border-box; font-size:13px; }/* 20171023 수정 */

.sub__txt { margin-left: 10px; font-size: 13px; vertical-align: middle; }
.sub__txt.type-another { position: absolute; top: 0; bottom: 0; left: 130px; margin: auto 0; height: 20px; line-height: 20px; }

/*common*/
.inline-block { display: inline-block !important; }
.wd40 { width: 40px !important; }
.wd60 { width: 60px !important; }
.wd80 { width: 80px !important; }
.wd100 { width: 100px !important; }
.wd120 { width: 120px !important; }
.wd160 { width: 160px !important; }
.wd240 { width: 240px !important; }
.wd250 { width: 250px !important; }
.wd320 { width: 320px !important; }
.wd460 { width: 460px !important; }
.wd600 { width: 600px !important; }
.wd704 { width: 704px !important; }
.wd100p { width: 100% !important; }
.hg100 { height: 100px !important; }
.hg140 { height: 140px !important; }
.hg180 { height: 180px !important; }
.hg550 { height: 550px !important; }
.hg560 { height: 560px !important; }
.hg720 { height: 720px !important; }
/*margin*/
.mt0 { margin-top: 0px !important; }
.mt10 { margin-top: 10px !important; }
.mt15 { margin-top: 15px !important; }
.mt20 { margin-top: 20px !important; }
.mt30 { margin-top: 30px !important; }
.mt40 { margin-top: 40px !important; }
.mt50 { margin-top: 50px !important; }
.mt60 { margin-top: 60px !important; }
/*폰트사이즈*/
.fs0 { font-size: 0 !important; }
.txt_c { text-align: center !important; }
.left__group { text-align: left; font-size: 0; }
.center__group { text-align: center; font-size: 0; }
.right__group { text-align: right; font-size: 0; }
.btn + .btn { margin-left: 10px; }
.btn { display: inline-block; width: 120px; height: 40px; text-align: center; line-height: 38px; font-size: 14px; -webkit-box-sizing: border-box; box-sizing: border-box; }
.btn1 { background-color: #1991d7; color: #fff; border: 1px solid #1991d7; }
.btn2 { border: 1px solid #666666; color: #666666; }
.btn3 { background-color: #f24443; color: #fff; border: 1px solid #f24443; }
.btn4 { border: 1px solid #cccccc; color: #767676; background-color: #fff; }
.bt { border-top: 1px solid #dedede !important; }
.fl_r { float: right; }
.page-tit { margin: 30px 0; color: #222; line-height: 1; margin-left: -2px; font-size: 32px; position:relative; }/* 20171027 수정 */
.page-tit:before { display: block; width: 30px; margin-bottom: 12px; margin-left: 2px; border-top: 3px solid #1991d7; content: ''; }
</style>
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
<form id="dhCreatedForm" method="post" onclick="submitContents(this);">
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
							<input type="text" id="title" class="input1 wd100p">
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
		var title = $("#title").val();
		var content = $("#content").val();
		console.log(title+":"+content);
		if(title.trim().length<1){
			alert("제목을 입력하세요");
			return;
		}
		
			$.ajax({
				url:'<%=cp%>/dog119/dhInsert'
				,type:'post'
				,dataType:'json'
				,data:{
					"title":title,
					"content":content
				}
				,success:function(){
					alert('성공');
					<%-- location.href='<%=cp%>/dog119/dogHealth'; --%>
				}
				,error:function(e){
					console.log(e.responseText);
				}
			});
		
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>    