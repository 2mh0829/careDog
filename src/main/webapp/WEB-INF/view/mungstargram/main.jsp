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
	height: 550px;
	margin: 0px auto;
	border: 1px solid red;
}

.leftImg {
	border: 1px solid #ccc;
	width: 75%;
	float: left;
	display: inline-block;
}

.rightDes {
	border: 1px solid #ccc;
	width: 25%;
	float: left;
	display: inline-block;
}

div.gallery {
	border: 1px solid #ccc;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

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
	width: 24.99999%;
}

@media only screen and (max-width: 800px) {
	.responsive {
		width: 49.99999%;
		margin: 6px 0;
	}
	
	.leftImg {
		border: 1px solid #ccc;
		background: blue;
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
				<img src="<%=cp%>/resource/img/dog1.jpg" alt="Trolltunga Norway" width="300" height="200">
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

	<div class="responsive">
		<div class="gallery">
			<a href="#"> <img src="<%=cp%>/resource/img/dog4.jpg"
				alt="Mountains" width="600" height="400">
			</a>
			<div class="desc">Add a description of the image here</div>
		</div>
	</div>

	<div class="clearfix"></div>


	<button class="btn" onclick="location.href='<%=cp%>/mungstargram/insert'">insert</button>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-size">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">mungstargram</h4>
				</div>
				<div class="modal-body" style="min-height: 700px;">
					<div class="totImg">
						<div class="leftImg gallery">
							<img alt="Forest" src="<%=cp %>/resource/img/dog1.jpg">
						</div>
						<div class="rightDes">
							사용자 : 내용
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</div>