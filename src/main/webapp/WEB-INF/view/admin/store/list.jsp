<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

.table th, .table td {
    font-weight: normal;
    border-top: none;
}
.table thead tr th{
     border-bottom: none;
} 
.table thead tr{
    border: #d5d5d5 solid 1px;
     background: #eeeeee; color: #787878;
} 
.table td {
    border-bottom: #d5d5d5 solid 1px;
}
.table td a{
    color: #000;
}

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

</style>


<script type="text/javascript">

$(document).ready(function(){
	
	//최상단 체크박스 클릭
    $("#checkAll").click(function(){
        //클릭되었으면
        if($("#checkAll").prop("checked")){
            //input태그의 name이 check인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
        //클릭이 안되있으면
        }else{
            //input태그의 name이 check인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
    
});


function searchList() {
	var f = document.searchForm;
	f.submit();
}

function article(productId) {
	var url="${articleUrl}&productId="+productId;
	location.href=url;
}

function deleteProduct(productId, optionId) {
	var page = "${page}";
	//var query = "${query}";
	//var data = "productId="+productId+"&page="+page+"&query="+query;
	var data = "productId="+productId+"&page="+page;
	var url = "<%=cp%>/admin/store/deleteProduct?" + data;
	
	if(confirm("위 상품을 삭제 하시 겠습니까 ?"))
		location.href=url;
}

</script>


<div class="admin-container">

	<div class="product-title">
	  상품 리스트
	</div>
	
	<div class="product-body-container">
	
		 <div class="list-table">
            <table class="table table-condensed product-list" style="width: 1490px;">
                <thead>
                    <tr>
                    	<th class="text-center" style="width: 50px;">
							<input type="checkbox" id="checkAll">
                    	</th>
                        <th class="text-center" style="width: 50px;">번호</th>
                        <th class="text-center" style="width: 200px;">상품명</th>
                        <th class="text-center" style="width: 200px;">브랜드명</th>
                        <th class="text-center" style="width: 150px;">분류</th>
                        <th class="text-center" style="width: 70px;">판매가</th>
                        <th class="text-center" style="width: 100px;">입고가격</th>
                        <th class="text-center" style="width: 80px;">재고수량</th>
                        <th class="text-center" style="width: 100px;">입고수량</th>
                        <th class="text-center" style="width: 100px;">입고일</th>
                        <th class="text-center" style="width: 100px;">유통기한</th>
                        <th class="text-center" style="width: 100px;">비고</th>
                    </tr>
                </thead>
                <tbody>
    <c:forEach var="dto" items="${list}">
                    <tr>
                    	<td class="text-center">
							<input type="checkbox" name="check" id="check${dto.productId }" value="${dto.productId }" >
                    	</td>
                        <td class="text-center">${dto.listNum}</td>
                        <td class="text-center">
                        	<a href="javascript:article('${dto.productId}');">${dto.productName}</a>
                        </td>
                        <td class="text-center">${dto.brand}</td>
                        <td class="text-center">${dto.categoryName}</td>
                        <td class="text-center">${dto.sellingPrice}</td>
                        <td class="text-center">${dto.inputPrice}</td>
                        <td class="text-center">${dto.amount}</td>
                        <td class="text-center">${dto.inputAmount}</td>
                        <td class="text-center">${dto.inputDate}</td>
                        <td class="text-center">${dto.expireDate}</td>
                        <td class="text-center">
                        	<button type="button" class="btn btn-primary btn-sm bbtn" 
        		    		onclick="deleteProduct(${dto.productId});">
        		    			<span>삭제</span>
        		    		</button>
                        </td>
                    </tr>
     </c:forEach>                    
                </tbody>
            </table>
        </div>
        
        <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
            <c:if test="${dataCount==0 }">
                  등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
                ${paging}
            </c:if>
        </div>        
        
        <div style="clear: both;">
        		<div style="float: left; width: 20%; min-width: 85px;">
        		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/admin/store/list';">새로고침</button>
        		</div>
        		<div style="float: left; width: 60%; text-align: center;">
        		     <form name="searchForm" action="<%=cp%>/admin/store/list" method="post" class="form-inline">
						  <select class="form-control input-sm" name="searchKey" >
						      <option value="productName">제품명</option>
						      <option value="brand">브랜드명</option>
						  </select>
						  <input type="text" class="form-control input-sm input-search" name="searchValue">
						  <button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
						  <span class="glyphicon glyphicon-search"></span> 검색</button>
        		     </form>
        		</div>
        		<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
        		    <button type="button" class="btn btn-primary btn-sm bbtn" 
        		    onclick="javascript:location.href='<%=cp%>/admin/store/insertProduct';">
        		    	<span class="glyphicon glyphicon glyphicon-pencil">등록하기</span>
        		    </button>
        		</div>
        </div>
        
    </div>
    
</div>




