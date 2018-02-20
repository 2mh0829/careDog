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
	height: 400px;
}

div.modal-left {
	background: black;
	float: left;
	width: 100px;
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

/* ------------------------- */
div.gallery {
	position: relative;
	height: 20vw;
	background: black;
}

div.gallery:hover .gallery-text {
	opacity: 1;
}

div.gallery-text {
	position: absolute;
	width: 100%;
	top: 50%;
	left: 50%;
	text-align: center;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
	opacity: 0;
}

div.gallery img {
	width: 100%;
	height: 100%;
}

div.gallery img:hover {
	opacity: 0.8;
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
}

@media only screen and (max-width: 700px) {
	div.gallery {
		height: 40vw;
	}
	div.gallery img {
		height: 120%;
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

<script>
$(document).ready(function(){
    $("#myImg").click(function(){
    	
    	var imgName = "<%=cp%>/resource/img/test1.jpg";
    	var imgId = "myimg";
    	
    	$(".modal-left").html("<img src='"+ imgName +"' id='"+imgId+"'>");
    	
    	$("#"+imgId).load(function() {
    		if(this.naturalWidth >= this.naturalHeight){
    			$(this).css("width", "600px");
    			$(".modal-left").css("width", "600px");
    			if($(this).height() >= 400){
	    			$(".modal-right").css("height", $(this).height()+"px");
	    			$(".modal-centered").css("height", $(this).height()+"px");
	    			$(".modal-context table").css("height", $(this).height() - 80 +"px");
    			}else {
    				$(this).css("margin-top", (400 - $(this).height()) / 2 + "px");
    			}
    		}else {
    			$(this).css("height", "600px");
    			$(".modal-left").css("width", $(this).width()-1);
    			$(".modal-right").css("height", "600px");
    			$(".modal-centered").css("height", "600px");
    			$(".modal-context table").css("height", "520px");
    		}
    	});
    	
    	$("#myModal").modal();
    	
    });
    
    

});

</script>

<div class="body-container">

	<h2>mungstargram.</h2>
	<h4>Resize the browser window to see the effect.</h4>

	<div class="responsive">
		<div class="gallery">
			<img id="myImg" src="<%=cp%>/resource/img/test1.jpg" alt="Trolltunga Norway">
			<div class="gallery-text">
				<b>좋아요 : 2134개 &nbsp;&nbsp;&nbsp; 댓글 : 83개</b>
			</div>
		</div>
	</div>


	<div class="responsive">
		<div class="gallery">
			<img src="<%=cp%>/resource/img/test2.jpg" alt="Forest" width="600" height="400">
			<div class="gallery-text" align="center">
				<b>좋아요 : 2134개 &nbsp;&nbsp;&nbsp; 댓글 : 83개</b>
			</div>
		</div>
	</div>

	<div class="responsive">
		<div class="gallery">
			<img src="<%=cp%>/resource/img/dog3.jpg" alt="Northern Lights" width="600" height="400">
			<div class="gallery-text" align="center">
				<b>좋아요 : 2134개 &nbsp;&nbsp;&nbsp; 댓글 : 83개</b>
			</div>
		</div>
	</div>

	<div class="clearfix"></div>
	

	<button class="btn" onclick="location.href='<%=cp%>/mungstargram/created'">insert</button>

	<!-- Modal -->
	<div class="modal" id="myModal" role="dialog">
		<div class="modal-out">
			<div class="modal-in">
				<div class="modal-centered">
					<div class="modal-left"></div>
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
										test<br><br><br><br><br><br><br><br><br><br><br><br>test<br><br><br>test
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