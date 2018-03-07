<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>

body {
	background: #eee;
}

.header {
	background: white;
}

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
	opacity: 0;
}

.modal-left:hover .imgVigible {
	opacity: 1;
}

/* -------------------------------------------- */
div.gallery {
	position: relative;
	height: 300px;
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

.myIcon {
	color: white;
	font-size: 20px;
	cursor: pointer;
	opacity: 0.8;
	text-shadow: 2px 2px 4px black;
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
		height: 25vw;
	}
	div.modal-right {
		background: white;
		width: 100%;
		text-align: left;
	}
}

@media only screen and (max-width: 800px) {
	div.gallery {
		height: 40vw;
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

@media only screen and (max-width: 500px) {
	div.gallery {
		height: 70vw;
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

.contents {
	font-size: 15px;
}

#context a {
	color: #2659ad;
}

#context a:hover {
	text-decoration: none;
}

#reply {
	margin-top: 15px;
}


/* ----------------------------------------------- */

.like-hit-re {
	position: relative;
	width: 80px;
	height: 70px;
	float: left;
}

.icon-size-30 {
	font-size: 30px;
}

#like {

}

#like button {
	background: none;
	outline: none;
	border: none;
}

#created {
	width: 100px;
	height: 30px;
	float: right;
}

</style>

<script type="text/javascript">

var pageNo = 1;
var totalPage = 1;

$(function() {
	listPage(1);
	
	/* if ($("body").height() < $(window).height()) {
		alert("스크롤바 없음.");
	} */
	
	$(window).scroll(function() {
		if($(window).scrollTop() + 500 >= $(document).height() - $(window).height()) {
			if(pageNo < totalPage)
				listPage(++pageNo);
		}
	});
});

function listPage(page) {
	var url = "<%=cp %>/mungstargram/list";
	var searchKey = "${searchKey}";
	var searchValue = "${searchValue}";
	var data = {pageNo:page, searchKey:searchKey, searchValue:searchValue};
	$.get(url, data, function(data) {
		printList(data);
	}, "json");
}

// 멍스타그램 게시글 리스트 셋팅
function printList(data) {
	var dataCount = data.dataCount;
	var page = data.pageNo;
	totalPage = data.total_page;
	
	var out = "";
	if(dataCount != 0){
		for(var i=0; i<data.list.length; i++){
			var num = data.list[i].num;
			var filename = data.list[i].filename;
			var photoCount = data.list[i].photoCount;
			var likeCount = data.list[i].likeCount;
			var replyCount = data.list[i].replyCount;
			
			out += "<div class='responsive'>";
			out += "<div style='background: black;'>";
			out += "<div id='article" + num + "' class='gallery' onclick='article(" + num + ");'>";
			out += "<input id='photoCount" + num + "' type='hidden' value='" + photoCount + "'>"
			out += "<img src='<%=cp%>/uploads/mungstargram/" + filename + "'>";
			
			if(photoCount > 1){
				out += "<div style='position: absolute; top: 10px; right: 10px;'>";
				out += "<span class='glyphicon glyphicon-th-large myIcon'></span></div>";
			}
			
			out += "<div class='gallery-text'>";
			out += "<span class='glyphicon glyphicon-heart'></span> : " + likeCount + "개 &nbsp;&nbsp;&nbsp;"; 
			out += "<span class='glyphicon glyphicon-comment'></span> : " + replyCount + "개";
			out += "</div></div></div></div>";
		}
		
		$("#printPhoto").append(out);
		
	}	
}


/* ---------------------------------------------------------------------------------------------- */
// 상세 리스트

function article(num) {
	var url = "<%=cp %>/mungstargram/article";
	var data = {num:num};
	
	$.get(url, data, function(data) {
		openModal(data, num);
	}, "json");
}

var photoList = [];
var photoNum = 0;

