<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>

$(function() {
	
	var windowWidth = $(window).width();
		
	var x = 0;
	var direction = "right";
	var dog = null;
	var dogArea = windowWidth - 150;
	
	setInterval(function() {
		dog = document.getElementById("runnig_dog");
		
		if(direction == "right"){
			move_right();
		}else{
			move_left();
		}
		dog.style.left = x + "px";
	}, 200);
	
	
	function move_right() {
		x += 10;
		if(x >= dogArea - 20){
			direction = "left";
			dog.src = "<%=cp %>/resource/img/running_dog2.gif";
		}
	}
	
	function move_left() {
		x -= 10;
		if(x == 0){
			direction = "right";
			dog.src = "<%=cp %>/resource/img/running_dog.gif";
		}
	}

});
</script>

<div>
	<img id="runnig_dog" src="<%=cp %>/resource/img/running_dog.gif" style="width: 150px; position: relative; left: 5px; top: 20px;">
</div>

<div style="background: green; width: 100%; height: 100px;">
	<h2>footer</h2>
</div>
