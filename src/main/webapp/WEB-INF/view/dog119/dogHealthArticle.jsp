<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.content { float: left; width: 954px; /*min-height:800px;*/}
.content.page-main { float: none; width: auto; }
.page-tit { margin: 30px 0; color: #222; line-height: 1; margin-left: -2px; font-size: 32px; position:relative; }/* 20171027 수정 */
.page-tit:before { display: block; width: 30px; margin-bottom: 12px; margin-left: 2px; border-top: 3px solid #1991d7; content: ''; }
.gobusan {position:absolute; right:0; vertical-align:middle; font-weight:normal;} /* 20171027 추가*/
.imageView__viewTitle { margin-top: 15px; padding-bottom: 22px; border-bottom: 1px solid #dedede; }
.imageView__viewTitle.type-bt_top { margin-top: 0; padding-top: 22px; border-top: 1px solid #dedede; }
.imageView__view--subject { font-size: 18px; color: #222222; font-weight: 700; }
.imageView__view--info { margin: 12px 0; }
.imageView__view--file { font-size: 13px; color: #999999; padding-left: 15px; background: url("../images/content/listClip.png") 0 center no-repeat; }
.imageView__view--file a:hover { color: #222; }
.imageView__viewContent { font-size: 11pt; color: #000; border-bottom: 1px solid #dedede; }/*20180305 수정*/
.imageView__viewContentBox { padding: 24px; line-height: 180%; word-break:break-all;}/*20180212 수정*/
.imageView__viewContentBox p { margin: 0;  line-height: 180%; }/*20171031 수정*/
.imageView__snsGroup { text-align: right; margin: 24px 0 40px 0; }
.imageView__snsGroup a { display: inline-block; line-height: 1; }
.imageView__viewReplayWrite { padding: 20px 0 10px 0; }
.imageView__viewReplayWrite:after { display: block; content: ""; clear: both; }
.imageView__replyTitle { float: left; font-size: 14px; color: #222222; font-weight: 800; padding-right: 15px; margin-right: 17px; height: 32px; line-height: 32px; background: url("../images/content/replyWriteIcon.jpg") right center no-repeat; }
.imageView__writerInfo { float: left; font-size: 13px; color: #767676; font-weight: 400; }
.imageView__writerInfo:before { content: " | "; padding-right: 13px; }
.imageView__writerInfo input[type="text"],
.imageView__writerInfo input[type="password"]{ border: 1px solid #dddddd; width: 100px; height: 32px; line-height: 32px; margin: 0 10px; }
.imageView__writeInfo { float: left; font-size: 13px; color: #999999; letter-spacing: -1px; height: 32px; line-height: 32px; }
.imageView__writeContent { position: relative; z-index: 1; width: 100%; float: left; margin: 10px 0; }
.imageView__writeContent:after { content: ""; display: block; clear: both; }
.imageView__writeArea { width: 99%; border: 1px solid #dddddd; overflow: hidden; }
.imageView__writeArea textarea { border: none; width: 864px; height: 52px; padding-left: 1%; }
.imageView__writeSubmit { position: absolute; top: 0px; right: 0px; width: 9%; }
.imageView__writeSubmit input[type="submit"] { width: 100%; font-size: 14px; background: #1991d7; border: 1px solid #1991d7; color: #fff; height: 54px; }
.imageView__writeSubmit input[type="button"] { width: 100%; font-size: 14px; background: #1991d7; border: 1px solid #1991d7; color: #fff; height: 54px; }
.imageView__replyTitleResult { font-size: 14px; color: #222222; border-bottom: 1px solid #dedede; padding: 5px 0 10px 0; font-weight: 700; }
.imageView__replyTitleResult span { font-size: 14px; color: #1991d7; margin: 0 7px; }
.imageView__viewReplayList ul { list-style: none; padding: 0px; margin: 0px; }
.imageView__viewReplayList ul li { border-bottom: 1px solid #dedede; padding: 17px 0; }
.imageView__replyItem:after { content: ""; display: block; clear: both; }
.imageView__writer { float: left; font-size: 13px; color: #222222; font-weight: 700; }
.imageView__writeDate { float: right; font-size: 13px; color: #999999; }
.imageView__replyContent { font-size: 14px; color: #767676; line-height: 1.8; margin-top: 15px; }/*20171031 수정*/
.imageView__viewButtonGroup { margin: 26px 0 0 0; }
.imageView__viewButtonGroup:after { display: block; content: ""; clear: both; }
.imageView__viewButtonLeft { float: left; }
.imageView__viewButtonRight { float: right; }
.imageView__viewButtonRight .imageView__viewButtonRight {float:none; display:inline-block;} /* 20171124 */
.imageView__viewButtonLeft a, .imageView__viewButtonRight a { display: block; width: 80px; height: 40px; line-height: 40px; font-size: 14px; color: #666666; border: 1px solid #666666; font-weight: 700; text-align: center; color: #666666; }
.imageView__btn { display: inline-block; width: 160px; height: 45px; background-color: #1991d7; line-height: 45px; color: #fff; text-align: center; }
.contentsInfo { font-size: 13px; color: #999999; }
.contentsInfo span { font-weight: 400; padding: 0 0 0 17px; }/*20170918 수정*/
.contentsInfo span:after { content: " | "; padding-left: 3px; margin-right: 3px; }/*20170918 수정*/
.contentsInfo span:last-child:after { content: ""; }
.contentsInfo-writer { padding: 0px !important; }
.contentsInfo-date { background: url("<%=cp%>/resource/img/dog119/listWriteTime.png") 0 center no-repeat; }/*20170918 수정*/
.contentsInfo-viewCnt { background: url("<%=cp%>/resource/img/dog119/listViewCnt.png") 0 center no-repeat; }
.contentsInfo-goodCont { background: url("<%=cp%>/resource/img/dog119/listGood.png") 0 center no-repeat; }
.contentsInfo-homepage { background: url("<%=cp%>/resource/img/dog119/listHomepage.png") 0 center no-repeat; }
.contentsInfo-basket { background: url("<%=cp%>/resource/img/dog119/listBasket.png") 0 center no-repeat; }
.contentsInfo-recommend { background: url("<%=cp%>/resource/img/dog119/listRecommend.png") 0 center no-repeat; }
.contentsInfo-heart { display: inline-block; width: 85px; height: 26px; padding-left: 26px !important; color: #fff; line-height: 26px; border-radius: 5px; background: url("../images/content/listHeart.png") 6px center no-repeat #1991d7; -webkit-box-sizing: border-box; box-sizing: border-box; }
.contentsInfo-homepage a:hover { color: #222; }
.imageList__contentsImage { position: absolute; top: 28px; left: 0px; }
.imageList__contentsImage img { width: 158px; height: 103px; }
body { font-size: 14px; font-family: "Nanum Gothic", sans-serif; word-break: keep-all; color: #555; }
fieldset { border: none; margin: 0; padding: 0; }
legend { position: absolute; top: -999em; left: -999em; }
b, strong { font-weight: bold; }
a { color: inherit; text-decoration: none; }
p { line-height: 1.5; margin: 1em 0; }
input:not([type='checkbox']), input:not([type='radio']), textarea, select { border-radius: 0; }
input:not([type='checkbox']), input:not([type='radio']), textarea, select { -webkit-appearance: none; -moz-appearance: none; appearance: none; }
button, input[type='checkbox'], input[type='radio'], input[type='button'], input[type='submit'], input[type='image'] { cursor: pointer; }
.font1 { font-family: "Nanum Gothic", sans-serif; }
.font2 { font-family: "Open Sans", sans-serif; }
.gray1 { color: #767676; }
.gray2 { color: #222; }
.color1 { color: #1991d7 !important; }
.color2 { color: #009e52; }
.color3 { color: #f24443; }
.h180 { height: 180px !important; }
.h200 { height: 200px !important; }
.hidden { overflow: hidden; position: absolute; width: 0; height: 0; }
.hidden.is-view { position: static; width: auto; height: auto; }
</style>

<script>

function dhRecommand(){
	if(!confirm("게시물을 추천하십니까?"))
		return;
	
	var q = ${dto.boardNum};
	$.post('<%=cp%>/dog119/dhRecommand',
		{boardNum: "${dto.boardNum}"},
		function(data){
			
		}
	);
}
</script>

<div class="body-container">

	<div class="content" id="AnimalsContent">
				<h1 class="page-tit">교육 안내
				</h1>
				
			<div class="imageView__content">
				<div class="imageView__viewArea">
					<div class="imageView__viewTitle">
						<div class="imageView__view--subject">
							${dto.title}
						</div>

						<div class="imageView__view--info">
							<div class="contentsInfo">
								<span class="contentsInfo-writer">
									${dto.username}
								</span>
								<span class="contentsInfo-date">
								${dto.created}
								</span>
								<span class="contentsInfo-viewCnt">${dto.hitCount}</span>
								<span class="contentsInfo-goodCont">${dto.likeDh}</span>
								
							</div>
						</div>
					</div>
					<div class="imageView__viewContent">
						<div class="imageView__viewContentBox">
							
							<span>
                            	<div style="text-align: center;">
                                  ${dto.content}
                                </div>
							</span>
					
						</div>
					</div>
					<div class="imageView__viewReplayWrite"><!-- style="display:none;" -->
						<form name="join" method="post" action="memo.asp?num=71&amp;cate1=a&amp;bname=zetyx_board_edu">
							<div class="imageView__replyTitle">댓글달기</div>
							
							<div class="imageView__writerInfo">
								세션 아이디
							</div>
							
							<div class="imageView__writeInfo"></div>
							<div class="imageView__writeContent"><input type="hidden" value="" name="keynum">
								<div class="imageView__writeArea"><textarea name="content"></textarea></div>
								<div class="imageView__writeSubmit"><input type="submit" onclick="javascript:join();return false;" value="등록"></div><!--  style="display:none;"-->
							</div>
						</form>
					</div>
<!-- 댓글 -->
					<div class="imageView__viewReplayList">
						<div class="imageView__replyTitleResult">댓글</div>
						<ul>
							<li>
								<div class="imageView__replyItem">
									<div class="imageView__writer">김시원</div>
									<div class="imageView__writeDate">
										2017-12-24 오후 3:03:22 | 
										  <a href="memo_del.asp?num=53&amp;ct=yes&amp;cate1=&amp;mnum=39&amp;bname=zetyx_board_edu&amp;cate2=b">삭제</a>
									</div>
								</div>
								<div class="imageView__replyContent">방학 때 읽어서 독후감 쓰겠습니다!</div>
							</li>
						</ul>
					</div>
					
				<div class="imageView__viewButtonGroup">
						<div class="imageView__viewButtonLeft"><a href="javascript:dhRecommand();">추천</a></div>
						<div class="imageView__viewButtonRight">

<!-- 쓰기 / 답글 / 수정 / 삭제 -->
							
								&nbsp;
								
						
						<div class="imageView__viewButtonRight">	
						
						<a href="<%=cp%>/dog119/dogHealth?page=${page}&search=${search}&keyword=${keyword}">목록</a>
						
						</div>
					</div>
				</div>
			</div>

				<!-- 게시글 목록추 -->
				
				<div class="board__all">
				


					<div class="imageList__content">

						<ul class="board__listPageing">
					
						<li class="board__pageingPrevBtn"><a><img src="/ani-main/images/content/listPrevBtn.png">&nbsp;</a></li>

<!-- 리스트 -->						
							<li>paging</li>
						</ul>
					</div>
	
	<div class="board__search">
		<form name="form1" method="post" action="?cate1=a&amp;bname=zetyx_board_edu">
			<div class="board__select">
				<select name="search" style="display: none;">
					<option value="subject">제목</option>
					<option value="memo">내용</option>
					<option value="name">이름</option>
				</select>
				
				<span id="" class="selectboxit-container selectboxit-container" role="combobox" aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" aria-owns="" aria-labelledby=""><span id="" class="selectboxit  selectboxit-enabled selectboxit-btn" name="search" tabindex="0" unselectable="on"><span class="selectboxit-option-icon-container"><i id="" class="selectboxit-default-icon selectboxit-option-icon selectboxit-container" unselectable="on"></i></span><span id="" class="selectboxit-text" unselectable="on" data-val="subject" aria-live="polite" style="max-width: 1803px;">제목</span><span id="" class="selectboxit-arrow-container" unselectable="on"><i id="" class="selectboxit-arrow selectboxit-default-arrow" unselectable="on"></i></span></span><ul class="selectboxit-options selectboxit-list" tabindex="-1" role="listbox" aria-hidden="true"><li data-id="0" data-val="subject" data-disabled="false" class="selectboxit-option  selectboxit-option-first selectboxit-selected" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>제목</a></li><li data-id="1" data-val="memo" data-disabled="false" class="selectboxit-option" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>내용</a></li><li data-id="2" data-val="name" data-disabled="false" class="selectboxit-option  selectboxit-option-last" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>이름</a></li></ul></span>
			</div>
			<div class="board__keyword"><input type="text" name="keyword"></div>
			<div class="board__searchBtn"><input type="button" onclick="javascript:chk();"></div>
&nbsp;
		</form>
	</div>

				</div>
				<!-- 게시글 목록추가 끝-->
			</div>

			</div>

</div>