<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
#right-banner {
	position: absolute;
	width: 100px;
	height: 400px;
	top: 0;
	left: 0;
	z-index: 10;
	background: #ffc;
	padding: 5px;
	border: 1px solid #CCCCCC;
	text-align: center;
	font-weight: bold;
}

.banner-top {
	margin: 0 auto;
	width: 90%;
	height: 220px;
}

.banner-middle {
	margin: 0 auto;
	width: 90%;
	height: 100px;
}

.banner-bottom {
	margin: 0 auto;
	width: 90%;
	height: 30px;
}

#MOVE_TOP_BTN {
	width: 100%;
	height: 30px;
}


/* -------------------------------------------- */

#dialog {
	overflow: hidden;
}

#dialog iframe {
	position: relative;
	margin: 0 auto;
	padding: 0;
	left: -15px;
}

</style>

<script type="text/javascript">

$(window).scroll(function() {
	$('#right-banner').animate({
		top : $(window).scrollTop() + "px"
	}, {
		queue : false,
		duration : 350
	});
});

$(function() {
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
});

function bot_open() {
	$('#dialog').html("<iframe id='botIframe' src='http://mindmap.ai:8000/v1/webchat/5a701d3c65d4405c5b2f7fab' width='340' height='410'></iframe>");

	$('#dialog').dialog({
		title: "Chat Bot"
		,width: "350px"
		,resizeable: false
		,position: { my: "center", at: "center", of: window }
    });

	var bot = document.getElementById("bot");
	bot.src = "<%=cp %>/resource/img/bot/bot_opening.gif"
	setTimeout(function() {
		bot.src = "<%=cp %>/resource/img/bot/bot_open.gif";
	}, 2100);
}

$("body").on("click", ".ui-dialog-titlebar-close", function() {
	var bot = document.getElementById("bot");
	bot.src = "<%=cp %>/resource/img/bot/bot_closing.gif"
	setTimeout(function() {
		bot.src = "<%=cp %>/resource/img/bot/bot_common.gif";
	}, 1000);
});

</script>


<div id="right-banner">배너 영역
	<div class='banner-top'></div>
	
	<div class='banner-middle'>
		<div onclick="bot_open();">
			<img id="bot" src="<%=cp %>/resource/img/bot/bot_common.gif" style="width: 80px;">
		</div>
	</div>
	
	<div class='banner-bottom'><button id="MOVE_TOP_BTN" class='btn'>top</button></div>
</div> 


<div id="dialog"></div>

