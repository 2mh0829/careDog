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

#searchBar input {
	width: 200px;
	height: 30px;
	border: none;
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
	height: 30px;
	line-height: 30px;
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
		var inFoc = "<span class='glyphicon glyphicon-search icon-size'></span>&nbsp;<input id='inpTx' type='text' placeholder='검색' value='"+searchKey+"'>";
		inFoc += "<span id='loading'><img src='<%=cp %>/resource/img/gif/ajax-loader.gif'></span>";
		$("#searchBar").html(inFoc);
		$("#searchBar").css("background", "white");
		$("#searchBar").css("color", "black");
		$("#searchBar input").focus();
	});
	
	$("body").on("keyup change click", "#inpTx", function() {
		//alert("b");
	});
	
	/* $("body").on("focusout", "#inpTx", function() {
		searchKey = $("#inpTx").val();
		var inFoc = "<div id='inpDiv' align='center'><span class='glyphicon glyphicon-search icon-size'></span>&nbsp;검색</div>";
		if(searchKey != ''){
			inFoc = "<div id='inpDiv' align='center'><span class='glyphicon glyphicon-search icon-size'></span>&nbsp;" + searchKey + "</div>";
		}
		$("#searchBar").css("background", "#eee");
		$("#searchBar").css("color", "#aaa");
		$("#searchBar").html(inFoc);
	}); */
	
	var availableTags = [
	      "ActionScript",
	      "AppleScript",
	      "Asp",
	      "BASIC",
	      "C"
	    ];
	$( "#inpTx" ).autocomplete({
		source: availableTags
	});
	
});

</script>


<div class="header-bottom">
<input id="tags">
	<div class="menu2" align="center">
		<div class="search-container">
			<div id="searchBar">
				<div id='inpDiv' align='center'>
					<span class='glyphicon glyphicon-search icon-size'></span>&nbsp;검색
				</div>
			</div>	
		</div>	
	</div>
</div>
