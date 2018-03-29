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

.divTd {
	display: table;
	height: 100px; 
	margin: 10px;
	font-size: 15px;
}

.divTd p {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
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
	/* width: 100px; */
	/* height: 100px; */
}

.product_name {
	float: left;
	padding: 15px;
	/* width: 400px; */
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

#sample6_address {
	width: 500px;
	height: 30px;
}

#sample6_address2 {
	width: 500px;
	height: 30px;
}

</style>

<script>

$(document).ready(function() {
	
	allPrice(); //총 상품금액 결정
	shipment(); //배송비 결정
	finalPrice(); //총결제금액 결정
	
	$("#check_name").change(function(){
	
		//'주문자정보와 동일' 체크박스 클릭시
		if($("#check_name").is(":checked")){
			var userName = $("#userName").val();
			$("#name_new").val(userName);
			//console.log(userName);
		}else{
			$("#name_new").val("");
		}
	});
	
	//배송메시지 직접입력
	$("#deliveryMemoSel").change(function(){
		
		if($("#deliveryMemoSel").val("99")){
			//console.log($(this).val());
			$("input[name=deliveryMemo]").attr("style", "display:block");
			$("input[name=deliveryMemo]").attr("style", "width:350px");
		}
		
	});
	
});

//상품 총가격 계산
function allPrice() {

	var dataCount = $("#dataCount").val();
	var allPrice = "";
	allPrice = Number(allPrice);
	var totalPrice = new Array(dataCount);
	
	$('.totalPrice').each(function (index, item) {
		totalPrice[index] = $(item).text();
		allPrice += Number(totalPrice[index]);
	});

	//console.log(allPrice);
	$("#allPrice").text(allPrice);
}

//배송비 설정
function shipment() {
	var allPrice = $("#allPrice").text();
	//3만원이상 구매시 배송비 무료
	if(Number(allPrice) >= 30000 || Number(allPrice) == 0){
		$("#shipPrice").text("0");
	}else{
		$("#shipPrice").text("2500");
	}
}

//총결제 금액 설정
function finalPrice() {
	var allPrice = $("#allPrice").text();
	var shipPrice = $("#shipPrice").text();
	var finalPrice = Number(allPrice) + Number(shipPrice);
	$("#finalPrice").text(finalPrice);
}

//결제하기 버튼 클릭시
/* function order() {
	

} */


</script>


