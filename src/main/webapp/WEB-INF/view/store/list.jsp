<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

.sort {
	margin: 30px auto;
	font-size: 15px;
}

.content {
	float: left;
	width: 25%;
	padding: 10px;
}

@media only screen and (max-width: 1000px) {
	.content {
		width: 33.3333%;
	}
}

@media only screen and (max-width: 800px) {
	.content {
		width: 49.9999%;
	}
}

.product-image {
	position: relative;
	width: 100%;
	height: 70%;
}

.product-image img {
	width: 100%;
	height: 100%;
}

.product-brand {
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 15px;
	font-weight: bold;
}

.product-title {
	margin: 5px auto;
	font-size: 15px;
}

.product-price {
	margin: 5px auto;
	font-size: 20px;
}
 
.content div {
	text-align: center;
}
	
.paging {
	clear: both;
	font-size: 23px;
	padding: 20px;
}
	
</style>

<script type="text/javascript">

function searchList() {
	var f = document.searchForm;
	f.submit();
}

function article(productId) {
	var url="${articleUrl}&productId="+productId;
	location.href=url;
}

</script>

<div class="body-container">	

	<div class="list-header">

		<div class="list-title">
			<h3>ALL</h3>
			<hr>
		</div>
		
		<div class="sort">
			<a href="<%=cp%>/store/list?sortField=inputDate&sortMode=desc&categoryId=${categoryId}"> 최근 등록 순  |</a>
			<a href="<%=cp%>/store/list?sortField=allAmount&sortMode=desc&categoryId=${categoryId}">  판매 수량 순  |</a>
			<a href="<%=cp%>/store/list?sortField=sellingPrice&sortMode=desc&categoryId=${categoryId}">  높은 가격 순  |</a>
			<a href="<%=cp%>/store/list?sortField=sellingPrice&sortMode=asc&categoryId=${categoryId}">  낮은 가격 순  |</a>
			<a href="<%=cp%>/store/list?sortField=grade&sortMode=desc&categoryId=${categoryId}">  상품평 순</a>
		</div>

	</div>

	<c:forEach var="dto" items="${list}">
	
		<div class="content section">
	
			<!-- 상품 이미지 -->
			<div class="product-image">
				<a href="javascript:article('${dto.productId}');">
					<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
					<%-- <img src="<%=cp%>/uploads/store/${dto.imageFilename}"> --%>
				</a>
			</div>
			
			<!-- 브랜드명 -->
			<div class="product-brand" onclick="javascript:article('${dto.productId}');">
				<span class="brand">
					${dto.brand}
				</span>
			</div>
			
			<!-- 상품 제목 -->
			<div class="product-title" onclick="javascript:article('${dto.productId}');">
				<span class="productName">
					${dto.productName}
				</span>
			</div>
			
			<!-- 상품 가격 -->
			<div class="product-price">
				<span class="sellingPrice">
					<strong>${dto.sellingPrice}</strong>원
				</span>
			</div>
			
			<!-- new / best / sale 구분 이미지 -->
			<div class="product-icon">
				<img src="<%=cp%>/resource/img/store/new.gif">
			</div>
		</div>
	</c:forEach>
	 
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
        		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/store/list';">새로고침</button>
        		</div>
        		<div style="float: left; width: 60%; text-align: center;">
        		     <form name="searchForm" action="<%=cp%>/store/list" method="post" class="form-inline">
						  <select class="form-control input-sm" name="searchKey" >
						      <option value="productName">제품명</option>
						      <option value="brand">브랜드명</option>
						  </select>
						  <input type="text" class="form-control input-sm input-search" name="searchValue">
						  <button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
						  <span class="glyphicon glyphicon-search"></span> 검색</button>
        		     </form>
        		</div>
        		<%-- 
        		<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
        		    <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/photo/created';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 등록하기</button>
        		</div>
        		 --%>
        </div>
	 
</div>	


	
	
	