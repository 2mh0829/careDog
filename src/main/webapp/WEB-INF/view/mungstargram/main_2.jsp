<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>

.modal-size {
	width: 75%;
}

.totImg {
	position: relative;
	width: 100%;
	min-height: 450px;
	margin: 20px auto;
}

.leftImg {
	border: 1px solid #ccc;
	width:65%;
	height: 450px;
	line-height: 450px;
	vertical-align: middle;
	float: left;
	display: inline-block;
	padding: 0 40px;
}

div.leftImg img {
	width: 100%;
	height: auto;
	vertical-align: middle;
}

.rightDes {
	border: 1px solid #ccc;
	width: 35%;
	height: 250px;
	float: right;
	display: inline-block;
	padding: 0 40px;
}

.rightDet {
	border: 1px solid #ccc;
	width: 35%;
	height: 200px;
	float: right;
}

/* ---------------- */

.modal-center {
	margin: 0 auto;
	vertical-align: middle;
}

/* ---------------- */


div.gallery {
	border: 1px solid #ccc;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: 100%;
}

/* div.gallery img:hover {
	border: 1px solid #777;
	background: red;
} */

div.desc {
	padding: 15px;
	text-align: left;
}

* {
	box-sizing: border-box;
}

.responsive {
	padding: 6px 6px;
	float: left;
	/* width: 24.99999%; */
	width: 33.33333%;
}

@media only screen and (max-width: 800px) {
	.responsive {
		width: 49.99999%;
		margin: 6px 0;
	}
	
	.leftImg {
		width: 100%;
	}
	
	.rightDes {
		width: 100%;
		display: block;
	}
	
	.modal-size {
		width: 99%;
	}
	
}

@media only screen and (max-width: 500px) {
	.responsive {
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
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>

<div class="body-container">

	<h2>mungstargram.</h2>
	<h4>Resize the browser window to see the effect.</h4>

	<div class="responsive">
		<div class="gallery">
			<a href="#" id="myBtn">
				<img src="<%=cp%>/resource/img/test.jpg" alt="Trolltunga Norway" width="300" height="200">
			</a>
			<div class="desc">Add a description of the image here</div>
		</div>
	</div>


	<div class="responsive">
		<div class="gallery">
			<a href="#"> <img src="<%=cp%>/resource/img/dog2.jpg"
				alt="Forest" width="600" height="400">
			</a>
			<div class="desc">Add a description of the image here</div>
		</div>
	</div>

	<div class="responsive">
		<div class="gallery">
			<a href="#"> <img src="<%=cp%>/resource/img/dog3.jpg"
				alt="Northern Lights" width="600" height="400">
			</a>
			<div class="desc">Add a description of the image here</div>
		</div>
	</div>

	<div class="responsive">
		<div class="gallery">
			<a href="#"> <img src="<%=cp%>/resource/img/dog4.jpg"
				alt="Mountains" width="600" height="400">
			</a>
			<div class="desc">Add a description of the image here</div>
		</div>
	</div>

	<div class="clearfix"></div>
	

	<button class="btn" onclick="location.href='<%=cp%>/mungstargram/created'">insert</button>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-size">

			<div class="modal-body modal-center">
				<img src="<%=cp %>/resource/img/dog1.jpg" width="50%">
			</div>

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">mungstargram</h4>
				</div>
				<div class="modal-body">
					<div class="totImg">
						<div class="leftImg">
							<img src="<%=cp %>/resource/img/dog1.jpg">
						</div>
						<div class="rightDes">
							사용자 : abcdefg
							<br><br>
							내용 : test 이미지 입니다.
							
						</div>
						<div class="rightDet">
							댓글입니다.
						</div>
						
						
						<div style=" position: absolute; top: 50%; left: 1%;">
							<a><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
						</div>
						<div style="position: absolute; top: 50%; right: 1%;">
							<a><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
			<div style=" position: absolute; top: 50%; left: 7%;">
				<a class="btn-lg"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: white;"></span></a>
			</div>
			<div style="position: absolute; top: 50%; right: 7%;">
				<a class="btn-lg"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: white;"></span></a>
			</div>
	</div>

</div>