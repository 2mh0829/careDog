<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>
function bot_open() {
	var bot = document.getElementById("bot");
	$("#chat").css("display","block");
	$("#botIframe").src = "http://mindmap.ai:8000/v1/webchat/5a701d3c65d4405c5b2f7fab";
	bot.src = "<%=cp %>/resource/img/bot/bot_opening.gif"
	setTimeout(function() {
		bot.src = "<%=cp %>/resource/img/bot/bot_open.gif";
	}, 2100);
}

function bot_close() {
	var bot = document.getElementById("bot");
	bot.src = "<%=cp %>/resource/img/bot/bot_closing.gif"
	$("#chat").css("display","none");
	$("#botIframe").src = "";
	setTimeout(function() {
		bot.src = "<%=cp %>/resource/img/bot/bot_common.gif";
	}, 1000);
}
</script>

<div onclick="bot_open();">
	<img id="bot" src="<%=cp %>/resource/img/bot/bot_common.gif" style="width: 150px;">
</div>

<c:url value="http://mindmap.ai:8000/v1/webchat/5a701d3c65d4405c5b2f7fab" var="messageUrl" />


<div id="chat" style="border: solid; position: fixed; width:400px; height:400px; top: 300px; left: 800px; display: none;">
	<button onclick="bot_close();">닫기</button>
	<iframe id="botIframe" src="http://mindmap.ai:8000/v1/webchat/5a701d3c65d4405c5b2f7fab" width="400" height="400"></iframe>
</div>


