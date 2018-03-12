<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="body-container">

<table class="board-write-1s mgT40">
			<caption>1:1 문의 등록</caption>
			<colgroup>
				<col style="width:25%;">
				<col style="width:75%;">
			</colgroup>
			<tbody>
				<form id="cnslRegForm" action="" method="POST" enctype="multipart/form-data"></form>
					<tr>
						<th scope="col"><label for="TypeInquiry">문의유형</label></th>
						<td>
							<select id="cnslLrgCate" title="문의유형 항목을 선택하세요" style="width:192px;">
								<option value="" selected="selected">선택해주세요</option>

		
		
								<option value="40">회원/멤버십</option>
			
		

		
		

		
		

		
		

		
		

		
		
								<option value="10">주문/결제</option>
			
		

		
		

		
		

		
		

		
		

		
		

		
		
								<option value="20">배송</option>
			
		

		
		

		
		
								<option value="30">교환/반품/환불</option>
			
		

		
		

		
		

		
		

		
		
								<option value="60">이벤트</option>
			
		

		
		

		
		

		
		
								<option value="90">기타</option>
			
		

		
		

							</select>
							<select id="cnslMidCate" title="문의유형 항목을 선택하세요" style="width:192px;" disabled="disabled">
								<option value="" selected="selected">선택해주세요</option>
							</select>
							<span class="store_off"><input type="checkbox" id="offLine" name="offlineYn" value="Y"><label for="offLine">오프라인 매장 문의</label></span>
						</td>
					</tr>
					<tr id="cnslGoodsSelect" style="display: none;">
						<th scope="col"><label for="goodsInquiry">문의상품</label></th>
						<td>
							<div class="over" style="width:98%;">
								<div class="input-delete" style="width:84%;">
								
								
									<input type="text" id="goodsInquiry" title="문의상품을 선택해 주세요" placeholder="문의상품을 선택해 주세요" readonly="readonly">
									
									<button type="button" class="ButtonDelete" onclick="javascript:counsel.reg.goodsDel();">삭제</button>
								</div>
								<input type="button" class="ButtonSubmit" onclick="javascript:counsel.reg.openCnslGoodsList('open');return false;" value="문의상품 선택">
								<input type="hidden" id="cnslSeq" value="">
								<input type="hidden" id="goodsYn" value="N">
								<input type="hidden" name="ordNo" value="">
								<input type="hidden" name="goodsNo" value="">
								<input type="hidden" name="goodsSeq" value="">
							</div>
						</td>
					</tr>
					<tr id="recommFaqList" style="display: none;">
						<th scope="col">혹시 이게 궁굼하세요?</th>
						<td>
							<div class="list-customer">
								<ul class="faq_list">
									<li>
										<p class="tit">올리브영 오프라인 매장에 대해 알고 싶어요!</p>
										<ul class="conts">
											<li class="question">
												<p class="pdzero">
													CJmall 주문 시 주문 시 상품정보에 구매 시 지급되는 적립금이 표기되어 있는 경우에만 적립금이 지급됩니다.<br>
													상품 정보에 적립금이 표기되어 있으나 적립금이 부여되지 않은 경우에는 적립금 다운 여부를 확인하시기 바랍니다.
												</p>
											</li>
										</ul>
									</li>
									<li>
										<p class="tit">올리브영은 배송비가 얼마인가요?</p>
										<ul class="conts">
											<li class="question">
												<p class="pdzero">
													CJmall 주문 시 주문 시 상품정보에 구매 시 지급되는 적립금이 표기되어 있는 경우에만 적립금이 지급됩니다.<br>
													상품 정보에 적립금이 표기되어 있으나 적립금이 부여되지 않은 경우에는 적립금 다운 여부를 확인하시기 바랍니다.
												</p>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr class="textarea">
						<th scope="col"><label for="InputTextarea">내용</label></th>
						<td>
							<textarea id="InputTextarea" name="inqCont" cols="5" rows="1" placeholder="문의내용을 입력해주세요.(2000자 이내)" style="width:98%;height:280px;"></textarea>
							<label for="inputFile">
								<button type="button" id="btnFile" class="file">첨부파일</button>
							</label>
							<input type="file" id="inputFile" name="cnslFile" class="btnFileAdd" value="첨부파일" title="첨부파일 선택" style="display:none;">
							<input type="hidden" name="fileName" id="cnslFileName" value="">
							<span id="fileName" class="file" style="display: none;"><span></span><button type="button" id="btnFileDelete" class="ButtonDelete">삭제</button></span>
							<span class="txt">5MB 이하의 이미지 파일 (JPG, PNG, GIF) 1개를 첨부하실 수 있습니다.</span>
						</td>
					</tr>
					<tr class="notice">
						<th scope="col">답변등록 알림(선택)</th>
						<td>
							<ul>
								<li>
									<input type="checkbox" id="NoticeSms" value="Y" name="smsRcvYn" class="chkSmall" checked="checked"><label for="NoticeSms">SMS</label>
									<select title="통신사를 선택하세요" id="rgnNoSelect" class="sms" name="cellSctNo" style="width:122px;" selected="selected">
										<option selected="selected">010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
										<option>0130</option>
										<option>0303</option>
										<option>0502</option>
										<option>0504</option>
										<option>0505</option>
										<option>0506</option>
									</select>
									<input type="hidden" id="cellSctNo" value="010">
									<span class="des">-</span>
									<input type="tel" class="sms" name="cellTxnoNo" value="2251" title="휴대폰 가운데 4자리를 입력하세요" maxlength="4" placeholder="0000" style="width:122px;">
									<span class="des">-</span>
									<input type="tel" class="sms" name="cellEndNo" value="3879" title="휴대폰 마지막 4자리를 입력하세요" maxlength="4" placeholder="0000" style="width:122px;">
								</li>
								<li>
									<input type="checkbox" id="NoticeEmail" name="emailRcvYn" value="Y" class="chkSmall"><label for="NoticeEmail">E-mail</label>
									<input type="text" title="아이디를 입력하세요" class="email" name="emailAddr1" placeholder="아이디를 입력하세요" style="width:152px;ime-mode:disabled;" disabled="disabled">
									<span class="des">@</span>
									<input type="text" class="email" name="emailAddr2" title="직접 입력 하세요" placeholder="직접 입력 하세요" style="width:140px;ime-mode:disabled;" disabled="disabled">
									<input type="hidden" name="emailAddr" value="keh94k@naver.com">
									<select title="도메인 주소를 선택하세요." class="email" style="width:122px;" id="emailAddrSelect" disabled="disabled" selected="selected">
										<option value="-1" selected="selected">직접입력</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="paran.com">paran.com</option>
										<option value="empal.com">empal.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="korea.com">korea.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="hanafos.com">hanafos.com</option>
										<option value="daum.net">daum.net</option>
										<option value="chol.com">chol.com</option>
										<option value="feechal.com">feechal.com</option>
									</select>
								</li>
							</ul>
						</td>
					</tr>
				
			</tbody>
		</table>
	
</div>