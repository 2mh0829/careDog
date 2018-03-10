<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
body, h1, h2, h3, h4, h5, h6, div, p, span, strong, em, blockquote, pre, address,
ul, ol, li, dl, dt, dd, form, fieldset, input, select, label, textarea, img, a {margin:0; padding:0; border:0/*;word-break:break-all;*/}
ul, ol {list-style:none;}
.TabsConts {display:none;}
.TabsConts.on {display:block;}
/* 고객센터 > 공통 게시판 */
.list-customer {width:1020px;margin:0 auto;}
.list-customer ul {overflow:hidden;width:100%;border-top:2px solid #888}
.list-customer ul li {background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow21x12_off.png") no-repeat 98% 24px;border-bottom:1px solid #e6e6e6}
.list-customer ul li.nodata {padding:200px 15px 80px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_nodata104x104.png") no-repeat center 80px;color:#888;font-size:16px;text-align:center;line-height:20px;}
.list-customer ul li .tit, .list-customer ul li .stit {margin-left:20px;padding:20px 0 20px 42px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_faq14x15.png") no-repeat 0 23px;color:#222;font-size:14px;line-height:18px;cursor:pointer;}
.list-customer ul li .stit {position:relative;margin:0;padding:20px 0 20px 30px;background:none}
.list-customer ul li .tit strong {display:inline-block;width:140px;margin-right:11px;vertical-align:middle;}
.list-customer ul li .stit strong {display:inline-block;width:70px;height:22px;margin:0 20px 0 0;padding:0 4px;border-radius:15px;box-sizing:border-box;text-align:center;background:#888;color:#fff;font-size:12px;line-height:22px}
.list-customer ul li .stit .data {position:absolute;right:60px;color:#888;font-size:14px;line-height:18px;}
.list-customer ul li .conts {display:none;background:#fafafa;border:0;color:#222;font-size:0;line-height:0;}
.list-customer ul li .conts li {padding:28px 30px 25px;background:none;border-top:1px solid #e6e6e6;border-bottom:0}
.list-customer ul li .conts li strong {display:block;font-size:16px;line-height:22px;}
.list-customer ul li .conts li p,
.list-customer ul li .conts li div {padding:0;color:#222;font-size:14px;line-height:22px;}
.list-customer ul li .conts li > ul+p,
.list-customer ul li .conts li > ul+div {padding:15px 0 0}
.list-customer ul li .conts li .phr {position:relative;margin:25px 0 0;padding:28px 0 0;/*background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/bar_dott7x1.gif") repeat-x 0 0;*/border-top:1px dashed #e6e6e6;color:#888;font-size:14px;line-height:18px;}
.list-customer ul li .conts li .btnGreenW {display:inline-block;position:absolute;top:17px;right:0;width:112px;height:38px;padding:4px 0 0;font-size:14px;text-align:center;letter-spacing:-1px;}
.list-customer ul li .conts li.question {padding:28px 30px 25px 62px}
.list-customer ul li .conts li.question strong {color:#666;}
.list-customer ul li .conts li.answer {}
.list-customer ul li .conts li.answer strong {display:block;position:relative;color:#969937}
.list-customer ul li .conts li.answer strong > .answer_date {position:absolute;top:0;right:0;font-size:14px}
.list-customer ul li .conts li.answer strong+p,
.list-customer ul li .conts li.answer strong+div {padding:15px 0 0}

.list-customer ul li .conts li ul {margin:18px 0 0;padding:0 0 0 8px;border:0;border-left:2px solid #ccc;}
.list-customer ul li .conts li ul li {padding:0;border:0;color:#888;font-size:14px;line-height:22px;}
.list-customer ul li .conts li ul li em {display:inline-block;margin:0 6px 0 0;font-style:normal}
.list-customer ul li .conts li ul li.offline{color:#8f9100;font-weight:bold;}
.list-customer ul li.open .conts {display:block;}
.list-customer ul li.open {background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow21x12_on.png") no-repeat 98% 24px;}
.list-customer ul li.open .tit, .list-customer ul li.open .stit {color:#9ea000;font-weight:700}
.list-customer ul li.open .stit strong {background:#979900;}
.list-customer ul li.open .stit .data {}

.list-customer ul li .tit > span.tx_same {color:#969937;font-weight:700}

.comm2sTabs.iconTab {height:120px;margin-bottom:60px}
.comm2sTabs.iconTab > li {width:147px;height:120px}
.comm2sTabs.iconTab > li:first-child {margin-left:0;width:144px}
.comm2sTabs.iconTab > li > button {width:100%;height:118px;padding-top:60px;color:#222;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_tab_customer.png") no-repeat 0 0;font-weight:400}
.comm2sTabs.iconTab > li > button.icon_tab01 {background-position:50px 24px}
.comm2sTabs.iconTab > li > button.icon_tab02 {background-position:-95px 24px}
.comm2sTabs.iconTab > li > button.icon_tab03 {background-position:-239px 24px}
.comm2sTabs.iconTab > li > button.icon_tab04 {background-position:-385px 24px}
.comm2sTabs.iconTab > li > button.icon_tab05 {background-position:-532px 24px}
.comm2sTabs.iconTab > li > button.icon_tab06 {background-position:-675px 24px}
.comm2sTabs.iconTab > li > button.icon_tab07 {background-position:-823px 24px}

.comm2sTabs.iconTab > li > button.icon_tab06+.twoTabs,
.comm2sTabs.iconTab > li > button.icon_tab07+.twoTabs {right:0}

.comm2sTabs.iconTab > li.on {border:1px solid #ddd}
.comm2sTabs.iconTab > li.on > button {color:#fff}

</style>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">


</script>
<div class="body-container">

<div class="area-customer">
	<ul class="comm2sTabs iconTab">
		<li class="on" data-cd="99"><button type="button" class="icon_tab01">TOP10</button>
		</li>
		<li data-cd="40"><button type="button" class="icon_tab02">회원/멤버십</button>
		</li>
		<li data-cd="10"><button type="button" class="icon_tab03">주문/결제</button>
		</li>
		<li data-cd="20"><button type="button" class="icon_tab04">배송</button>
		</li>
		<li data-cd="30"><button type="button" class="icon_tab05">교환/반품/환불</button>
		</li>					
	</ul>
</div>

<div class="TabsConts on">
	
					<div class="list-customer">
						<ul>
	
		
									
							<li>
								<p class="tit"><strong>TOP10</strong>증정품이 배송되지 않았어요.</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											증정품의 경우, 한정수량으로 진행됨에 따라 조기 소진 시 배송되지 않을 수 있습니다.<br>
상품 주문 시 '결제하기' 버튼을 클릭하시면 수령하실 수 있는 증정품에 대한 안내가 팝업으로&nbsp;노출되며,<br>
해당 안내가 노출되는 경우 증정품 수령이 가능하지만, 노출되지 않는다면 증정품이 소진되어<br>
배송이 어려운 경우입니다.<br>
<br>
주문 이후, 주문/배송 조회 화면에서 '주문상세보기' 버튼을 눌러 주문상세를 조회하시면<br>
해당 화면에서도 수령하실 수 있는 증정품에 대한 내역을 확인 하실 수 있습니다.<br>
<br>
결제 시 팝업 노출도 되었고, 주문상세조회에서도 증정품 내역을 확인하실 수 있으나 증정품을<br>
수령하지 못하신 경우라면 올리브영 온라인몰 고객센터(1522-0882)로 연락 주시면<br>
신속하게 처리 도와 드리겠습니다.<br>
&nbsp;
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>뷰티테스터에 당첨되었는데.. 후기는 어디에서 작성하나요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											뷰티테스터 당첨 확인 및 후기 작성은 마이페이지 內 마이활동 → 뷰티테스터 참여현황 에서 가능합니다.<br>
<a href="https://www.oliveyoung.co.kr/store/mypage/getMyBeautyList.do"><span style="color:#0066cc">뷰티테스터 참여현황으로 바로 이동 클릭</span></a>
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>배송비는 얼마인가요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											배송비는 실결제금액 기준 2만원 이상 결제 시 무료이며, 2만원 이하 결제의 경우 기본적으로 배송비는 2,500원입니다.<br>
<br>
※ 추가 배송비가&nbsp;발생하는 경우<br>
&nbsp;- 도서산간:&nbsp;+2,500원 (5,000원)<br>
&nbsp;- 제주도:&nbsp;&nbsp;+2,500원 (5,000원)<br>
&nbsp;- 제주도의 도서산간 지역:&nbsp;&nbsp;+7,000원 (9,500원)<br>
&nbsp;
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>주문 후에 언제까지 입금해야 하나요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											무통장 입금으로 주문 시 24시간 이내에 입금해주셔야 주문이 가능하며,<br>
24시간 이후에는 자동으로 주문이 취소됩니다.
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>1+1 상품 주문할때 수량은 1개만 하면 되나요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											1+1, 혹은 2+1 등의 프로모션의 경우,<br>
주문하실 수량만 입력하시면 +1은 자동으로 계산되어 함께 배송됩니다.<br>
(ex. 1+1 상품 1개 주문 → +1 상품 자동 계산되어 2개로 배송)
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>반품할 때 비용이 드나요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											반품 시 지불하셔야 하는 반품비용은 회수비 2,500원입니다.<br>
<br>
※ 추가비용이 발생하는 경우<br>
&nbsp;- 도서산간:&nbsp;+2,500원 (5,000원)<br>
&nbsp;- 제주도:&nbsp;&nbsp;+2,500원 (5,000원)<br>
&nbsp;- 제주도의 도서산간 지역:&nbsp;&nbsp;+7,000원 (9,500원)<br>
&nbsp;- 무료배송이었으나 부분적인 반품으로 인해 무료배송 조건(결제금액 2만원 이상)이 깨진 경우<br>
&nbsp;&nbsp; : &nbsp;면제받으셨던 초기 배송비&nbsp;2,500원 추가 발생<br>
<br>
반품비는 환불금액에서 차감처리 됩니다.<br>
다만 상품의 불량, 배송 오류 등 당사의 실수로 인한 반품의 경우, 반품에 필요한 비용은 당사가 부담합니다.
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>반품은 언제까지 가능한가요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											반품은 상품을 수령하신 날짜를 기준으로 15일 이내에 가능합니다.<br>
다만 상품의 불량, 배송 오류 등 당사의 실수로 인한 반품인 경우, 30일 이내 신청이 가능합니다.
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>[매장] 결제했던 신용카드를 분실했는데 교환/환불이 가능한가요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											분실한 신용카드 번호와 유효기간을 확인 후 구입매장으로 방문해주시면 교환/환불이 가능합니다.<br>
(15일 이내 가능, 영수증 지참 필요)
										</p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>주문한 상품은 언제 배송되나요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											</p><p>온라인몰에서 주문하신 상품은 주문일 기준 3일~5일 이내(주말 및 공휴일 제외)로 배송됩니다.<br>
<br>
※ 도서산간, 제주도 지역의 경우 5~7일 이내 배송됩니다.<br>
※ 브랜드 세일 기간에는 주문량 폭주로 인해 주문일로부터 5~7일 이내 배송됩니다.<br>
※ 예약배송 상품의 경우, 지정된 배송일에 배송됩니다.<br>
&nbsp;</p>
<br>
&nbsp;
										<p></p>
									</li>
								</ul>
							</li>
											
							<li>
								<p class="tit"><strong>TOP10</strong>매장 위치, 연락처, 영업시간 등의 정보는 어디서 확인할 수 있나요?</p>
								<ul class="conts">
									<li class="question">
										<p class="pdzero">
											올리브영의 매장 위치, 연락처, 영업시간 등의 정보는 홈페이지 우측 상단 '올리브영 매장안내'를 통해 확인하실 수 있습니다.
										</p>
									</li>
								</ul>
							</li>
					
			
		
	
						</ul>
					</div>
				</div>
			</div>	