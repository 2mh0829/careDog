<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/jqgrid/css/ui.jqgrid.css" />

<style>

/* .admin-container {
	width:1500px;
	height: 700px;
	margin-top: 30px;
	margin-bottom: 100px;
	margin-left: 150px;
	margin-right: auto;
} */

.product-title {
    font-weight: bold;
    font-size:17px;
    margin-bottom:10px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}

.product-body-container {
	clear:both;
}

.ui-th-column, .ui-jqgrid .ui-jqgrid-htable th.ui-th-column {
/* 타이틀 스타일 */
    font-weight: bold;
    font-size:15px;
    overflow: hidden;
    white-space: nowrap;
    text-align:center;
    border-top : 0px none;
    border-bottom : 0px none;
}
.ui-jqgrid {
/* caption 스타일*/ 
   /* position: relative; 
   font-size:16px;
   height: 30px; */
} 

.ui-jqgrid tr.jqgrow td {
/* 목록 스타일*/ 
   font-size:17px;
   font-weight: normal; 
   overflow: hidden; 
   white-space: pre;
   height: 33px;
   padding: 0 2px 0 2px;
   border-bottom-width: 1px; 
   border-bottom-color: inherit;
   border-bottom-style: solid;
 } 

.ui-jqgrid .ui-pg-table td {
/* 페이징 스타일*/
    font-weight:normal; 
    vertical-align:middle; 
    padding:2px;
    font-size:13px;
    margin: 2px;
}

</style>

<script type="text/javascript" src="<%=cp%>/resource/jqgrid/js/i18n/grid.locale-kr.js"></script>
<script src="<%=cp%>/resource/jqgrid/js/jquery.jqGrid.min.js"></script>

