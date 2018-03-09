<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<style>
.alert-info {
    border: 1px solid #9acfea;
    border-radius: 4px;
    background-color: #d9edf7;
    color: #31708f;
    padding: 15px;
    margin-top: 10px;
    margin-bottom: 20px;
}

.tabs li{
    width: 342px;
    text-align: center;
    margin-top: 10px;
    margin-bottom: 10px;
    font-size: 34px;
}
.tabs li.active{
background-color: #eee;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	$("#tab-gongji").addClass("active");
	listPage(1);

	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		listPage(1);
	});
});

// 글리스트 및 페이징 처리
function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/list";
	
	var query="pageNo="+page;
	var search=$('form[name=centerSearchForm]').serialize();
	query=query+"&"+search;
	
	ajaxHTML(url, "get", query);
}

// 글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return;
			}
			$("#tab-content").html(data);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	  	,error : function(jqXHR) {
	        if (jqXHR.status == 401) {
	        	 console.log(jqXHR);
	        } else if (jqXHR.status == 403) {
	        	location.href="<%=cp%>/member/noAuthorized";
	        } else {
	        	 console.log(jqXHR.responseText);
	        }
	    }
	});
}

// 검색
function searchList() {
	var f=document.centerSearchForm;
	f.searchKey.value=$("#searchKey").val();
	f.searchValue.value=$.trim($("#searchValue").val());

	listPage(1);
}

// 새로고침
function reloadBoard() {
	var f=document.centerSearchForm;
	f.searchKey.value="subject";
	f.searchValue.value="";
	
	listPage(1);
}

// 글쓰기폼
function insertForm() {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/created";

	var query="tmp="+new Date().getTime();
	ajaxHTML(url, "get", query);
}

// 글등록, 수정등록, 답변등록
function sendOk(mode, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	
    var f = document.boardForm;

	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
	
    var url="<%=cp%>/center/"+tab+"/"+mode;
    var query = new FormData(f); // IE는 10이상에서만 가능
    
	$.ajax({
        type:"post"
        ,url:url
        ,processData: false  // file 전송시 필수
        ,contentType: false  // file 전송시 필수
        ,data: query
        ,dataType:"json"
        ,success:function(data) {
            var state=data.state;
            if(state=="false")
                alert("게시물을 추가(수정)하지 못했습니다. !!!");

        	if(page==undefined || page=="")
        		page="1";
        	
        	if(mode=="created" || mode=="reply") {
        		reloadBoard()
        	} else {
        		listPage(page);
        	}
        }
        ,beforeSend : function(jqXHR) {
            jqXHR.setRequestHeader("AJAX", true);
        }
        ,error : function(jqXHR) {
            if (jqXHR.status == 401) {
               console.log(jqXHR);
            } else if (jqXHR.status == 403) {
            	location.href="<%=cp%>/member/noAuthorized";
            } else {
                console.log(jqXHR.responseText);
            }
        }
	});
}
// 글쓰기 취소, 수정 취소, 답변 취소
function sendCancel(page) {
	if(page==undefined || page=="")
		page="1";
	
	listPage(page);
}

// 게시글 보기
function contentBoard(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/content";
	
	var query = "num="+num;
	
	var search=$('form[name=centerSearchForm]').serialize();
	query=query+"&pageNo="+page+"&"+search;
	
	ajaxHTML(url, "get", query);
}

// 글 수정폼
function updateForm(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/update";
	
	var query;
	if(tab=="gongji")
		query="num="+num;
	else
		query="num="+num;
	query=query+"&pageNo="+page
	
	ajaxHTML(url, "get", query);
}

//글 답변폼
function replyForm(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/reply";
	
	var query;
	if(tab=="gongji")
		query="num="+num;
	else
		query="num="+num;
	query=query+"&pageNo="+page
	
	ajaxHTML(url, "get", query);
}

// 글 삭제
function deleteBoard(num, page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/delete";
	
	var query;
	if(tab=="gongji") {
		query="num="+num;
	} else { 
		query="num="+num;
	}
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? "))
		  return;
	  
	$.ajax({
	        type:"post"
	        ,url:url
	        ,data: query
	        ,dataType:"json"
	        ,success:function(data) {
	            listPage(page);
	        }
	        ,beforeSend : function(jqXHR) {
	            jqXHR.setRequestHeader("AJAX", true);
	        }
	        ,error : function(jqXHR) {
	            if (jqXHR.status == 401) {
	               console.log(jqXHR);
	            } else if (jqXHR.status == 403) {
	            	location.href="<%=cp%>/member/noAuthorized";
	            } else {
	                console.log(jqXHR.responseText);
	            }
	        }
	});
}

function deletePhoto() {
	<c:if test="${sessionScope.member.memberId=='admin'}">
	  var num = "${dto.num}";
	  var page = "${page}";
	  var query = "num="+num+"&page="+page;
	  var url = "<%=cp%>/center/"+tab+"/delphoto?" + query;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
	</c:if>    
	<c:if test="${sessionScope.member.memberId!='admin'}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}

	function updatePhoto() {
	<c:if test="${sessionScope.member.memberId=='admin'}">
	  var num = "${dto.num}";
	  var page = "${page}";
	  var query = "num="+num+"&page="+page;
	  var url = "<%=cp%>/center/"+tab+"/updatephoto?" + query;

	  location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.memberId!='admin'}">
	 alert("게시물을 수정할 수  없습니다.");
	</c:if>
	}
</script>

<div class="body-container" style="width: 700px;">
    <div>
            <div style="clear: both;">
	           <ul class="tabs">
			       <li id="tab-gongji" data-tab="gongji" class="active">공지사항</li>
			       <li id="tab-event" data-tab="event">이벤트</li>
			   </ul>
		   </div>
		   <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
    </div>
</div>

<form name="centerSearchForm" action="" method="post">
    <input type="hidden" name="searchKey" value="subject">
    <input type="hidden" name="searchValue" value="">
</form>

