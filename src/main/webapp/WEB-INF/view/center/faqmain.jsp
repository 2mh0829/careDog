<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
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

.comm1sTabs.customer {overflow:hidden;height:55px;margin:30px 0 0;padding-bottom:5px}
.comm1sTabs.customer > li {position:relative;float:left;width:340px;text-align:center;border:0}
.comm1sTabs.customer > li+li {width:146px;margin-left:-1px}
.comm1sTabs.customer > li {display:block;height:50px;background:#f6f6f6;font-size:18px;color:#666;font-weight:400;border-left:1px solid #e6e6e6}
.comm1sTabs.customer > li:first-child {border:0}
.comm1sTabs.customer > li.active {background:#555 !important;color:#fff;border:0}
.comm1sTabs.customer > li.active:before {position:absolute;content:'';bottom:-5px;left:50%;width:12px;height:5px;margin-left:-6px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/bg_tab_arrow.png") no-repeat 0 0}

.comm1sTabs.customer+.search-period {margin-top:35px !important}
.area-customer .comm2sTabs {margin-top:35px}

.comm1sTabs {overflow:hidden;width:100%;margin:15px 0 0;}
.comm1sTabs.threeSet li {width:50%;}
.comm1sTabs.threeSet li:first-child {width:146px;float: left;}
.comm1sTabs > li {float:left;width:50%;border-left:1px solid #e3e3e3;border-bottom:2px solid #969937;text-align:center;background:#f6f6f6}
.comm1sTabs > li:first-child {border-left:0}
.comm1sTabs > li {display:block;height:50px;padding-top:15px;color:#333;font-size:18px}
.comm1sTabs > li.active {border-left:2px solid #969937;border-top:2px solid #969937;border-right:2px solid #969937;border-bottom:0;background:#fff}
.comm1sTabs > li.active {padding-top:13px}
.comm1sTabs > li.active+li {border-left:0}

/* BOARD LIST */
.board-list-1s {table-layout:fixed;width:1020px;margin:0 auto;border-top:2px solid #888;}
.board-list-1s thead tr th {padding:22px 0 20px;border-bottom:1px solid #888;text-align: center;}
.board-list-1s thead.visible, .board-list-1s thead.visible tr, .board-list-1s thead.visible tr th {z-index:-1;visibility:hidden;position:absolute;top:-99999px;width:0;height:0;font-size:0;text-indent:-99999px;line-height:0;}
.board-list-1s tr td {padding:23px 0 24px;border-bottom:1px solid #e6e6e6;color:#666;font-size:14px;text-align:center;line-height:20px;vertical-align:middle;}
.board-list-1s tr td.subject {position:relative;padding-left:15px;text-align:left;}
.board-list-1s tr td.subject a {display:inline-block;max-width:65%;color:#333;vertical-align:middle}
.board-list-1s tr td.subject strong.FG01 {display:inline-block;color:#333;font-size:18px;line-height:30px;width:70px;height:20px;border-radius:10px;color:#fff;font-size:12px;text-align:center;line-height:20px;background:#a68fcd;}
.board-list-1s tr td.subject strong.FG02 {display:inline-block;color:#333;font-size:18px;line-height:30px;width:70px;height:20px;border-radius:10px;color:#fff;font-size:12px;text-align:center;line-height:20px;background:#ed95b7;}
.board-list-1s tr td.subject .tx_store {position:absolute;top:24px;right:10px;color:#888}
.board-list-1s tr.checked td.subject strong {color:#969937;}
.board-list-1s tr td.addr {padding-left:15px;text-align:left;}
.board-list-1s tr td a {display:inline-block;}
.board-list-1s tr td .tel {display:inline-block;padding:0 0 0 20px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_tel13x13.png") no-repeat 0 3px;text-align:left;}
.board-list-1s tr td .jeem-check {display:inline-block;width:25px;height:23px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_check25x23_off.png") no-repeat 0 0;font-size:0;text-indent:-99999px;line-height:0;cursor:pointer;vertical-align:top;}
.board-list-1s tr.checked td .jeem-check {background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_check25x23_on.png") no-repeat 0 0;}

.board-list-1s tr td .ButtonMap {display:inline-block;width:78px;height:36px;padding:10px 0 0;border-radius:5px;border:1px solid #ddd;color:#333;font-size:14px;text-align:center;line-height:18px;}

.board-list-1s tr td .ButtonTime {display:inline-block;width:70px;height:28px;margin:0 0 0;padding:3px 0 0;border-radius:5px;border:1px solid #ccc;color:#666;font-size:12px;text-align:center;line-height:18px;background:transparent;vertical-align:middle;}
.board-list-1s tr td .FG01, .board-list-1s tr td .FG02, .board-list-1s tr td .FG03, .board-list-1s tr td .FG04 {position:relative;top:-1px;margin:0 15px 0 0;}
.sub_title_area.customer {height:100px;background:#faeee1 url("<%=cp%>/resource/img/faq/bg_customer_top.png") no-repeat 50% 0}

</style>

<script type="text/javascript">
$(function(){
	$("#tabfaq10").addClass("active");
	listPage(1);

	$("ul.comm1sTabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.comm1sTabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab"+tab).addClass("active");
		
		listPage(1);
	});
});

// 글리스트 및 페이징 처리
function listPage(page) {
	var $tab = $("ul.comm1sTabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/tab"+tab;	//careDog/center/taball
	
	var query="pageNo="+page;
	var search=$('form[name=faqsearchForm]').serialize();
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
	var f=document.faqsearchForm;
	f.searchKey.value=$("#searchKey").val();
	f.searchValue.value=$.trim($("#searchValue").val());

	listPage(1);
}

// 새로고침
function reloadBoard() {
	var f=document.faqsearchForm;
	f.searchKey.value="subject";
	f.searchValue.value="";
	
	listPage(1);
}

// 글쓰기폼
function insertForm() {
	var $tab = $("ul.comm1sTabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/created";

	var query="tmp="+new Date().getTime();
	ajaxHTML(url, "get", query);
}

// 글등록, 수정등록, 답변등록
function sendOk(mode, page) {
	var $tab = $("ul.comm1sTabs .active");
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
	var $tab = $(".comm1sTabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/content";
	
	var query = "num="+num;
	
	var search=$('form[name=faqsearchForm]').serialize();
	query=query+"&pageNo="+page+"&"+search;
	
	ajaxHTML(url, "get", query);
}

// 글 수정폼
function updateForm(num, page) {
	var $tab = $(".comm1sTabs .active");
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
	var $tab = $(".comm1sTabs .active");
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
	var $tab = $(".comm1sTabs .active");
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
</script>
<div class="body-container" style="width: 1020px;">

<div class="sub_title_area customer">
	<h1>고객센터 <span>무엇을 도와드릴까요?</span></h1>
</div>
    <ul class="comm1sTabs threeSet customer">
				<li id="taball" data-tab="all" class="active">전체</li>
				<li id="tabfmember" data-tab="fmember" >회원/멤버십</li>
				<li id="tabfbuy" data-tab="fbuy" >주문/결제</li>
				<li id="tabfdelivery" data-tab="fdelivery" >배송</li>
				<li id="tabfrefund" data-tab="frefund" >교환/반품/환불</li>
				<li id="tabfevent" data-tab="fevent" >이벤트</li>
				<li id="tabfetc" data-tab="fetc" >기타</li>
	</ul>
	<div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
</div>

<form name="faqsearchForm" action="" method="post">
    <input type="hidden" name="searchKey" value="subject">
    <input type="hidden" name="searchValue" value="">
</form>