<div class="body-container">

	<form name="orderForm" id="orderForm" action="">
	
		<h3 class="sub-title product-info">배송상품</h3>
		
		<!-- 배송상품정보 테이블 -->
		<table class="table table-condensed product-info">
			<tbody>
				<tr>
					<th scope="row" class="product_th" style="width: 600px;">
						<p class="txt_th">상품정보</p>
					</th>
					<th scope="row" class="product_th" style="width: 100px;">
						<p class="txt_th">판매가</p>
					</th>
					<th scope="row" class="product_th" style="width: 100px;">
						<p class="txt_th">수량</p>
					</th>
					<th scope="row" class="product_th" style="width: 100px;">
						<p class="txt_th">구매가</p>
					</th>
				</tr>
				<c:forEach var="dto" items="${listOrder }">
				<tr>
					<td>
						<div class="product_info_float" style="width: 600px;">
							<div class="product_img">
								<img src="<%=cp%>/resource/img/store/dog_snack1.jpg" 
								style="width: 100px;">
							</div>
							<div class="product_name">
								<p class="pTxt1">${dto.brand }</p>
								<p class="pTxt1">${dto.productName }</p>
								<p class="pTxt1">${dto.note }</p>
							</div>
						</div>
					</td>
					<td>
						<div class="divTd" style="width: 100px;">
							<p class="pTxt2">${dto.orderPrice }원</p>
						</div>
					</td>
					<td>
						<div class="divTd" style="width: 100px;">
							<p class="pTxt2">${dto.orderAmount }개</p>
						</div>
					</td>
					<td>
						<div class="divTd" style="width: 100px;">
							<p class="pTxt2">
								<strong class="totalPrice">${dto.orderPrice }</strong>원
							</p>
							<input type="hidden" id="dataCount" value="${dataCount }">
							<input type="hidden" class="orderId" value="${dto.orderId }">
						</div>
					</td>
				</tr>
				</c:forEach>
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
						<input type="text" id="userName" value="${sessionScope.member.userName}" class="inputTxt"
						style="width: 200px;" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">휴대폰</p></th>
					<td>
						<select id="userTel1" name="userTel1" class="select" disabled="disabled"
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
						<input type="text" id="userTel2" name="userTel2" disabled="disabled"
						value="${tel2 }" class="inputTxt" style="width: 90px;">
						&nbsp;-&nbsp;
						<input type="text" id="userTel3" name="userTel3" disabled="disabled"
						value="${tel3 }" class="inputTxt" style="width: 90px;">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">이메일</p></th>
					<td>
						<input type="text" id="email1" name="email1" disabled="disabled"
						value="${email1 }" class="inputTxt" style="width: 120px;">
						&nbsp;@&nbsp;
						<input type="text" id="email2" name="email2" disabled="disabled"
						value="${email2 }" class="inputTxt" style="width: 120px;">
						<!-- <select id="customerEmailSel" name="customerEmailSel" class="select"
						style="width: 120px;">
							<option disabled="disabled">직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
						</select> -->
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
								<input type="radio" id="radio_new_addr" name="radio_new_addr" checked="checked">
								<label for="new_addr">신규 배송지</label>
							</div>
						</div>
					</td>
				</tr>
				<!-- 기존 배송지 선택시 보이는 테이블 -->
				<!-- 신규 배송지 선택시 보이는 테이블 -->
				<tr type="new">
					<th scope="row"><p class="txt">받는분&nbsp;<p class="star">*</p></p></th>
					<td>
						<div class="addr_info">
							<div class="check_area">
								<input type="text" id="name_new" name="name_new" class="inputTxt" 
								style="width:200px"/>
							</div>
							<div class="check_area">
								<input type="checkbox" id="check_name"/> 
								<label for="label_name">주문자정보와 동일</label>
							</div>
						</div>
					</td>
				</tr>
				<tr type="new">
					<th scope="row"><p class="txt">연락처1&nbsp;<p class="star">*</p></p></th>
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
				<tr type="new">
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
				<tr type="new">
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
			- 실시간 이체 결제 창을 통해 입력되는 고객님의 정보는 128bit로 안전하게 암호화되어 전송되며 
			승인 처리 후 정보는 <br> 승인 성공/ 실패 여부에 상관없이 자동 으로 폐기되므로, 안전합니다.<br>
			- 실시간 이체 결제 신청시 승인 진행에 다소 시간이 소요될 수 있으므로 '중지', '새로고침'을 누르지 마시고 결과 화면이 나타 날때까지 기다려 주십시오.<br>
			- 신용카드/ 실시간 이체는 결제 후, 무통장입금은 입금확인 후 배송이 이루어집니다.
		</div>
		
		<br><br><br>
		
		<div class="order_box">
			<h3 class="sub-title order-info">주문 요약</h3>
			
			<table class="table table-condensed order-info-tbl">
				<tr>
					<td><p class="left_txt">총 상품금액</p></td>
					<td>
						<p class="right_txt"><strong id="allPrice">0</strong>원</p>
					</td>
				</tr>
				<tr>
					<td><p class="left_txt">배송비</p></td>
					<td>
						<p class="right_txt"><strong id="shipPrice">0</strong>원</p>
					</td>
				</tr>
				<tr>
					<td><p class="left_txt">쿠폰사용</p></td>
					<td>
						<p class="right_txt"><strong id="couponPrice">0</strong>원</p>
					</td>
				</tr>
				<tr>
					<td><p class="left_txt">마일리지적립금 사용</p></td>
					<td>
						<p class="right_txt"><strong id="mileagePrice">0</strong>원</p>
					</td>
				</tr>
				<tr>
					<td><p class="left_txt">총 결제금액</p></td>
					<td>
						<p class="right_txt"><strong id="finalPrice">0</strong>원</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-default orderBtn"
						onclick="order();">
							결제하기
						</button>
					</td>
				</tr>
			</table>
			
		</div>
	
	</form>
	
</div>

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample6_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
                
                document.getElementById('sample6_address2').focus();

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
