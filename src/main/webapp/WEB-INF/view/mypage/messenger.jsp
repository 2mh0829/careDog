<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String cp=request.getContextPath();
%>
<style>
.messengerContainer{
width:100%;

background:gray;
overflow:hidden;
}
.messengerLeft{
position:relative;
width:200px;
background:yellow;
float:left;
}
.messengerRight{
position:relative;
float:left;
background:blue;

}
</style>
	<div class="messengerContainer">
	
		<div class="messengerLeft">aaa</div>
		<div class="messengerRight">bbb</div>
	</div>
