<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String cp = request.getContextPath();
%>
<style>
.messengerContainer {
	width: 100%;
	height:100%;
	overflow: hidden;
	float: left;
	/* border-style: solid;
	border-width:1px;
	border-color:#D5D5D5; */
}

.messengerLeft {
	position: relative;
	width: 30%;
	height:1000px;
	float: left;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color:#D5D5D5;
}

.messengerRight {
width: 70%;
	position: relative;
	float: left;
}
.messengerHeader{
width:100%;
height:70px;
border-bottom-color: #D5D5D5;
border-bottom-style: solid;
border-bottom-width: 1px;
}
.messengerHeaderLeft{
width: 30%;
height:100%;
float: left;

border-right-color: #D5D5D5;
border-right-style: solid;
border-right-width: 1px;
}
.messengerHeaderRight{
width: 70%;
float: left;
text-align: center;
line-height:70px;
}
.container {
    /* clear:both; */
    padding-left:0px;
    padding-right:0px;
    padding-top: 30px;    
}
</style>

	<div class="messengerContainer">
		<div class="messengerHeader">
			<div class="messengerHeaderLeft"><div style="font-size:20px; line-height:70px; width:65%; float:left; text-align: right"><b>CareDog Messenger</b></div><div style="width:35%;float:left;"><img src="<%=cp%>/resource/img/mypage/addBtn.png"
					style="width: 20px; margin-right: 5px; margin-top:10px; float: right;"></div></div>
			<div class="messengerHeaderRight">이종훈</div>
		</div>
		<div class="messengerLeft">
		<img src="<%=cp%>/resource/img/mypage/jsh.jpg" style="width: 80px; border-radius: 50px" >조세호짱짱맨
		</div>
		<div class="messengerRight">bbb</div>
	</div>



