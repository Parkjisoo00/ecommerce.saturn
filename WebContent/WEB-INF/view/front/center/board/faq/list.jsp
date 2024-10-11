<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/faq/list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
			
		.gnb li {
		display: inline; /* 수평 배치 */
		margin-right: 15px; /* 메뉴 간격 */
		}
		
		p {
		margin-top: 5px;
		line-height: 1.6; /* 줄 간격 */
		margin: 5px 0; /* 위아래 여백 */
		}
		
		button.accordion {
		background-color: #f3ebe1; /* 기본 버튼 배경색 */
		color: #000; /* 검정 글자 */
		cursor: pointer;
		padding: 10px;
		width: 100%;
		border: none;
		text-align: left;
		outline: none;
		font-size: 16px;
		transition: background-color 0.3s;
		border-radius: 5px; /* 버튼 모서리 둥글게 */
		margin: 5px 0; /* 버튼 간격 */
		}
		
		button.accordion:hover {
		background-color: #c7b199; /* 마우스 호버 시 색상 */
		}
		
		button.accordion.active {
		background-color: #e7d5bf; /* 클릭 시 연한 베이지색 */
		}
		
		.accordion2 {
		background-color: #FFF; /* 텍스트 박스 배경색 */
		color: #000; /* 검정 글자 */
		cursor: text;
		padding: 10px;
		width: 1100px;
		border: 1px solid #ddd; /* 테두리 */
		border-radius: 5px; /* 둥근 모서리 */
		margin: 5px 0; /* 여백 */
		resize: none; /* 크기 조절 비활성화 */
		overflow: auto; /* 스크롤바 활성화 */
		height: auto; /* 자동 높이 */
		}
		
		.panel {
		padding: 1px 1px;
		background-color: white;
		overflow: hidden;
		display: none; /* 기본적으로 숨김 */
		height: auto;
		}
		
		.contact-info {
		margin-top: 20px; /* 상단 여백 */
		padding: 10px;
		background-color: #F9F3EC; /* 부드러운 배경색 */
		border-radius: 8px; /* 모서리 둥글게 */
		}
		
		.contact-info h3 {
		margin-bottom: 10px; /* 하단 여백 */
		}
	</style>
	<script>
	window.onload = function() {
		var acc = document.getElementsByClassName("accordion");
		for (var i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
		this.classList.toggle("active");
		var panel = this.nextElementSibling;
		if (panel.style.display === "block") {
		panel.style.display = "none";
		} else {
		panel.style.display = "block";
		}
		});
		}
		}
	<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
	function goView(value) {

		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_bbs").value = value;
		
		frmMain.action="/front/center/board/view.web";
		frmMain.submit();
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		
		frmMain.action="/front/center/board/list.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action="/front/center/board/list.web";
		frmMain.submit();
	}
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" name="seq_bbs"		id="seq_bbs" />
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<section class="shop spad">
		<div class="container">
			<article class="txtCenter">
			<div class="col-lg-12" style="padding: 0 !important;">
				<div class="checkout__form__input">
		<div>
			<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">자주 찾는 질문(FAQ)</h6>
			<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none">
					<c:if test="${paging.cd_bbs_type == 1}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
					</c:if>

					<c:if test="${paging.cd_bbs_type == 2}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
					</c:if>
					<c:if test="${paging.cd_bbs_type == 3}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
					</c:if>
		</h6>
		</div>
			</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
				<div style="display: flex; justify-content: flex-end;margin-bottom: 10px;">
				<select name="searchKey">
					<option value="title"<c:if test="${paging.searchKey == 'title'}"> selected</c:if>>제목</option>
					<option value="contents"<c:if test="${paging.searchKey == 'contents'}"> selected</c:if>>내용</option>
					<option value="title+contents"<c:if test="${paging.searchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> 
				<input type="submit" value="검색"/>
			</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
				<div class="brdInfo">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</div>
				<br/>
					<!-- 첫 번째 아코디언 -->
					<button class="accordion" type="button">Q.탈퇴 후 재 가입이 가능한가요? </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 네 , 회원 탈퇴 후 재가입은 가능합니다..</textarea>
					</div>
					
					<!-- 두 번째 아코디언 -->
					<button class="accordion" type="button">Q.쿠폰은 어떤 종류가 있나요?</button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 다양한 쿠폰이 있습니다.</textarea>
					</div>
					
					<!-- 세 번째 아코디언 -->
					<button class="accordion" type="button">Q.개인정보는 어떻게 변경하나요? </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 마이 페이지 [ 회원정보변경 ] 메뉴에서 변경 하실 수 있습니다.</textarea>
					</div>
					
					<button class="accordion" type="button">Q.회원가입을 해야만 상품 구매가 가능한가요?  </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 네 회원가입 후 구매가 가능하십니다.</textarea>
					</div>
					
					<button class="accordion" type="button">Q.아이디와 비밀번호를 분실했습니다.  </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 아이디 찾기와 비밀번호 찾기는 사이트 우측상단 로그인 메뉴에 들어가면 확인하실 수 있습니다.</textarea>
					</div>
					
					<button class="accordion" type="button">Q.포인트에 사용기한이 있나요?  </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 아니요. 사용기한이 없습니다.</textarea>
					</div>
					
					<button class="accordion" type="button">Q.주문확인/배송조회는 어디서 하나요?  </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 로그인 후 마이페이지 에서 주문확인이 가능합니다.</textarea>
					</div>
					
					<button class="accordion" type="button">Q.주문자랑 수취인이 이름이 달라도 통관에 문제가 없나요?  </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 네 , 주문자 성함과는 관계가 없습니다.</textarea>
					</div>
					
					<button class="accordion" type="button">Q.받은 제품이 불량인 것 같아요. 제품 불량은 취소나 환불이 되나요?  </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 제품 불량이나 제품 파손인 경우 고객센터로 연락주시면 부분 환불이나 재발송 처리가 가능합니다.</textarea>
					</div>
					
					<button class="accordion" type="button">Q.전화로 주문이 가능한가요 ? </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 네. 전화로 주문이 가능합니다. ARS전화주문 메뉴를 확인하세요.</textarea>
					</div>
					
					<button class="accordion" type="button">Q. 제품의 유통기한은 어떻게 확인 하나요?    </button>
					<div class="panel">
					<textarea class="accordion2" readonly>A. 구매하시려는 제품의 상세페이지 내 상단 오른쪽 기본 정보란에 해당 제품의 유통기한이 표기 되어 있으며 입고시 유통기한도 함께 업데이트 되고 있습니다.</textarea>
					</div>
					
					<div class="row">
					<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;" >
						<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goList" />
					</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		</article>
	</div>
</section>

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</form>
</body>
</html>