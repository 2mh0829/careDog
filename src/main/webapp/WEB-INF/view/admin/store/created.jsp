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
	border-bottom: 1px solid #e2e2e2;
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

<div class="body-container">

	<form name="productCreatedForm" id="productCreatedForm" action="">
	<h3 class="sub-title product-info">상품 등록</h3>

		<table class="table table-condensed productCreated">
			<tbody>
				<!-- <tr>
					<th scope="row"><p class="txt">배송지 선택</p></th>
					<td>
						<div class="addr_info">
							<div class="check_area">
								<input type="radio" id="radio_old_addr" name="radio_old_addr">
								<label for="old_addr">기존 배송지</label>
							</div>
							<div class="check_area">
								<input type="radio" id="radio_new_addr" name="radio_new_addr" checked="checked">
								<label for="new_addr">신규 배송지</label>
							</div>
						</div>
					</td>
				</tr> -->
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
							<p class="thTxt">판매가</p>
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
							<p class="thTxt">수량</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<input type="text" id="amount" name="amount" 
							class="inputTxt" style="width:150px"/>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="divTh">
							<p class="thTxt">옵션</p>
						</div>
					</th>
					<td>
						<div class="divTd" style="float: left;">
							<input type="text" id="option" name="option" 
							class="inputTxt" style="width:300px"/>
						</div>
						<div class="divTd" style="float: left;">
							<button type="button" class="btn btn-default roundBtn" id="optAddBtn"
							onclick="optionAdd();">
								<span>옵션추가</span>
							</button>
						</div>
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
							<select id="categorySel" class="select" style="width:350px">
								<option value="">분류를 선택해주세요.</option>
								<option value="10">사료&간식</option>
								<option value="20">목욕&위생용품</option>
								<option value="30">식기&하우스</option>
								<option value="40">외출&패션</option>
								<option value="50">장난감</option>
							</select>
						</div>
					</td>
				</tr>
				<!-- 단종여부는 상품 수정할때 -->
				<!-- <tr>
					<th>
						<div class="divTh">
							<p class="thTxt">단종여부</p>
						</div>
					</th>
					<td>
						<div class="divTd">
							<select id="categorySel" class="select" style="width:350px">
								<option value="">분류를 선택해주세요.</option>
								<option value="10">단종안됨</option>
								<option value="20">단종됨</option>
							</select>
						</div>
					</td>
				</tr> -->
				
				<%-- <tr>
					<th><p class="txt">연락처1&nbsp;<p class="star">*</p></p></th>
					<td>
						<select id="tel1" name="tel1" class="select" disabled="disabled"
						style="width: 90px;">
							<option disabled="disabled">선택</option>
							<option value="010" ${tel1 == 010 ? "selected":"" }>010</option>
							<option value="011" ${tel1 == 011 ? "selected":"" }>011</option>
							<option value="016" ${tel1 == 016 ? "selected":"" }>016</option>
							<option value="017" ${tel1 == 017 ? "selected":"" }>017</option>
							<option value="018" ${tel1 == 018 ? "selected":"" }>018</option>
							<option value="019" ${tel1 == 019 ? "selected":"" }>019</option>
						</select>
						&nbsp;-&nbsp;
						<input type="text" id="tel2" name="tel2" disabled="disabled"
						value="${tel2 }" class="inputTxt" style="width: 90px;">
						&nbsp;-&nbsp;
						<input type="text" id="tel3" name="tel3" disabled="disabled"
						value="${tel3 }" class="inputTxt" style="width: 90px;">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">연락처2</p></th>
					<td>
						<select id="tel1_new" name="tel1_new" class="select"
						style="width: 90px;">
							<option selected="selected" disabled="disabled">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="02">02</option>
						</select>
						&nbsp;-&nbsp;
						<input type="text" id="tel2_new" name="tel2_new"
						value="" class="inputTxt" style="width: 90px;">
						&nbsp;-&nbsp;
						<input type="text" id="tel3_new" name="tel3_new"
						value="" class="inputTxt" style="width: 90px;">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">주소&nbsp;<p class="star">*</p></p></th>
					<td>
						<div class="addr_info">
							<div class="postNo_info">
								<input type="text" class="inputTxt" style="width:90px" readonly="readonly"
								id="sample6_postcode" name="zipcode" value="${sessionScope.member.zipCode}"/>
								<button type="button" class="btn btn-default roundBtn" id="search-zipcode"
								onclick="sample6_execDaumPostcode()">
									<span>우편번호 찾기</span>
								</button>
							</div>
							
							<!-- 다음 주소 찾기 div -->						
							<div id="wrap" style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
								<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
									id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
									onclick="foldDaumPostcode()" alt="접기 버튼">
							</div> 
							
							<div class="addr_box">
								<!-- <span class="txt_tit">도로명</span> : 
								<span class="txt_addr" id="postAddr_new"></span>
								<span class="txt_tit">지번</span> : 
								<span class="txt_addr" id="baseAddr_new"></span> -->
								<input type="text" id="sample6_address" name="addr1" class="inputTxt"
								value="${sessionScope.member.address1}" class="full mb" placeholder="주소">
								<input type="text" id="sample6_address2" style="ime-mode:active" name="addr2" class="inputTxt"
								value="${sessionScope.member.address2}" class="full mb" placeholder="상세주소">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">택배배송 메시지</p></th>
					<td>
						<select id="deliveryMemoSel" class="select" style="width:350px">
							<option value="">배송메시지를 선택해주세요.</option>
							<option value="10">부재시 경비실에 맡겨주세요.</option>
							<option value="20">부재시 문앞에 놓아주세요.</option>
							<option value="30">파손의 위험이 있는 상품이오니,  배송 시 주의해주세요.</option>
							<option value="40">배송전에 연락주세요.</option>
							<option value="50">택배함에 넣어주세요.</option>
							<option value="99">배송 메시지 직접입력</option>
						</select>
						<input type="text" name="deliveryMemo" class="inputTxt" style="display: none;"/>
					</td>
				</tr> --%>
			</tbody>
		</table>
	</form>
	
</div>