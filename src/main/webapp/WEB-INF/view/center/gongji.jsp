<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
* {
	box-sizing: border-box;
}

div {
	margin: 0;
	padding: 0;
	border: 0;
}

ul{
list-style: none;
}

#gongji_Container {
	overflow: hidden;
	width: 100%;
	min-width: 1020px;
}

#gongji_Contents {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
}

.gongji_Tabs {
	overflow: hidden;
	height: 55px;
	margin: 30px 0 0;
	padding-bottom: 5px;
}

.gongji_Tabs
li:first_child{
width: 50%;
}

.gongji_Tabs > li{
position: relative;
float: left;
width: 497px;
text-align: center;
border: 0;
}

.gongji_Tabs > li > a{
display: block;
height: 50px;
padding: 0;
line-height: 50px;
font-size: 18px;
font-weight: 400;
}

.TabsConts{
display: block;
}
.gongji_list{
width: 1020px;
margin: 0 auto;
}
.gongji_list ul{
overflow: hidden;
width: 100%;
border-top: 2px solid #888;
}

.gongji_list ul li{
border-bottom: 1px solid #e6e6e6;
}

.gongji_list ul li .title{
margin-left: 20px;
padding: 20px 0 20px 42px;
color: #222;
font-size: 14px;
line-height: 18px;
cursor: pointer;
}

.gongji_list ul li .title strong{
display: inline-block;
width: 140px;
margin-right: 11px;
vertical-align: middle;
}

.gongji_list ul li .gongji_conts{
display: none;
background: #fafafa;
border: 0;
color: #222;
font-size: 0;
line-height: 0;
}

.gongji_list ul li .gongji_conts li.gongji_question{
padding: 28px 30px 25px 62px;
}

i{
padding-left: 598px;
color: #888;
}
</style>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	$("#gongji_alert").addClass("active");
	listPage(1);
	
	$("ul.gongji_Tabs li").click(function(){
		tab = $(this).attr("data-tab");
		
		$("ul.gongji_Tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#gongji_"+tab).addClass("active");
		
		listPage(1);
	});
});

function listPage(page){
	var $tab = $(".gongji_Tabs .active");
	var tab = $tab.attr("data-tab");
	var url = "<%=cp%>/gongji/"+tab+"/list";
	
	var query="pageNo="+page;
	var search=$('form[name=gongjiSearchForm]').serialize();
	query = query+"&"+search;
	
	ajaxHTML(url, "get", query);
}

function ajaxHTML(url, type, query){
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data){
			if($.trim(data)=="error"){
				listPage(1);
				return;
			}
			$("#TabsOpenArea").html(data);
		}
	,beforeSend : function(jqXHR){
		jqXHR.setRequestHead
	}
	});
}

</script>
<div id="gongji_Container">
	<div id="gongji_Contents">
		<ul class="gongji_Tabs">
			<li id="gongji_alert" data-tab="alert" class="active"><a>공지사항</a></li>
			<li id="gongji_event" data-tab="event"><a>이벤트</a></li>
		</ul>
		<div id="TabsOpenArea">
			<div class="TabsConts">
				<div class="gongji_list">
					<ul>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다1.
							<i>2018/01/01</i>
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<i class="gongji_date">
									</i>
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다2.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다3.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다4.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다5.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다6.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다7.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다8.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다9.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="title">
							<strong>[공지/이벤트]</strong>
							제목입니다10.
							</p>
							<ul class="gongji_conts">
								<li class="gongji_question">
									<p class="gongji_text">
									</p>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="pageing"></div>
			<form name="gongjiSearchForm" action method="post">
				<input type="hidden" name="searchKey" value="subject">
				<input type="hidden" name="searchValue" value>
			</form>
		</div>
	</div>
</div>