<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

tr {
	height: 50px;
}

th {
	background-color: #fafafa;
}

.txt {
	float: left;
	margin: 10px;
	font-size: 15px;
}

.txt_th {
	margin: 10px;
	font-size: 15px;
}


.inputTxt {
	/* margin-top: 10px;
	margin-bottom: 10px; */
	margin: 10px;
}

.select {
	margin: 10px;
}

.check_area {
	float: left;
	padding-left: 10px;
	padding-right: 10px;
}

.addr_box {
	margin: 10px;
	border: 1px solid #808080;
	border-radius: 5px;
	padding: 10px;
}

.roundBtn {
	border-radius: 30px;
	width: 130px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
}

.inputTxt {
	border-radius: 5px;
	border: 1px solid #808080;
	height: 25px;
	padding: 5px;
}

.addr_info {
	padding: 10px;
}

.select {
	border-radius: 5px;
	height: 25px;
}

.product_img {
	float: left;
	margin: 10px;
	width: 200px;
	/* height: 100px; */
}

.product_name {
	float: left;
	padding: 15px;
	width: 400px;
}

.pTxt1 {
	font-size: 15px;
	font-weight: bold;
}

.pTxt2 {
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	margin: 15px;
}

.product_th {
	text-align: center;
}

.star {
	float: left;
	color: red;
	font-size: 20px;
}

.payBtn {
	font-size: 15px;
	text-align: center;
	width: 200px;
	height: 40px;
}

.pay_btn_area {
	margin: 15px 0px;
}

.pay_info {
	margin: 15px 0px;
	font-size: 15px;
}

.left_txt {
	text-align: left;
	margin: 10px;
	font-size: 15px;
}

.right_txt {
	text-align: right;
	margin: 10px;
	font-size: 15px;
}

.orderBtn {
	font-size: 15px;
	text-align: center;
	width: 100%;
	height: 40px;
	margin: 15px 0px;
}

.order_box {
	background-color: #fafafa;
	padding: 15px;
}

.order-info {
	margin: 15px;
}

</style>


