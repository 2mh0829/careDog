<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.menu2 {
	background: yellow;
	color: black;
	line-height: normal;
}

.search-container {
	display: table-cell;
	vertical-align: middle;
	width: 250px;
	height: 90px;
}

#searchBar {
	height: 33px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background: #eee;
	color: #aaa;
	font-size: 16px;
	font-weight: normal;
}

#inpDiv {
	border-radius: 3px;
}

#searchBar input {
	width: 200px;
	height: 30px;
	border: none;
	color: black;
	background: white;
	vertical-align: middle;
}

#searchBar input:focus {
	outline: none;
}

.icon-size {
	margin: 0 auto;
	font-size: 12px;
	color: #aaa;
}

#inpDiv {
	position: relative;
	top: -30px;
	height: 30px;
	line-height: 30px;
	background: #eee;
}

#loading {
	visibility: hidden;
}

</style>

<script type="text/javascript">
$(window).scroll(function() {
	if($(this).scrollTop() >= 70){
		$(".search-container").css("height","65px");
		$(".menu2").css("line-height","normal");
	}else{
		$(".search-container").css("height","90px");
		$(".menu2").css("line-height","normal");
	}
});

$(function() {
	var searchKey = "";

	$("body").on("click", "#inpDiv", function() {
		$("#inpDiv").css("visibility", "hidden");
		$("#inpTx").focus();
		$("#searchBar").css("background", "white");
		
	});
	
	$("body").on("focusout", "#inpTx", function() {
		searchKey = $("#inpTx").val();
		if(searchKey != '')
			$("#inpSp").html(" " + searchKey);
		else
			$("#inpSp").html(" 검색");
		
		$("#inpDiv").css("visibility", "visible");
		$("#searchBar").css("background", "#eee");
		
	});
	
	var availableTags = [
	      "#멍스타그램",
	      "#careDog",
	      "#하이",
	      "BASIC",
	      "멍멍멍"
	    ];
	
	var url = "<%=cp %>/mungstargram/autocomplete";
	$("#inpTx").autocomplete({
		//source: availableTags
		source: function( request, response ) {
			$.ajax( {
				url: url,
				dataType: "json",
				data: {
					term: request.term
				},beforeSend: function() {
					$("#loading").css("visibility", "visible");
				},
				success: function(data) {
					$("#loading").css("visibility", "hidden");
					response(
						data
					);
				},
				error: function(e) {
					console.log(e);
				}
			});
		}
		,minLength: 3
		,select: function( event, ui ) {
			log( "Selected: " + ui.item.value + " aka " + ui.item.id );
		}
	});

	
});

</script>


<div class="header-bottom">
	<div class="menu2" align="center">
		<div class="search-container">
			<div id="searchBar">
				<span class='glyphicon glyphicon-search icon-size'></span>
				<input id='inpTx' type='text' placeholder='검색'>
				<span id='loading'><img src='<%=cp %>/resource/img/gif/ajax-loader.gif'></span>
				
				<div id='inpDiv' align='center'>
					<span class='glyphicon glyphicon-search icon-size'></span><span id='inpSp'>&nbsp;검색</span>
				</div>
			</div>	
		</div>	
	</div>
</div>

