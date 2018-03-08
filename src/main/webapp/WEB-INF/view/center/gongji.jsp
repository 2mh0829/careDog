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

i{
color: #888;
padding-right: 17px;
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
padding: 20px 0 20px 30px;
color: #222;
font-size: 14px;
line-height: 18px;
cursor: pointer;
}

.gongji_list ul li .title strong{
display: inline-block;
width: 140px;
margin-left: 25px;
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

#gongji_created{
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
	var $tab = $("ul.gongji_Tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/center/"+tab+"/list";
	
	var query="pageNo="+page;
	var search=$('form[name=centerSearchForm]').serialize();
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


		<div id="TabsOpenArea">
			<div class="TabsConts">
				<div class="gongji_list">
					<ul>
						<c:forEach var="dto" items="${list }">
						<li>
							<p class="title">
							<i>${dto.num }</i>
							<strong>${dto.isGongji }</strong>
							${dto.subject }
							<i id="gongji_created">${dto.created }</i>
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
						</c:forEach>	
					</ul>
				</div>
			</div>
			<div class="paging">
				<c:if test="${dataCount==0 }">
				등록된 게시물이 없습니다.
				</c:if>
				<c:if test="${dataCount!=0 }">
				${paging }
				</c:if>
			</div>
		</div>