// 모달 열기
function openModal(data, num) {
	var memberId = data.content.memberId;
	var context = data.content.context;
	var hitCount = data.content.hitCount;
	var created = data.content.created;
	var likeInfo = data.content.likeInfo;
	var likeCount = data.content.likeCount;
	var replyList = data.content.replyList;
	var memberInfo = data.memberInfo;
	photoList = data.photoList;
	photoNum = 0;
	
	if(memberInfo == 'no'){
		$("#like button").attr("data-like", "logout");
		$('#like button').attr('class', 'glyphicon glyphicon-heart-empty icon-size-30');
		$("#replyTx").attr("data-info", "no");
		$("#replyTx").attr("placeholder", "로그인 후 이용가능");
	}else{
		if(likeInfo == 0){
			$("#like button").attr("data-like", "off");
			$('#like button').attr('class', 'glyphicon glyphicon-heart-empty icon-size-30');
		}else if(likeInfo == 1){
			$("#like button").attr("data-like", "on");
			$('#like button').attr('class', 'glyphicon glyphicon-heart icon-size-30');
		}
		$("#replyTx").attr("data-info", memberInfo);
		$("#replyTx").attr("placeholder", "댓글달기");
		$("#replyTx").attr("data-num", num);
	}
	
	
	setPhoto(photoNum);
	
	$(window).resize(function() {
		modalSize();
	});
	
	
	$("#memberId b").html(memberId);
	$("#memberId").attr("onclick", "searchId(\"" + memberId + "\");");
	$("#context").html(context);
	$("#like button").attr("onclick", "like(" + num + ");");
	$("#hitCount span").html(hitCount);
	$("#created").html(created);
	$("#like span").html(likeCount);
	
	$("#bottomBtn").html("");
	$("#leftBtn").css("visibility", "hidden");
	if(photoList.length > 1){
		$(".imgVigible").css("visibility", "visible");
		$("#rightBtn").css("visibility", "visible");
		$("#bottomBtn").css("visibility", "visible");
		for(var i=0; i<photoList.length; i++){
			$("#bottomBtn").append("<button onclick='setPhoto(" + i + ");'>o</button>&nbsp;");
		}
	}else{
		$(".imgVigible").css("visibility", "hidden");
		$("#bottomBtn").css("visibility", "hidden");
	}
	
	$("#reply").html("");
	for(var i=0; i<replyList.length; i++){
		$("#reply").append("<div><a onclick='searchId(\""+memberId+"\");'><b>" + memberId + "</b></a> " + replyList[i].reply + "</div>");
	}
	

	$("#myModal").modal();
	
}

// 모달에 사진 세팅
function setPhoto(num) {
	var photoSrc = "<%=cp %>/uploads/mungstargram/" + photoList[num].filename;
	$(".modal-left-img").html("<img src='" + photoSrc +"' id='mungstarPhoto' onerror='this.src=\"<%=cp %>/resource/img/noPhoto.jpg\"'>");
	$(".modal-centered").css("visibility", "hidden");
	
	$("#mungstarPhoto").load(function() {
		modalSize();
	});
	
	photoNum = num;
	
	if(photoNum == photoList.length - 1){
		$("#rightBtn").css("visibility", "hidden");
		$("#leftBtn").css("visibility", "visible");
	}else if(photoNum == 0){
		$("#rightBtn").css("visibility", "visible");
		$("#leftBtn").css("visibility", "hidden");
	}else{
		$("#rightBtn").css("visibility", "visible");
		$("#leftBtn").css("visibility", "visible");
	}
}

$(document).ready(function(){
	
    $('html').click(function(e) {
    	if($(e.target).hasClass("modal-in")) {
	    	$("#myModal").modal('hide');
    	}
    	if($(e.target).hasClass("xbtn")) {
	    	$("#myModal").modal('hide');
    	}
    });
    
    $(".imgVigible button").click(function() {
    	if($(this).parent()[0].id == "rightBtn"){
    		photoNum++;
    	}else if($(this).parent()[0].id == "leftBtn"){
			photoNum--;
    	}
    	setPhoto(photoNum);
    });
    
});

// 모달 사이즈 변경
function modalSize() {
	if($(window).width() < 1000){
		$(".modal-right").css("height", "600px");
		$(".modal-context table").css("height", "520px");
		$(".modal-left").css("width", $(window).width()+"px");
		$("#mungstarPhoto").css("width", "100%");
		$("#mungstarPhoto").css("margin-top", "0");
		$(".modal-left").css("height", $("#mungstarPhoto").height()+"px");
		$(".modal-title a").css("margin-left","5vw");
		$(".modal-centered").css("height", "");
	}else{
		$(".modal-left").css("height", "100%");
		$(".modal-title a").css("margin-left","20px");
		if($("#mungstarPhoto")[0].naturalWidth >= $("#mungstarPhoto")[0].naturalHeight){
			$("#mungstarPhoto").css("width", "600px");
			$(".modal-left").css("width", "600px");
			if($("#mungstarPhoto").height() >= 400){
    			$(".modal-right").css("height", $("#mungstarPhoto").height()+"px");
    			$(".modal-centered").css("height", $("#mungstarPhoto").height()+"px");
    			$(".modal-context table").css("height", $("#mungstarPhoto").height() - 80 +"px");
			}else {
				$("#mungstarPhoto").css("margin-top", (400 - $("#mungstarPhoto").height()) / 2 + "px");
				$(".modal-right").css("height", "400px");
				$(".modal-centered").css("height", "400px");
				$(".modal-context table").css("height", "320px");
			}
		}else {
			$("#mungstarPhoto").css("height", "600px");
			$(".modal-left").css("width", $("#mungstarPhoto").width()-1);
			$(".modal-right").css("height", "600px");
			$(".modal-centered").css("height", "600px");
			$(".modal-context table").css("height", "520px");
		}
	}
	$(".modal-centered").css("visibility", "visible");
}


/* ------------------------------------------------------------------------------------------------------------------------ */
// 검색

$(function() {
	$("body").on("click", "#context a", function() {
		searchTag($(this).text());
	});
});

