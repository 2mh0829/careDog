<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/jqgrid/css/ui.jqgrid.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script src="<%=cp%>/resource/jqgrid/js/jquery.jqGrid.min.js"></script>

<script type="text/javascript">
$(function(){
	$.ajax({
		url:'<%=cp%>/admin/dog119/fixSupport',
		dataType:'json',
		success:function(data){
			console.log(data);
	        var list = data.list;
	         
	        //jqGrid껍데기 생성
	        $("#list").jqGrid({
	            data: list, //인풋 데이타
	            datatype: 'json',
	           	mtype:'GET',
	           	contentType: 'application/json; charset=utf-8',
	           	width:1000,
	            //그리드 높이
	            height: 250,
	            //컬럼명들
	            colNames:['고유번호','후원종류', '이름', '번호','이메일', '결제방법', '후원금액', '시작일', '종료일', '우편번호', '주소'],
	            //컬럼모델
	            colModel:[
	                {name:'supportId'},
	                {name:'prodname'},
	                {name:'pname'},
	                {name:'tel'},
	                {name:'email'},
	                {name:'paymode'},
	                {name:'pmoney'},
	                {name:'s_date'},
	                {name:'e_date'},
	                {name:'zipCode'},
	                {name:'address1'}   
	            ],
	            
	            //그리드타이틀
	            caption: "정기 후원 목록"
	        });
	         
	        // 스크립트 변수에 담겨있는 json데이터의 길이만큼 
	        for(var i=0;i<=list.length;i++){
	                //jqgrid의 addRowData를 이용하여 각각의 row에 gridData변수의 데이터를 add한다
	                $("#list").jqGrid('addRowData',i+1,list[i]);
	        } 
		}
	});
		
})


</script>
<div class="body-container">
   <table id="list"></table>
</div>