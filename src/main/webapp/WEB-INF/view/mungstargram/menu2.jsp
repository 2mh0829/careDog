<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.menu2 {
	background: #ffb677;
	color: black;
	line-height: normal;
}

.search-container {
	display: table-cell;
	vertical-align: middle;
	width: 250px;
	height: 65px;
}

#searchBar {
	height: 33px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background: #eee;
	color: #888;
	font-size: 16px;
	font-weight: normal;
}

#inpTx {
	width: 200px;
	height: 30px;
	border: none;
	color: black;
	background: white;
	vertical-align: middle;
}

#inpTx:focus {
	outline: none;
}

.icon-size {
	margin: 0 auto;
	font-size: 12px;
	color: #888;
}

#inpDiv {
	border-radius: 3px;
	position: relative;
	top: -30px;
	height: 30px;
	line-height: 30px;
	background: #eee;
}

#loading {
	visibility: hidden;
}


/* ui autocomplete------------------------------------------------------------------------ */

.totBox {
	position: absolute;
	width: 250px;
	height: 300px;
	margin: 15px auto;
	visibility: hidden;
}

.totBox::after {
	content: "";
	position: absolute;
	bottom: 100%;
	left: 50%;
	margin-left: -10px;
	border-width: 10px;
	border-style: solid;
	border-color: transparent transparent white transparent;
}

#autocompleteList {
	position: absolute;
	font-size: 15px;
	font-weight: normal;
	width: 250px;
	max-height: 300px;
	overflow-x: hidden;
	overflow-y: auto;
	border-radius: 3px;
	box-shadow: -3px -5px 7px #ccc;
	background: white;
}

.selecter {
	width: 100%;
	height: 70px;
	border-bottom: 1px solid #ccc;
	background: white;
}

.selecterNone {
	width: 100%;
	height: 50px;
	line-height: 50px;
	color: #888;
	border-bottom: 1px solid #ccc;
	background: white;
}

.selecter:hover, .selecter:focus{
	background: #eee;
	cursor: pointer;
	outline: none;
}

.photoBox {
	width: 60px;
	height: 70px;
	float: left;
	color: #ccc;
	font-size: 25px;
	font-weight: bold;
	line-height: 70px;
	vertical-align: middle;
}

.tagBox {
	width: 170px;
	height: 70px;
	float: left;
}

.tag {
	width: 170px;
	height: 35px;
	line-height: 50px;
	vertical-align: bottom;
	font-weight: bold;
	overflow: hidden;
}

.tagCount {
	width: 170px;
	height: 35px;
	color: #888;
}


</style>

<script type="text/javascript">
/* $(window).scroll(function() {
	if($(this).scrollTop() >= 65){
		$(".search-container").css("height","65px");
		$(".menu2").css("line-height","normal");
	}else{
		$(".search-container").css("height","90px");
		$(".menu2").css("line-height","normal");
	}
});
 */

$(function() {
	var searchKeyword = "";
	var tempTag = [];

	$("body").on("click", "#inpDiv", function() {
		$("#inpDiv").css("visibility", "hidden");
		$("#inpTx").focus();
		$("#searchBar").css("background", "white");
		
	});
	
	$("body").on("click",".container", function() {
		searchKeyword = $("#inpTx").val();
		if(searchKeyword != '')
			$("#inpSp").html(" " + searchKeyword);
		else
			$("#inpSp").html(" 검색");
		
		$("#inpDiv").css("visibility", "visible");
		$("#searchBar").css("background", "#eee");
		$(".totBox").css("visibility", "hidden");
	});
	
	var url = "<%=cp %>/mungstargram/autocomplete";
	$("#inpTx").autocomplete({
		source: function( request, response ) {
			var out = "";
			target = -1;
			$("#box"+target).css("background", "");
			
			$.ajax( {
				url: url,
				dataType: "json",
				data: {
					term: request.term
				},beforeSend: function() {
					$("#loading").css("visibility", "visible");
				},
				success: function(data) {
					tempTag = [];
					$(".totBox").css("visibility", "visible");
					$("#loading").css("visibility", "hidden");
					if(data.length < 1){
						out += "<div class='selecterNone'>검색 결과가 없습니다.</div>";
					}else{
						response(
							$.map(data, function(item, i) {
								tempTag.push(item.tag);
								if(item.tag != null){
									out += "<div id='box" + i + "' class='selecter' onclick='searchTag(\""+item.tag+"\")' tabindex='"+i+"'><div class='photoBox'>#</div>";
									out += "<div class='tagBox' align='left'><div id='tag"+i+"' class='tag' data-tag='tag'>" + item.tag + "</div>";
								}else if(item.memberId != null){
									out += "<div id='box" + i + "' class='selecter' onclick='searchId(\""+item.memberId+"\")' tabindex='"+i+"'><div class='photoBox'>IMG</div>";
									out += "<div class='tagBox' align='left'><div id='tag"+i+"' class='tag' data-tag='id'>" + item.memberId + "</div>";
								}
								out += "<div class='tagCount'>게시물&nbsp;" + item.tagCount + "</div></div></div>";
							})
						);
					}
					$("#autocompleteList").html(out);
				},
				error: function(e) {
					console.log(e);
				}
			});
		}
		,minLength: 1
		,delay: 500
	});
	
	
	var target = 0;
	$(document).keyup(function(e) {
		if(e.target.id == "inpTx" || e.target.className == "selecter"){
		
			var key = e.keyCode;
			switch (key) {
			case 38:
				target--;
				break;
			case 40:
				target++;
				break;
			case 13:
				if(target == -1){
					if($("#inpTx").val() == ""){
						alert("검색할 키워드를 입력해주세요.");
					}else{
						target = 0;
						$("#box"+target).focus();
					}
				}else
					search(target);
				break;
			}
			
			if(target <= -1){
				target = -1;
				$("#inpTx").focus();
			}else if(target > tempTag.length-1){
				target = tempTag.length-1;
			}
			
			$("#box"+target).focus();

		}
		
	});
	
	$("body").on("click", "#inpTx", function() {
		$("#box"+target).css("background", "");
		target = -1;
	});
	
	
});

function search(target){
	if($("#tag"+target).data("tag") == "tag")
		searchTag($("#tag"+target).text());
	else if($("#tag"+target).data("tag") == "id")
		searchId($("#tag"+target).text());
}

var searchKey = "";
var searchValue = "";

function searchTag(tag) {
	searchKey = "tag";
	searchValue = tag;
	searchSubmit();
}

function searchId(id) {
	searchKey = "id";
	searchValue = id;
	searchSubmit();
}

function searchSubmit() {
	var form = document.createElement("form");
	var url = "<%=cp %>/mungstargram";
	form.setAttribute("action", url);
	form.setAttribute("method", "get");
	
	var key = document.createElement("input");
	key.setAttribute("type", "hidden");
	key.setAttribute("name", "searchKey");
	key.setAttribute("value", searchKey);
	form.appendChild(key);
	
	var val = document.createElement("input");
	val.setAttribute("type", "hidden");
	val.setAttribute("name", "searchValue");
	val.setAttribute("value", searchValue);
	form.appendChild(val);
	
	document.body.appendChild(form);
	form.submit();
}

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
			<div class='totBox'>
				<div id='autocompleteList'></div>
			</div>
		</div>	
	</div>
</div>