<script type="text/javascript">
$(function(){
	
	var url="<%=cp%>/admin/store/list";
	
	// $("#product-list").jqGrid({}) 에서 데이터를 출력할 테이블(score-list)과 페이징은 id만 가능. class 속성은 불가
	$("#product-list").jqGrid({
		url: url
		,datatype: "json"
		,mtype: "get"
		,colNames: ['상품ID','상품명', '브랜드명', '판매가', '재고수량', '마일리지', 
        	'분류', '옵션', '단종여부', '이미지', '입고일', '입고가격', '입고수량', '유통기한', ""]  // "" : 수정과 삭제 버튼을 위한 공간
	    ,colModel: [
			{name:"productId", index:"productId", width:70, hidden:true, editable:false}
           ,{name:"productName", index:"productName", width:200, align:"center",  editable:true}
           ,{name:"brand", index:"brand", width:150, align:"center",  editable:true}
           ,{name:"sellingPrice", index:"sellingPrice", width:80, align:"center",  editable:true}
           ,{name:"amount", index:"amount", width:70, align:"center",  editable:false}
           ,{name:"mileage", index:"mileage", width:100, align:"center",  editable:false}
           ,{name:"categoryName", index:"categoryName", width:150, align:"center",  editable:true, edittype:"select", editoptions:{value:"1:사료&간식;2:목욕&위생용품;3:식기&하우스;4:외출&패션;5:장난감"}}
           ,{name:"optionContent", index:"optionContent", width:200, align:"center",  editable:true}
           ,{name:"isContinued", index:"isContinued", width:70, align:"center",  editable:false}
           ,{name:"imageFileName", index:"imageFileName", width:70, align:"center", hidden:true, editable:true, formatter:'imageFormatter'}
           ,{name:"inputDate", index:"inputDate", width:130, align:"center",  editable:false}
           ,{name:"inputPrice", index:"inputPrice", width:100, align:"center",  editable:true}
           ,{name:"inputAmount", index:"inputAmount", width:70, align:"center",  editable:true}
           ,{name:"expireDate", index:"expireDate", width:130, align:"center",  editable:false}
           ,{name: 'myAction', width:60, search:false, fixed:true, sortable:false, resizable:true,
                  formatter:'actions',
                  formatoptions:{keys:true,
                     editOptions: {mtype:'POST', reloadAfterSubmit:true}, 
                     delOptions: {mtype:'POST', reloadAfterSubmit:true ,url:"<%=cp%>/admin/store/deleteProduct"}
                     }}
           ]
	    ,rowNum:10   // 초기행수
	    ,rowList:[10,20,30]
	    ,width: '1000px'
    	,height: '600px'
	    ,pager:"#grid-pager"  // 페이징 기능 div의 id 명(class는 불가)
	    ,gridview:true            // 속도가 빠름
	    ,rownumbers: true     // 왼쪽에 리스트 번호 출력
	    ,viewrecords:true       // 총 페이지 현재 페이지등의 정보를 노출
	    ,scrollOffset: 0
	    ,shrinkToFit:true         // 우측스크롤바 위의 조그만 공간 없앰
	    ,emptyrecords:"등록된 데이터가 없습니다."
    	// ,sortname: 'hak'
	    // ,sortorder: 'asc'
    	,multiselect: true        // 셀렉트박스 적용
	    ,caption: ""
	    ,editurl:"<%=cp%>/admin/store/updateProduct"    // 수정 url
    	,loadonce: false          // reload 여부
    	/* ,groupingView : {
    		groupField:['categoryName'],  // 기준이 될 컬럼의 이름
            groupColumnShow: [false], // 기준이 된 컬럼으로 그룹핑 후 기준 컬럼 숨김
            //groupText:['{0}({1})'], // {0} = 그룹핑된 셀값 , {1} = 그룹 하위 값들의 갯수
            groupDataSorted: true // 그룹핑된 값들 정렬
         }    */
	    ,jsonReader : {           // json 형식
	        root: "rows", 
	        page: "page", 
	        total: "total_page", 
	        records: "dataCount", 
	        repeatitems: false, 
	        id: "productId"     // id(기본키)
	     }
   		,loadError:function(xhr,status,error){
	    	alert("실패>>"+error);
   		}
	});
	
	$("#product-list").jqGrid('setFrozenColumns');
    $("#product-list").trigger('reloadGrid');
    // Frozen Columns(틀 고정), colModel option에 frozen:true 적용해야함
    // cellEdit, sortName, sortable 옵션과 사용불가
    
 // 마지막 부분의 페이징처리 왼쪽의 추가, 수정등의 버튼
    $("#product-list").jqGrid('navGrid', '#grid-pager'
         ,{ excel:true,add:true,edit:true,view:false,del:true,search:true,refresh:true}
         ,{  // Edit Option
         	  modal:true, mtype:'POST'
               ,url:"<%=cp%>/admin/store/updateProduct"
         	  ,closeAfterEdit:true,reloadAfterSubmit:true,closeOnEscape:true
         	  ,recreateForm: true
              ,beforeInitData: function(response, postdata){
                    cm = $('#product-list').jqGrid('getColProp',"productId"); cm.editable=true;
                    // cm = $('#score-list').jqGrid('getColProp',"num"); cm.hidden=false;
           	  }
        	  } 
         ,{  // Add Option
         	modal:true,mtype:'POST'
             ,url:"<%=cp%>/admin/store/insertProduct"
         	,closeAfterAdd:true, reloadAfterSubmit:true, closeOnEscape:true
         	,recreateForm: true
         	,beforeInitData: function(formId){
                   cm = $('#product-list').jqGrid('getColProp',"productId"); cm.editable=false; // 서버로전송안됨
         	}
             ,beforeSubmit : function(postdata, formid) {
             	var success=true;
             	var message="";
             	
             	if(! postdata.productName) {
             		message="상품명을 입력 하세요.";
             		success=false;
             	}

             	if(! postdata.brand) {
             		message="브랜드를 입력 하세요.";
             		success=false;
             	}
             	
             	if(! postdata.sellingPrice) {
             		message="상품가격을 입력 하세요.";
             		success=false;
             	}
             	
             	if(! postdata.categoryName) {
             		message="분류기준을 입력 하세요.";
             		success=false;
             	}
             	
             	if(! postdata.inputPrice) {
             		message="입고가격을 입력 하세요.";
             		success=false;
             	}
             	
             	if(! postdata.inputAmount) {
             		message="입고수량을 입력 하세요.";
             		success=false;
             	}
             	
             	return[success, message];
             }
             , afterComplete : function (response, postdata, formid) {
             	var result = jQuery.parseJSON(response.responseText).state;
             	if(result=="false")
             		alert("추가 실패 !!!");
             }
                         
      	  } 
         ,{  // Delete Option
         	  modal:true, mtype:'POST'
      		  ,reloadAfterSubmit:true, closeOnEscape:true
      		  ,url:"<%=cp%>/admin/store/deleteProduct"
      	  } 
         ,{  // Search Option
      		  multipleSearch:false, multipleGroup:false, showQuery: false,
               closeOnEscape:true, 
               onSearch:function(){  
             	  $("#product-list").setGridParam({
             	        url:'<%=cp%>/admin/store/list',
             	        datatype:'json',
             	        page:1,
             	        postData:{ 
             	             searchField:$(".columns").find("option:selected").val()
             	             ,searchType:$(".selectopts").find("option:selected").val()
             	             ,searchValue:$("td.data").find(".input-elm").val()
             	        }
             	  }).trigger("reloadGrid");
               }
      	  }
      	  ,{  // View Parameter
      		  closeOnEscape:true
      	  }               
    );
		
})


</script>



<div class="admin-container">
	<div class="product-title">
	  상품 리스트
	</div>
	
	<div class="product-body-container">
    	<table id="product-list"></table>
    	<div id="grid-pager"></div>
    </div>
    
</div>




