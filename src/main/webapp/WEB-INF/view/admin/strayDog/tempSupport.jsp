<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/jqgrid/css/ui.jqgrid.css" />
<script src="<%=cp%>/resource/jqgrid/js/i18n/grid.locale-kr.js"></script>
<script src="<%=cp%>/resource/jqgrid/js/jquery.jqGrid.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#list").jqGrid({
		url: '<%=cp%>/admin/strayDog/tempSupport'
		,datatype: "json"
		,mtype: "get"
		,colNames: ['번호','후원종류','회원여부', '이름', '핸드폰 번호','이메일', '결제방법', '후원금액', '결제일']  // "" : 수정과 삭제 버튼을 위한 공간
	    ,colModel: [
			    	 {name:'supportId',  align:'center', editable:true},
			    	 {name:'merchantreserved2',  align:'center', editable:true},
		             {name:'mem_check', width:40, editable:true, align:'center'},
		             {name:'name', width:40, editable:true, align:'center'},
		             {name:'tel', width:80, editable:true, align:'center'},
		             {name:'email', width:100, editable:true, align:'center'},
		             {name:'pay_method', width:40, editable:true, align:'center'},
		             {name:'pmoney', align:'right', width:60, editable:true},
		             {name:'created', width:40, editable:true, align:'center'}
	                ]
	    ,rowNum:10   // 초기행수
	    ,rowList:[10,20,30]
	    ,width: '1500'
    	,height: '100%'
	    ,pager:"#pagersr"  // 페이징 기능 div의 id 명(class는 불가)
	    ,gridview:true            // 속도가 빠름
	    //,rownumbers: true     // 왼쪽에 리스트 번호 출력
	    ,viewrecords:true       // 총 페이지 현재 페이지등의 정보를 노출
	    ,scrollOffset: 0
	    ,shrinkToFit:true         // 우측스크롤바 위의 조그만 공간 없앰
	    ,emptyrecords:"등록된 데이터가 없습니다."
    	// ,sortname: 'hak'
	    // ,sortorder: 'asc'
    	//,multiselect: true        // 셀렉트박스 적용
	    ,caption: "일시 후원 목록"
    	,loadonce: false          // reload 여부
	    ,jsonReader : {           // json 형식
	        root: "rows", 
	        page: "page", 
	        total: "total_page", 
	        records: "dataCount", 
	        repeatitems: false, 
	        id: "supportId"     // id(기본키)
	     }
   		,loadError:function(xhr,status,error){
	    	alert("실패>>"+error);
   		}
	});

    //-------------------------------------------------------------
	$("#list").jqGrid('setFrozenColumns');
    $("#list").trigger('reloadGrid');
             // Frozen Columns(틀 고정), colModel option에 frozen:true 적용해야함
             // cellEdit, sortName, sortable 옵션과 사용불가
	
    //-------------------------------------------------------------
	// 마지막 부분의 페이징처리 왼쪽의 추가, 수정등의 버튼
   
    $("#list").jqGrid('navGrid', '#pagersr'
            ,{ excel:true,view:false,search:true,refresh:true}
            ,{  // Search Option
         		  multipleSearch:false, multipleGroup:false, showQuery: false,
                  closeOnEscape:true, 
                  onSearch:function(){  
                	  $("#list").setGridParam({
                	        url:'<%=cp%>/admin/strayDog/tempSupport',
                	        datatype:'json',
                	        page:1,
                	        postData:{ 
                	             searchField:$(".columns").find("option:selected").val()
                	             //,searchType:$(".selectopts").find("option:selected").val()
                	             ,searchValue:$("td.data").find(".input-elm").val()
                	        }
                	  }).trigger("reloadGrid");
                  }
         	  }
         	  ,{  // View Parameter
         		  closeOnEscape:true
         	  }               
       );
});

</script>
<div class="admin-container">
 <table id="list"></table>
  <div id="pagersr"></div>
</div>