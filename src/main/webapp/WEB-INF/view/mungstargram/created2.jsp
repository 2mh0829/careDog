<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<style>
* {
    margin:0; padding:0;
}

div.window-size {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

div.image-drop-area {
	
}

div.image-area-out {
	display: table;
	background: black;
	width: 60%;
	height: 80%;
}

div.image-area-in {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

div.image-preview-area {
	position: relative;
	width: 100%;
	height: 20%;
	float: left;
	background: gray;
}

div.imagefile {
	position: relative;
	float: left;
	margin-left: 15px;
	margin-top: 15px;
	margin-right: 5px;
	width: 14vw;
	height:14vw;
	background: white;
}

div.imagefile img {
	width: 14vw;
	height:14vw;
}

div.imagefile img:hover {
	opacity: 0.8;
}

div.text-area {
	position: absolute;
	width: 40%; 
	height: 80%;
	top: 0;
	right: 0;
}

div.delete-image {
	position: absolute;
	top: -10;
	right: -10;
}

.button {
	width: 30px;
	height: 30px;
	border-radius: 15px;
	background: black;
	color: white;
	visibility: hidden;
}

.button:hover {
	border-color: black;
}

div.imagefile:hover .button {
	visibility: visible;
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
var cnt = 0;
$(function() {
	
	var drop = document.getElementById("dropfile");
	var imgData = null;
	var num = 0;
	drop.ondragover = function(e) {
		e.preventDefault();
	};
	drop.ondrop = function(e) {
		e.preventDefault();
		imgData = e.dataTransfer;
		if (imgData.items) { // DataTransferItemList 객체 사용
			for (var i = 0; i < imgData.items.length; i++) { // DataTransferItem 객체 사용
				if (imgData.items[i].kind == "file") { // 아이템 종류가 파일이면
					if(cnt > 5){
						alert("사진은 6개까지");
						break;
					}
					cnt++;
					var file = imgData.items[i].getAsFile(); // File API 사용
					filePreviewUpload(file, num);
					num++;
				}
			}
		} else { // File API 사용
			for (var i = 0; i < data.files.length; i++) {
				alert(imgData.files[i].name);
			}
		}
	};
	
	function filePreviewUpload(file, num) {
		var fileName = file.name;
		var t = "<img id='img"+num+"' src='<%=cp %>/resource/img/"+fileName+"' onclick='preview(\"" + fileName + "\"," + num + ");'>";
		var d = "<div class='delete-image'><button class='button' onclick='deleteImg("+num+");'>X</button></div>";
		var s = "<div class='imagefile'>"+ t + d +"</div>";
		$(".image-preview-area").append(s);
		
		preview(fileName, num);
	}
	
});

function deleteImg(num) {
	$("#img"+num).parent().remove();
	cnt--;
}

function preview(fileName, num) {
	var t = "<img src='<%=cp %>/resource/img/"+fileName+"'>";
	var s = "<div class='img-file'>"+ t +"</div>";
	
	$(".image-area-in").html(s);
	
	resize(num);
}

function resize(num) {
	if($("#img"+num)[0].naturalWidth >= $("#img"+num)[0].naturalHeight){
		$(".image-area-in img").css("width", "100%");
	}else{
		$(".image-area-in img").css("height", "70vh");
	}
}

function insertImage() {
	var a = $("#tb textarea").val();
	alert(a);
	/* window.close(); */
}

</script>

<div class="window-size">
	<div id="dropfile" class="image-drop-area">
		<div class="image-area-out">
			<div style="position: absolute; top: 0; color: white;">Drap and Drop here.</div>
			<div class="image-area-in"></div>
		</div>
		<div class="text-area">
			<table id="tb" border="1" style="width: 100%; height: 100%;">
				<tr height="100px"><td>a</td></tr>
				<tr><td align="center" bgcolor="black">
					<textarea placeholder="&nbsp;내용을 입력하세요."></textarea>
				</td></tr>
				<tr height="50px;"><td align="right">
					<button onclick="insertImage();">등록</button>
					<button onclick="window.close();">취소</button>
				</td></tr>
			</table>
		</div>
		<div class="image-preview-area"></div>
	</div>
</div>