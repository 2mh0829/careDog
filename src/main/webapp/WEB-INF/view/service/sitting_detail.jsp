<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script>

$(function(){
    $("#left-datepicker").datepicker({
    	dateFormat: "yy-mm-dd",
    	showAnim: "slideDown",
    	showMonthAfterYear: true,
    	yearSuffix: '년',
    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    	minDate: 0
    });
});

$(function(){
    $("#right-datepicker").datepicker({
    	dateFormat: "yy-mm-dd",
    	showAnim: "slideDown",
    	showMonthAfterYear: true,
    	yearSuffix: '년',
    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    	minDate: 0
    });
});

</script>

<style>

li{
	list-style-type: none;
}

.main-top {
	padding-bottom: 6px;
	border: 1px solid blue;
}

.main-top-slider {
	width: 630px;
	margin-right: 30px;
	float: left;
	border: 1px solid red;
	
}

.main-photos {
	border: 1px solid black;
	height: 360px;
	
}

.main-photos img {
	width: 100%;
	height: 100%;
	padding-right: 7px;
}

.photo-array {
	border: 1px solid blue;
	margin-top: 10px;
}

.photo-array img{
	position: relative;
}

/* .photo-array li {
	margin-left: 5px; 
} */

.array-small {
    display: inline;
    width: 33.3333%;
    float: left;
    padding-right: 7px;
}

.array-small img {
	width: 201px;
	height: 134px;
}

.main-top-detail {
	width: 335px;
    float: right;
    /* height: 300px; */
    /* z-index: 97; */
    border: 1px solid black;
}

.main-detail {
	margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #cccccc;
}

.reser-date dt{
	text-align: center;
	margin-bottom: 10px;
	
}

.reser-date input {
	width: 90px;
	text-align: center;
}

.reser-date dd {
	margin-left: 30px;
}


</style>

<div class="body-container">
	<div class="main-top">
		<div class="main-top-slider">
			<div class="main-photos">
				<img src="http://cfile6.uf.tistory.com/image/2544613F51CF074D104D69">
			</div>
			<ul class="photo-array">
				<li class="array-small">
					<img src="http://cfile4.uf.tistory.com/image/0148133F51CF074F0EE545">
				</li>
				<li class="array-small">
					<img src="http://cfile6.uf.tistory.com/image/233B073F51CF075D14D7CA">
				</li>
				<li class="array-small">
					<img src="http://cfile25.uf.tistory.com/original/1528E9114BA1CECF492663">
				</li>
			</ul>
		</div>
		<div class="main-top-detail">
			<form class="main-detail">
				<div class="reser-date">
					<dl>
						<dt>예약일을 알려주세요!</dt>
						<dd>
							<i class="glyphicon glyphicon-calendar"></i>
							<input type="text" id="left-datepicker" placeholder="시작 날짜">
							<span>></span>
							<i class="glyphicon glyphicon-calendar"></i>
							<input type="text" id="right-datepicker" placeholder="마침 날짜">
						</dd>
						<dd class="price">
							30,000원
						</dd>
					</dl>
				</div>
			</form>
		</div>
	</div>
</div>