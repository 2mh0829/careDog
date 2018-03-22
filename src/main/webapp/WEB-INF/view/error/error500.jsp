<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR 404</title>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<style type="text/css">
body {
	overflow: hidden;
}

#game {
	position: absolute;
	top: 0;
	visibility: hidden;
	width: 100%;
	height: 400px;
}

#runnig_dog {
	position: relative;
	width: 150px;
	left: 250px;
	top: 160px;
}

#cloud {
	position: relative;
	height: 200px;
	top: 0;
	left: 0;
}

#ddong-area {
	position: absolute;
	width: 100%;
	top: 475px;
}

.ddong {
	position: absolute;
	width: 50px;
	left: 1200px;
}

#score {
	position: absolute;
	color: red;
	font-size: 25px;
	font-weight: bold;
	right: 100px;
	top: 50px;
	z-index: 100;
}


</style>

<script type="text/javascript">
var score = 0;

$(function() {
	$("body").one("keydown" ,function(e) {
		if(e.keyCode == 32){
			$("body").css("background", "#009fe3");
			$("#error").css("visibility", "hidden");
			$("#game").css("visibility", "visible");
			
			cloud();
			
			var i = 0;
			setInterval(function() {
				createDdong(i);
				i++;
			}, 2500);
		}
	});
	
	$("body").keypress(function(e) {
		if(e.keyCode == 32){
			$("#runnig_dog").animate({"top": "-=110px"}).animate({"top": "+=110px"});
		}
	});
	
});

function cloud() {
	setInterval(function() {
		$("#cloud").css("left", "-=1px");
		if($("#cloud").offset().left == -910)
			$("#cloud").css("left", "-25px");
	}, 10);
}

function createDdong(i) {
	$("#ddong-area").append("<img id='ddong"+i+"' class='ddong' src='<%=cp %>/resource/img/error/ddong.png'>");
	var dd = setInterval(function() {
		$("#ddong"+i).css("left", "-=3px");
		if($("#ddong"+i).offset().left < -50){
			score += 100;
			$("#score").html("SCORE : " + score);
			$("#ddong"+i).remove();
			clearInterval(dd);
		}
		
		hitTest(i);
		
	}, 5);
}

</script>

</head>
<body>

<div id="error" align="center" style="margin-top: 50px;">
	<img src="<%=cp %>/resource/img/error/500.png">
</div>

<div id="game">
	<div id="score">SCORE : 0</div>
	<img id="cloud" src="<%=cp %>/resource/img/error/cloud.png">
	<img id="runnig_dog" src="<%=cp %>/resource/img/running_dog.gif">
	<div id="ddong-area"></div>	
</div>

<script>
function hitTest(i) {
	var r = $("#runnig_dog");
	var d = $("#ddong" + i);
	
	if( r.offset().left < d.offset().left + 40 &&
		r.offset().left + 130 > d.offset().left &&
		r.offset().top < d.offset().top + 40 &&
		130 + r.offset().top > d.offset().top ){
		
		d.remove();
		
		alert("score : " + score);
		location.reload();
	}

}
</script>

</body>
</html>

