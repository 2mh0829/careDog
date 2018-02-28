<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
* {
	box-sizing: border-box;
}

div {
	margin: 0;
	padding: 0;
	border: 0;
}

ul{
list-style: none;
}

#center_Container {
	overflow: hidden;
	width: 100%;
	min-width: 1020px;
}

.center_cont_wrap{
width: 1200px;
margin: 0 auto;
}

.center_tit_box{
overflow: hidden;
width: 1200px;
height: 100px;
margin: 0 auto;
}

.center_cont{
width: 100%;
}

.center_list{
overflow: hidden;
margin-top: 5px;
}

.center_list > li{
float: left;
position: relative;
width: 340px;
padding: 30px 5px 10px;
border-bottom: 1px solid #e5e5e5;
}

.center_list >li > a {
display: block;
height: 320px;
font-size: 18px;
text-align: center;
font-weight: 700;
}
</style>
<div id="center_Container">
	<div class="center_cont_wrap">
		<div class="center_tit_box">
		</div>
		<div class="center_cont">
			<ul class="center_list">
				<li>
					<a>FAQ</a>
				</li>
				<li>
					<a onclick="javascript:location.href='<%=cp%>/gongji';">공지사항/이벤트</a>
				</li>
				<li>
					<a>1:1문의</a>
				</li>
			</ul>
		</div>
	</div>
</div>