/* ---------------------------------------------------------------------------------------------------------------------- */
// 좋아요

function like(num) {
	var likeState = $("#like button").attr("data-like");
	var data = {num:num};
	
	if(likeState == 'off'){
		var url = "<%=cp %>/mungstargram/insertLike";
		$.ajax({
			url: url
			,data: data
			,type: "post"
			,success: function() {
				$('#like button').attr('class', 'glyphicon glyphicon-heart icon-size-30');
				$('#like button').attr('data-like', 'on');
				$("#like span").html($("#like span").html() - (-1));
			}
			,error: function(e) {
				console.log(e);
			}
		});
	}else if(likeState == 'on'){
		var url = "<%=cp %>/mungstargram/deleteLike";
		$.ajax({
			url: url
			,data: data
			,type: "post"
			,success: function() {
				$('#like button').attr('class', 'glyphicon glyphicon-heart-empty icon-size-30');
				$('#like button').attr('data-like', 'off');
				$("#like span").html($("#like span").html() - 1);
			}
			,error: function(e) {
				console.log(e);
			}
		});
	}else{
		alert("로그인이 필요합니다.");
	}
	
}

/* ---------------------------------------------------------------------------------------------------------------------- */
// 리플

$(function() {
	$("body").on("focusin","#replyTx", function() {
		if($("#replyTx").data("info") == 'no'){
			alert("로그인 후 이용가능");
			$("#replyTx").blur();
		}else{
			$(document).keyup(function(e) {
				if(e.keyCode == 13){
					var url = "<%=cp %>/mungstargram/reply";
					var num = $("#replyTx").attr("data-num");
					var memberId = $("#replyTx").attr("data-info");
					var reply = $("#replyTx").val();
					var data = {num:num, memberId:memberId, reply:reply};
					$.ajax({
						url: url
						,data: data
						,type: "post"
						,success: function() {
							$("#reply").append("<div><a><b>" + memberId + "</b></a> " + $("#replyTx").val() + "</div>");
							$("#replyTx").val("");
							return;
						}
					});
				}
			});
		}
	});
});


/* ---------------------------------------------------------------------------------------------------------------------- */

function openWin(){
    window.open("<%=cp%>/mungstargram/created", "이미지 편집", "width=1085, height=550, left=100, top=20, toolbar=no, menubar=no, scrollbars=no, location=no, status=no, resizable=no" );
}

</script>



<div class="body-container">
	<h2>mungstargram.</h2>
	<h4>Resize the browser window to see the effect.</h4>
	
	<button class="btn" onclick="openWin();">insert</button>
	
	<div id="printPhoto"></div>

<%-- 
	<div class="responsive">
		<div style="background: black;">
			<div class="gallery">
				<img src="<%=cp%>/resource/img/test1.jpg">
				<div style="position: absolute; top: 10px; right: 10px;">
					<span class='glyphicon glyphicon-th-large myIcon'></span>
				</div>
				<div class="gallery-text">
					<span class="glyphicon glyphicon-heart"></span> : 2134개 &nbsp;&nbsp;&nbsp; 
					<span class="glyphicon glyphicon-comment"></span> : 83개
				</div>
			</div>
		</div>
	</div>
--%>
	<div class="clearfix"></div>


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
								<div id='leftBtn' align="left" style="width:50%; float:left;">
									<button class='glyphicon glyphicon-circle-arrow-left btn-lg directionBtn'></button>
								</div>
								<div id='rightBtn' align="right" style="width:50%; float:left;">
									<button class='glyphicon glyphicon-circle-arrow-right btn-lg directionBtn'></button>
								</div>
							</div>
							<div style="position: absolute; width: 100%; bottom: 15px; right: 0;">
								<div id='bottomBtn' align="center"></div>
							</div>
						</div>
					</div>
					<div class="modal-right">
						<div class="modal-title">
							<a id='memberId'>
								<img src="<%=cp%>/resource/img/dog3.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40">&nbsp;
								<b></b>
							</a>
						</div>
						<div class="modal-context">
							<table>
								<tr><td>
									<div style="overflow:auto; height: 100%;">
										<div class='contents'>
											<div id='context'></div>
											<div id='reply'></div>
										</div>
									</div>
								</td></tr>
								<tr height="100px;">
									<td>
										<div id='like' class='like-hit-re'>
											<button class='glyphicon glyphicon-heart-empty icon-size-30' data-like='logout'></button>
											<div><span></span></div>
										</div>
										<div id='hitCount' class='like-hit-re'>
											<div class='glyphicon glyphicon-eye-open icon-size-30'></div>
											<div><span></span></div>
										</div>
										<div class='like-hit-re icon-size-30'>
											<div></div>
										</div>
										<div id='created'></div>
									</td>
								</tr>
								<tr height="50px;"><td><input id='replyTx' class="boxTF" type="text" style="width: 100%; border: none;" placeholder="로그인 후 이용가능"></td></tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>