<div class="body-container">

	<form name="orderForm" id="orderForm" action="">
	
		<h3 class="sub-title product-info">배송상품</h3>
		
		<!-- 배송상품정보 테이블 -->
		<table class="table table-condensed product-info">
			<tbody>
				<tr>
					<th scope="row" class="product_th" style="width: 70%;">
						<p class="txt_th">상품정보</p>
					</th>
					<th scope="row" class="product_th" style="width: 10%;">
						<p class="txt_th">판매가</p>
					</th>
					<th scope="row" class="product_th" style="width: 10%;">
						<p class="txt_th">수량</p>
					</th>
					<th scope="row" class="product_th" style="width: 10%;">
						<p class="txt_th">구매가</p>
					</th>
				</tr>
				<tr>
					<td>
						<div class="product_info_float">
							<div class="product_img">
								<img src="<%=cp%>/resource/img/store/dog_snack1.jpg" 
								style="width: 100px;">
							</div>
							<div class="product_name">
								<p class="pTxt1">서울우유</p>
								<p class="pTxt1">[서울우유] 아이펫밀크 180ml x 10ea</p>
								<p class="pTxt1">옵션 : 180ml x 10ea</p>
							</div>
						</div>
					</td>
					<td>
						<div>
							<p class="pTxt2">30,000원</p>
						</div>
					</td>
					<td>
						<div>
							<p class="pTxt2">1</p>
						</div>
					</td>
					<td>
						<div>
							<p class="pTxt2">16,800원</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<br><br><br>
	
		<h3 class="sub-title customer-info">주문자 정보</h3>
		
		<!-- 주문자정보 테이블 -->
		<table class="table table-condensed customer-info">
			<tbody>
				<tr>
					<th scope="row"><p class="txt">주문자명</p></th>
					<td>
						<input type="text" id="customerName" value="권찬미" class="inputTxt"
						style="width: 200px;">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">휴대폰</p></th>
					<td>
						<select id="customerPhoneSel" name="customerPhone" class="select"
						style="width: 90px;">
							<option selected="selected">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						&nbsp;-&nbsp;
						<input type="text" id="customerPhoneTxt1" name="customerPhoneTxt1"
						value="1111" class="inputTxt" style="width: 90px;">
						&nbsp;-&nbsp;
						<input type="text" id="customerPhoneTxt2" name="customerPhoneTxt2"
						value="1111" class="inputTxt" style="width: 90px;">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">이메일</p></th>
					<td>
						<input type="text" id="customerEmailTxt1" name="customerEmailTxt1"
						value="chanmi123" class="inputTxt" style="width: 120px;">
						&nbsp;@&nbsp;
						<input type="text" id="customerEmailTxt2" name="customerEmailTxt2"
						value="naver.com" class="inputTxt" style="width: 120px;">
						<select id="customerEmailSel" name="customerEmailSel" class="select"
						style="width: 120px;">
							<option selected="selected">직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		
		<br><br><br>
		
		<h3 class="sub-title delivery-info">배송지 정보</h3>
		
		<!-- 배송지정보 테이블 -->
		<table class="table table-condensed delivery-info">
			<tbody>
				<tr>
					<th scope="row"><p class="txt">배송지 선택</p></th>
					<td>
						<div class="addr_info">
							<div class="check_area">
								<input type="radio" id="radio_old_addr" name="radio_old_addr">
								<label for="old_addr">기존 배송지</label>
							</div>
							<div class="check_area">
								<input type="radio" id="radio_new_addr" name="radio_new_addr">
								<label for="new_addr">신규 배송지</label>
							</div>
						</div>
					</td>
				</tr>
				<!-- 기존 배송지 선택시 보이는 테이블 -->
				<!-- 신규 배송지 선택시 보이는 테이블 -->
				<tr type="new">
					<th scope="row"><p class="txt">배송지명&nbsp;<p class="star">*</p></p></th>
					<td>
						<div class="addr_info">
							<input type="text" id="addr_name_new" name="addr_name_new" value="" class="inputTxt" 
							style="width:200px;"/>
						</div>
					</td>
				</tr>
				<tr type="new">
					<th scope="row"><p class="txt">받는분&nbsp;<p class="star">*</p></p></th>
					<td>
						<div class="addr_info">
							<div class="check_area">
								<input type="text" id="customer_name_new" name="customer_name_new" value="" class="inputTxt" 
								style="width:200px"/>
							</div>
							<div class="check_area">
								<input type="checkbox" id="check_name_new"/> 
								<label for="copy_name_new">주문자정보와 동일</label>
							</div>
						</div>
					</td>
				</tr>
				<tr type="new">
					<th scope="row"><p class="txt">연락처1&nbsp;<p class="star">*</p></p></th>
					<td>
						<select id="customerPhoneSel_new" name="customerPhone_new" class="select"
						style="width: 90px;">
							<option selected="selected">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						&nbsp;-&nbsp;
						<input type="text" id="customerPhoneTxt1_new" name="customerPhoneTxt1_new"
						value="" class="inputTxt" style="width: 90px;">
						&nbsp;-&nbsp;
						<input type="text" id="customerPhoneTxt2_new" name="customerPhoneTxt2_new"
						value="" class="inputTxt" style="width: 90px;">
					</td>
				</tr>
				<tr type="new">
					<th scope="row"><p class="txt">연락처2</p></th>
					<td>
						<select id="customerTelSel_new" name="customerTel_new" class="select"
						style="width: 90px;">
							<option selected="selected">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="02">02</option>
						</select>
						&nbsp;-&nbsp;
						<input type="text" id="customerTelTxt1_new" name="customerTelTxt1_new"
						value="" class="inputTxt" style="width: 90px;">
						&nbsp;-&nbsp;
						<input type="text" id="customerTelTxt2_new" name="customerTelTxt2_new"
						value="" class="inputTxt" style="width: 90px;">
					</td>
				</tr>
				<tr type="new">
					<th scope="row"><p class="txt">주소&nbsp;<p class="star">*</p></p></th>
					<td>
						<div class="addr_info">
							<input type="text" id="postNo_new" name="postNo_new" value="" class="inputTxt" 
							style="width:90px" readonly="readonly"/>
							<input type="hidden" value=""/>
							<button type="button" class="btn btn-default roundBtn" id="search-zipcode-pop_new">
								<span>우편번호 찾기</span>
							</button>
							<div class="addr_box">
								<input type="hidden" value="" class="inputTxt" readonly="readonly"/>
								<input type="hidden" value="" class="inputTxt" readonly="readonly"/>
								<!-- 주소 입력 시 보여지는 부분 -->
								<p class="addr_new">
									<span class="txt_tit">도로명</span> : 
									<span class="txt_addr" id="postAddr_new"></span>
								</p>
								<p class="addr_old">
									<span class="txt_tit">지번</span> : 
									<span class="txt_addr" id="baseAddr_new"></span>
								</p>
							</div>
							<input type="text" id="detail_addr_new" value="" class="inputTxt" 
							style="width:500px; display: none;"/>
							<input type="hidden" value="" class="inputTxt" style="width:500px"/>
							<input type="hidden" value="" class="inputTxt" style="width:500px"/>
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
						<input type="text" name="deliveryMemo" value="" class="inputTxt" style="width:700px; display: none;"/>
					</td>
				</tr>
			</tbody>
		</table>
		
		<br><br><br>
		
		<h3 class="sub-title pay-info">결제수단 선택</h3>
		
		<!-- 결제수단 선택 테이블 -->
		<table class="table table-condensed pay-info">
			<tbody>
				<tr>
					<td>
						<div class="pay_btn_area">
							<button type="button" class="btn btn-default payBtn">
								신용카드
							</button>
							<button type="button" class="btn btn-default payBtn">
								실시간 계좌이체
							</button>
							<button type="button" class="btn btn-default payBtn">
								무통장 입금
							</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="pay_info">
			- 실시간 이체 결제시 화면 아래 '결제하기'버튼을 클릭하시면 실시간 이체 결제 창이 나타납니다.<br>
			- 실시간 이체 결제 창을 통해 입력되는 고객님의 정보는 128bit로 안전하게 암호화되어 전송되며 승인 처리 후 정보는 승인 성공/ 실패 여부에 상관없이 <br> 
			&nbsp;&nbsp;&nbsp;&nbsp;자동 으로 폐기되므로, 안전합니다.<br>
			- 실시간 이체 결제 신청시 승인 진행에 다소 시간이 소요될 수 있으므로 '중지', '새로고침'을 누르지 마시고 결과 화면이 나타 날때까지 기다려 주십시오.<br>
			- 신용카드/ 실시간 이체는 결제 후, 무통장입금은 입금확인 후 배송이 이루어집니다.
		</div>
		
		<br><br><br>
		
		<div class="order_box">
			<h3 class="sub-title order-info">주문 요약</h3>
			
			<table class="table table-condensed order-info-tbl">
				<tr>
					<td><p class="left_txt">총 상품금액</p></td>
					<td><p class="right_txt">16,800원</p></td>
				</tr>
				<tr>
					<td><p class="left_txt">배송비</p></td>
					<td><p class="right_txt">0원</p></td>
				</tr>
				<tr>
					<td><p class="left_txt">쿠폰사용</p></td>
					<td><p class="right_txt">0원</p></td>
				</tr>
				<tr>
					<td><p class="left_txt">마일리지적립금 사용</p></td>
					<td><p class="right_txt">0원</p></td>
				</tr>
				<tr>
					<td><p class="left_txt">총 결제금액</p></td>
					<td><p class="right_txt">16,800원</p></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-default orderBtn">
							결제하기
						</button>
					</td>
				</tr>
			</table>
			
		</div>
	
	</form>
	
</div>