<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

table {
	width: 800px;
	/* border-bottom: 1px solid #e2e2e2; */
	/* margin-bottom: 100px; */
}

.productCreated{
	margin-bottom: 100px;
}

tr {
	height: 40px;
}

th {
	background-color: #fafafa;
	width: 200px;
}

.thTxt {
	font-size: 15px;
}

.tdTxt {
	font-size: 13px;
}

.divTh {
	display: table;
	margin: 10px;
	font-size: 15px;
}

.divTh p {
	display: table-cell;
	vertical-align: middle;
}

.divTd {
	display: table;
	margin: 10px;
	/* height는 각자 태그에 맞게 */
}

.divTd p {
	/* font-size: 15px; */
	display: table-cell;
	vertical-align: middle;
}

.inputTxt {
	border-radius: 5px;
	border: 1px solid #808080;
	height: 25px;
	padding: 5px;
	margin: 10px;
}

.select {
	border-radius: 5px;
	height: 30px;
	margin: 5px;
}

</style>

<script>
$(document).ready(function(){
	var i = 1;
	$("#optAddBtn").click(function() {
		optionAdd(i);
		i++;
	});
	
});


//옵션 추가
function optionAdd(i){
	
	var str = "";
	
	console.log(i);
	str += "<div class='divTd' id='optionDiv"+i+"' style='clear: both;'>";
	str += "<input type='text' id='optionList"+i+"' name='optionList'";
	str += " class='inputTxt' style='width:300px'/>";
	str += "<button type='button' class='btn btn-default delOptionBtn' onclick='deleteOption("+i+")'>X</button>";
	str += "</div>";
	
	$("#optionAddArea").append(str);
	
}

//옵션 삭제
function deleteOption(num) {
	$("#optionDiv" + num).remove(); //옵션삭제
}

function check() {
    var f = document.productCreatedForm;

	var str = f.productName.value;
    if(!str) {
        f.productName.focus();
        return false;
    }

	str = f.brand.value;
    if(!str) {
        f.brand.focus();
        return false;
    }

    var mode="${mode}";
	if(mode=="created" && f.upload.value!="") {
		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
			alert('이미지 파일만 가능합니다. !!!');
			f.upload.focus();
			return false;
		}
	}
    
	if(mode=="insert")
		f.action="<%=cp%>/admin/store/insertProduct";
	<%-- else if(mode=="update")
		f.action="<%=cp%>/admin/store/updateProduct"; --%>

	// <input type='submit' ..>,  <input type='image' ..>, <button>은 submit() 메소드 호출하면 두번전송
    return true;
}

</script>

<div class="body-container">

	<h3 class="sub-title product-info">상품 등록</h3>

	<form name="productCreatedForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
		<table class="table table-condensed productCreated" id="createTable">
			<tbody>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">상품명</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<input type="text" id="productName" name="productName" 
							class="inputTxt" style="width:300px"/>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">브랜드명</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<input type="text" id="brand" name="brand" 
							class="inputTxt" style="width:300px"/>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">판매가격</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<input type="text" id="sellingPrice" name="sellingPrice" 
							class="inputTxt" style="width:150px"/>원
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">입고가격</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<input type="text" id="inputPrice" name="inputPrice" 
							class="inputTxt" style="width:150px"/>원
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">입고수량</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<input type="text" id="inputAmount" name="inputAmount" 
							class="inputTxt" style="width:150px"/>
						</div>
					</td>
				</tr>
				<tr style="border-bottom-color: #000000;">
					<th>
						<div class="divTh">
							<p class="thTxt">옵션</p>
						</div>
					</th>
					<td>
						<div class="divTd" style="float: left;">
							<input type="text" id="optionList0" name="optionList" 
							class="inputTxt" style="width:300px"/>
						</div>
						<div class="divTd" style="float: left;">
							<button type="button" class="btn btn-default roundBtn" id="optAddBtn">
								<span>옵션추가</span>
							</button>
						</div>
						<div id="optionAddArea"></div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">분류</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<select id="categoryId" name="categoryId" class="select" style="width:350px">
								<option value="">분류를 선택해주세요.</option>
								<option value="1">사료&간식</option>
								<option value="2">목욕&위생용품</option>
								<option value="3">식기&하우스</option>
								<option value="4">외출&패션</option>
								<option value="5">장난감</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">상품이미지</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<input type="file" id="upload" name="upload" />
						</div>
					</td>
				</tr>
			</tbody>
			<tfoot>
                 <tr>
                     <td colspan="4" style="text-align: center; padding-top: 15px;">
                           <button type="submit" class="btn btn-primary"> 
                           	확인 <span class="glyphicon glyphicon-ok"></span></button>
                           <button type="button" class="btn btn-danger" 
                           	onclick="javascript:location.href='<%=cp%>/admin/store/list';"> 
                           	취소 
                           	</button>
                           
                          <%--  <c:if test="${mode=='update'}">
                               <input type="hidden" name="productId" value="${dto.productId}">
                               <input type="hidden" name="imageFilename" value="${dto.imageFilename}">
                               <input type="hidden" name="page" value="${page}">
                           </c:if> --%>
                     </td>
                 </tr>
             </tfoot>
		</table>
	</form>
	
</div>