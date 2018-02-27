<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

.newWindow {
	width: 100%;
	height: 100%;
}

#holder {
	margin-left: 50px;
	margin-right: 30px;
	width: 600px;
	height: 400px;
	border: 10px dashed #ccc;
	float: left;
	margin-top: 50px;
}

#holder.hover {
	border: 10px dashed #0c0;
}

#holder img {
	width: 150px;
	height: 150px;
	border-radius: 5px;
}

#sortable {
	list-style-type: none;
}

#sortable li {
	margin: 35px 15px 5px 30px;
	float: left;
	width: 150px;
	height: 150px;
}

.eventBox {
	position: relative;
	top: -150; 
	width: 150px;
	height: 150px;
}

.blackBox {
	position: relative;
	width: 150px;
	height: 150px;
	background: black;
	border-radius: 5px;
	opacity: 0.5;
	visibility: hidden;
}

.xbtn {
	position: absolute;
	top: -15;
	right: -15;
	width: 40px;
	height: 40px;
	border-radius: 20px;
	background: black;
	color: white;
	visibility: hidden;
}

.eventBox:hover .blackBox {
	visibility: visible;
}

.eventBox:hover .xbtn {
	visibility: visible;
}



/* ---------------------------- */

.textarea {
	border: 10px solid #ccc;
	top: 0;
	margin-top: 50px;
	margin-left: 20px;
	width: 300px;
	height: 400px;
	float: left;
}

textarea {
	width: 90%;
	height: 80%;
	border-radius: 5px;
	resize: none;
}

textarea:focus {
	outline: none;
}

</style>

<script>
$(function() {
	$("#sortable").sortable();
	$("#sortable").disableSelection();
});


function insertImage() {
	var url = "<%=cp %>/mungstargram/created";
	var file = new FormData();
	
	if($("li").length < 1){
		alert("하나 이상의 사진 또는 동영상을 올려야합니다.");
		return;
	}
	
	$("li").each(function() {
		file.append('files', tempFile.getAll('file')[$(this).attr("id")]);
	});
	file.append('context', $("textarea[name=context]").val());
	
	
	$.ajax({
		url: url,
		data: file,
		processData: false,
		contentType: false,
		type: 'POST',
		success: function() {
			opener.parent.location.reload();
			window.close();
		}
	});
	
}

</script>


<div class="newWindow">
	<div id='holder'>
		<ul id="sortable"></ul>
	</div>
	<div class="textarea">
		<table id="tb" style="width: 100%; height: 100%;">
			<tr height="100px"><td>a</td></tr>
			<tr><td align="center">
				<textarea name="context" placeholder="&nbsp;내용을 입력하세요."></textarea>
			</td></tr>
			<tr height="50px;"><td align="right">
				<button onclick="insertImage();">등록</button>
				<button onclick="window.close();">취소</button>
			</td></tr>
		</table>
	</div>
</div>


<script>
var holder = document.getElementById('holder');
var tempFile = new FormData();
var num = 0;
var cnt = 0;

holder.ondragover = function() {
	this.className = 'hover';
	return false;
};
holder.ondragend = function() {
	this.className = '';
	return false;
};
holder.ondrop = function(e) {
	this.className = '';
	e.preventDefault();
	data = e.dataTransfer;
	if(data.items){
		for(var i=0; i<data.items.length; i++){
			if(data.items[i].type == "image/jpeg"){
				if(cnt > 5){
					alert("업로드는 6장까지 가능");
					break;
				}
				cnt++;
				previewfile(data.files[i]);
			}else {
				alert("이미지 파일만 업로드 가능");
			}
		}
	}
}

function previewfile(file) {
	var reader = new FileReader();
	reader.onload = function(event) {
		var image = new Image();
		image.src = event.target.result;
		
		tempFile.append("file", file);

		$("#sortable").append("<li id='"+num+"'></li>");
		$("#"+num).append(image);
		$("#"+num).append("<div id='event"+num+"' class='eventBox'></div>")
		$("#event"+num).append("<div class='blackBox'></div>");
		$("#event"+num).append("<button class='xbtn' onclick='deleteImg("+num+")'>X</button>");
		
		num++;
	};

	reader.readAsDataURL(file);
}

function deleteImg(num) {
	$("#"+num).hide('fade', 300, function() {
		$("#"+num).remove();
	});
	cnt--;
}

</script>

