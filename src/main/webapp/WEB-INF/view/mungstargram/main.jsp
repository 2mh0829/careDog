<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
div.modal-out {
	display: table;
	margin: 0 auto;
	height: 100%;
}

div.modal-in {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

div.modal-centered {
	position: relative;
	display: inline-block;
	/* height: 400px; */
}

div.modal-left {
	float: left;
	height: 100%;
}

div.modal-right {
	background: white;
	width: 350px;
	height: 100%;
	float: left;
	text-align: left;
}

div.modal-title {
	display: table-cell;
	margin: 0 auto;
	height: 80px;
	vertical-align: middle;
	text-align: left;
}

div.modal-title a {
	margin-left: 20px;
}

div.modal-title a:hover {
	color: black;
	text-decoration: none;
}

div.div.modal-context {
	margin: 0 auto;
}

div.modal-context table {
	margin: 0 auto;
	width: 90%;
	height: 320px;
}

div.modal-context table td {
	border-top: 1px solid #ddd;
}

.xbtn, .directionBtn {
	background-color: rgba(255, 255, 255, 0);
	color: rgba(255, 255, 255, 0.8); border : none;
	outline: none;
	border: none;
}

.xbtn {
	transform: rotate(45deg);
}

.xbtn:hover, .xbtn:active {
	border: 0;
	outline: 0;
}

.modal-left .imgVigible {
	visibility: hidden;
}

.modal-left:hover .imgVigible {
	visibility: visible;
}

/* -------------------------------------------- */
div.gallery {
	position: relative;
	height: 20vw;
}

div.gallery:hover img {
	opacity: 0.75;
	cursor: pointer;
}

div.gallery:hover .gallery-text {
	opacity: 1;
	cursor: pointer;
}

div.gallery-text {
	position: absolute;
	width: 100%;
	top: 50%;
	left: 50%;
	text-align: center;
	color: white;
	font-size: 20px;
	font-weight: bold;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
	opacity: 0;
}

div.gallery img {
	width: 100%;
	height: 100%;
}

div.desc {
	padding: 15px;
	text-align: left;
}

* {
	box-sizing: border-box;
}

.responsive {
	padding: 15px 15px;
	float: left;
	/* width: 24.99999%; */
	width: 33.33333%;
}

@media only screen and (max-width: 1000px) {
	div.gallery {
		height: 30vw;
	}
	.responsive {
		padding: 20px 15px;
		width: 49.99999%;
		margin: 6px 0;
	}
	.modal-size {
		width: 99%;
	}
	div.modal-right {
		background: white;
		width: 100%;
		text-align: left;
	}
}

@media only screen and (max-width: 800px) {
	div.gallery {
		height: 50vw;
	}
	.responsive {
		padding: 30px 15px;
		width: 100%;
	}
}

.clearfix:after {
	content: "";
	display: table;
	clear: both;
}
</style>

<script type="text/javascript">

var pageNo = 1;
var totalPage = 1;

$(function() {
	listPage(1);
	
	if ($("body").height() < $(window).height()) {
		alert("스크롤바 없음.");
	}
	
	$(window).scroll(function() {
		if($(window).scrollTop() == $(document).height() - $(window).height()) {
			if(pageNo < totalPage)
				listPage(++pageNo);
			else
				alert("끝");
		}
	});
});

function listPage(page) {
	var url = "<%=cp %>/mungstargram/list";
	var data = {pageNo:page};
	$.get(url, data, function(data) {
		alert("ok");
		printList(data);
	}, "json");
}

function printList(data) {
	alert("print");
}


/* ---------------------------------------------------------- */

$(document).ready(function(){
	
	$(".gallery").click(function(){
    	var imgName = $(this).find("img").attr("src");
    	var imgId = "myimg";
    	
    	$(".modal-left-img").html("<img src='"+ imgName +"' id='"+imgId+"'>");
    	
    	$(window).resize(function() {
    		modalSize(imgName, imgId);
    	});
    	
    	$("#"+imgId).load(function() {
    		modalSize(imgName, imgId);
    	});
    	
    	$("#myModal").modal();
    	
    });
    
    $('html').click(function(e) {
    	if($(e.target).hasClass("modal-in")) {
	    	$("#myModal").modal('hide');
    	}
    	if($(e.target).hasClass("xbtn")) {
	    	$("#myModal").modal('hide');
    	}
    }); 

});

function modalSize(imgName, imgId) {
	if($(window).width() < 1000){
		$(".modal-right").css("height", "600px");
		$(".modal-context table").css("height", "520px");
		$(".modal-left").css("width", $(window).width()+"px");
		$("#"+imgId).css("width", "100%");
		$("#"+imgId).css("margin-top", "0");
		$(".modal-left").css("height", $("#"+imgId).height()+"px");
		$(".modal-title a").css("margin-left","5vw");
		$(".modal-centered").css("height", "");
	}else{
		$(".modal-left").css("height", "100%");
		$(".modal-title a").css("margin-left","20px");
		if("#"+imgId.naturalWidth >= "#"+imgId.naturalHeight){
			$("#"+imgId).css("width", "600px");
			$(".modal-left").css("width", "600px");
			if($("#"+imgId).height() >= 400){
    			$(".modal-right").css("height", $("#"+imgId).height()+"px");
    			$(".modal-centered").css("height", $("#"+imgId).height()+"px");
    			$(".modal-context table").css("height", $("#"+imgId).height() - 80 +"px");
			}else {
				$("#"+imgId).css("margin-top", (400 - $("#"+imgId).height()) / 2 + "px");
				$(".modal-right").css("height", "400px");
				$(".modal-centered").css("height", "400px");
				$(".modal-context table").css("height", "320px");
			}
		}else {
			$("#"+imgId).css("height", "600px");
			$(".modal-left").css("width", $("#"+imgId).width()-1);
			$(".modal-right").css("height", "600px");
			$(".modal-centered").css("height", "600px");
			$(".modal-context table").css("height", "520px");
		}
	}
}

function openWin(){
    window.open("<%=cp%>/mungstargram/created", "이미지 편집", "width=1085, height=550, left=100, top=20, toolbar=no, menubar=no, scrollbars=no, location=no, status=no, resizable=no" );
}

</script>

<div class="body-container">

	<h2>mungstargram.</h2>
	<h4>Resize the browser window to see the effect.</h4>

	<div class="responsive">
		<div style="background: black;">
			<div class="gallery">
				<img src="<%=cp%>/resource/img/test1.jpg">
				<div class="gallery-text">
					<span class="glyphicon glyphicon-heart"></span> : 2134개 &nbsp;&nbsp;&nbsp; 
					<span class="glyphicon glyphicon-comment"></span> : 83개
				</div>
			</div>
		</div>
	</div>

	<div class="responsive">
		<div style="background: black;">
			<div class="gallery">
				<img src="<%=cp%>/resource/img/test2.jpg">
				<div class="gallery-text" align="center">
					<span class="glyphicon glyphicon-heart"></span> : 2134개 &nbsp;&nbsp;&nbsp; 
					<span class="glyphicon glyphicon-comment"></span> : 83개
				</div>
			</div>
		</div>
	</div>

	<div class="responsive">
		<div style="background: black;">
			<div class="gallery">
				<img src="<%=cp%>/resource/img/dog3.jpg">
				<div class="gallery-text" align="center">
					<span class="glyphicon glyphicon-heart"></span> : 2134개 &nbsp;&nbsp;&nbsp; 
					<span class="glyphicon glyphicon-comment"></span> : 83개
				</div>
			</div>
		</div>
	</div>

	<div class="clearfix"></div>
	

	<%-- <button class="btn" onclick="location.href='<%=cp%>/mungstargram/created'">insert</button> --%>
	<button class="btn" onclick="openWin();">insert</button>

	<!-- Modal -->
	<div class="modal" id="myModal" role="dialog" style="background: rgba(0,0,0,0.5);">
		<div class="modal-out">
			<div style="position: absolute; top: 1vw; right: 1vw; z-index: 1;">
				<button class="glyphicon glyphicon-plus btn-lg xbtn"></button>
			</div>
			<div class="modal-in">
				<div class="modal-centered">
					<div class="modal-left" style="background: black;">
						<div class="modal-left-img"></div>
						<div class="modal-left imgVigible" style="position: absolute; top: 0; display:table;">
							<div style='position: relative; display: table-cell; vertical-align: middle;'>
								<div align="left" style="width:50%; float:left;">
									<button class='glyphicon glyphicon-circle-arrow-left btn-lg directionBtn'></button>
								</div>
								<div align="right" style="width:50%; float:left;">
									<button class='glyphicon glyphicon-circle-arrow-right btn-lg directionBtn'></button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-right">
						<div class="modal-title">
							<a href="<%=cp%>/myPage/user_id">
								<img src="<%=cp%>/resource/img/dog3.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40">&nbsp;
								<b>user_id</b>
							</a>
						</div>
						<div class="modal-context">
							<table>
								<tr><td>
									<div style="overflow:auto; height: 100%;">
										<div>
											#test#test<br><br><br><br><br><br><br><br><br><br><br><br>test<br><br><br>test
										</div>
									</div>
								</td></tr>
								<tr height="100px;"><td>조회수</td></tr>
								<tr height="50px;"><td><input class="boxTF" type="text" style="width: 100%; border: none;" placeholder="로그인 후 가능"></td></tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>