<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>

.modal-size {
	background: white;
	width: 60%;
	top: 100px;
	/* height: 90vh; */
	line-height: 30vh;
}

.modal-center {
	width: 100%;
	line-height: 30vh;
}

.modal-center img {
	vertical-align: middle;
	width: 65%; 
}

/* .imageSize {
	width: 65%;
}
 */


/* ---------------- */


div.gallery {
	border: 1px solid #ccc;
	height: 20vw;
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
	padding: 15px 15px;
	float: left;
	/* width: 24.99999%; */
	width: 33.33333%;
}

@media only screen and (max-width: 800px) {
	div.gallery {
		height: 30vw;
	}
	
	div.gallery img {
		height: 110%;
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

@media only screen and (max-width: 500px) {
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
    $("#myBtn").click(function(){
    	var imgName = "<%=cp%>/resource/img/test1.jpg";
    	var imgId = "myimg";

    	$(".modal-img-area").html("<img class='imageSize' src='"+imgName +"' id='"+imgId+"'/>"); 

    	$("#myModal").modal();
    	
    	$("#"+imgId).load(function() {
    		var w = $(this).width();
    		alert(w);
    	});
    	
    });
});
</script>

<div class="body-container">

	<h2>mungstargram.</h2>
	<h4>Resize the browser window to see the effect.</h4>

	<div class="responsive">
		<div class="gallery">
			<a href="#" id="myBtn">
				<img src="<%=cp%>/resource/img/test1.jpg" alt="Trolltunga Norway">
			</a>
		</div>
	</div>


	<div class="responsive">
		<div class="gallery">
			<a href="#"> <img src="<%=cp%>/resource/img/test2.jpg"
				alt="Forest" width="600" height="400">
			</a>
		</div>
	</div>

	<div class="responsive">
		<div class="gallery">
			<a href="#"> <img src="<%=cp%>/resource/img/dog3.jpg"
				alt="Northern Lights" width="600" height="400">
			</a>
		</div>
	</div>

	<div class="clearfix"></div>
	

	<button class="btn" onclick="location.href='<%=cp%>/mungstargram/created'">insert</button>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-size">

			<div class="modal-body modal-center">
				<div class="modal-img-area"></div>
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