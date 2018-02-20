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
	width: 50%;
	height: 75%;
}

div.image-area-in {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

div.image-preview-area {
	position: relative;
	width: 100%;
	height: 25%;
	float: left;
	background: yellow;
}

div.imagefile {
	position: relative;
	float: left;
	margin-left: 10px;
	margin-top: 25px;
	margin-bottom: 10px;
	margin-right: 10px;
	width: 14vw;
	height:14vw;
	background: white;
}

div.imagefile img {
	width: 14vw;
	height:14vw;
}

div.imagefile img:hover {
	opacity: 0.5;
}

div.text-area {
	position: absolute;
	width: 50%; 
	height: 75%;
	top: 0;
	right: 0;
}

div.delete-image {
	position: absolute;
	top: -5;
	right: -5;
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
		console.log(file);
		var fileName = file.name;
		var t = "<img id='img"+num+"' src='<%=cp %>/resource/img/"+fileName+"' onclick='preview(\"" + fileName + "\"," + num + ");'>";
		var d = "<div class='delete-image'><button onclick='deleteImg("+num+");'> x </button></div>";
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
		$(".image-area-in img").css("height", "100%");
	}
}

</script>

<div class="window-size">
	<div id="dropfile" class="image-drop-area">
		<div class="image-area-out">
			<div style="position: absolute; top: 0; color: white;">Drap and Drop here.</div>
			<div class="image-area-in"></div>
		</div>
		<div class="text-area">
			<table border="1"><tr><td>a</td></tr><tr><td><input type="text"></td></tr></table>
		</div>
		<div class="image-preview-area"></div>
	</div>
</div>