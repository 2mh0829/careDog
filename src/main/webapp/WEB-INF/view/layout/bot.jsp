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

$('#right-banner').click(function() {
	$('#right-banner').animate({
		top : "+=15px",
		opacity : 0
	}, "slow");
});

</script>


<div id="right-banner">배너 영역</div> 

