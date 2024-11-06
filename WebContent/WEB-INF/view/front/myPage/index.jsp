<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/myPage/" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>

	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	
	function goMyList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action = "/front/center/board/myPageNotice/list.web";
		frmMain.submit();
	}
	</script>
</head>
<body>
<form id="frmMain" method="POST" class="checkout__form">
<input type="hidden" name="seq_sle"				id="seq_sle"/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"/>
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"/>
<input type="hidden" name="phone"				id="phone"/>
<input type="hidden" name="type"				id="type"/>
<input type="hidden" name="searchWord"			id="searchWord"/>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
		<%@ include file="/include/front/mygnb.jsp" %>
	<!-- Breadcrumb End -->

				<!-- Checkout Section Begin -->
<section class="checkout spad" style="min-height: calc(100vh - 1px);">
	<div class="container">
		<div class="row"style="display: flex; justify-content: center; align-items: center;">
			<div class="col-lg-12">
				<div class="mydiv1" id="myDiv1" style="width: 100%; display: flex; justify-content: space-between; align-items: center;margin-bottom:100px">
					<span class="styled-span" style="width: 60%; display: flex; justify-content: center; align-items: center;font-weight:700;">
					<span style="font-size: 30px; font-weight: 700; color: #341d08;">${memberDto.mbr_nm}</span>&nbsp;님 반갑습니다.</span>
					<span class="styled-span" style="width: 40%; display: flex; justify-content: center; align-items: center;font-weight:700;">포인트:&nbsp;
					<span style="font-size: 30px; font-weight: 700; color: #341d08;">${memberDto.total_point}</span></span>
				</div>	
				<div>
				<div>
					<h2 class="h2">진행 중인 주문</h2>
					<p class="sub-text">최근 30일 내에 진행중인 주문정보입니다.</p>
				</div>
					<div>
						<div class="order-step-box">
							<ol>
								<li>
									<p class="order-step-box-text">판매 확인중</p>
										<c:if test="${buyMasterDto.delivery_total_c == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_c}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_c != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_c}</span>
											</div>
										</c:if>
									<span class="fa fa-fw fa-arrow-right" style="display: block;position: absolute;top:40px;right: -30px;color:#717171;font-size: 40px;">&nbsp;
									</span>
								</li>
								<li>
									<p class="order-step-box-text">배송준비중</p>
										<c:if test="${buyMasterDto.delivery_total_p == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_p}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_p != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_p}</span>
											</div>
										</c:if>
									<span class="fa fa-fw fa-arrow-right" style="display: block;position: absolute;top:40px;right: -30px;color:#717171;font-size: 40px;">&nbsp;
									</span>
								</li>
								<li>
									<p class="order-step-box-text">배송중</p>
										<c:if test="${buyMasterDto.delivery_total_d == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_d}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_d != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_d}</span>
											</div>
										</c:if>
									<span class="fa fa-fw fa-arrow-right" style="display: block;position: absolute;top:40px;right: -30px;color:#717171;font-size: 40px;">&nbsp;
									</span>
								</li>
								<li>
									<p class="order-step-box-text">배송완료</p>
										<c:if test="${buyMasterDto.delivery_total_y == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_y}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_y != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_y}</span>
											</div>
										</c:if>
								</li>
							</ol>
							<div class="order-total-status">
								<div class="order-total-status-item">
									<span class="title">취소</span>
									<span class="num"><span>${buyMasterDto.cd_state_total_2}</span>건</span>
								</div>
								<div class="order-total-status-item">
									<span class="title">교환</span>
									<span class="num"><span>${buyMasterDto.cd_state_total_3}</span>건</span>
								</div>
								<div class="order-total-status-item">
									<span class="title">환불</span>
									<span class="num"><span>${buyMasterDto.cd_state_total_4}</span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->
<div class="container" style="max-width: 1350px;margin-top: 50px;">
	<div class="row" >
		<div class="col-lg-4 col-md-6 col-sm-10" style="max-width:395px;">
			<div class="footer__widget">
				<h6>공지사항<br><br></h6>
				<p>뉴트리25 홈 화면 바로가기 생성 방법 안내
				<br>* 뉴트리25 회원혜택 안내 *
				<br>* 개인통관부호 안내 *
				<br>* 관부가세 목록통관 범위 확대 관련 공지사항</p>
			</div>
		</div>
		<div class="col-lg-4 col-md-3 col-sm-10"style="max-width: 395px;">
			<div class="footer__widget">
				<h6>고객센터 
				<br>070.7432.2525</h6>
				<p>운영시간 : 오전 10시 ~ 오후 5시
				<br>점심시간 : 12시 - 1시
				<br>토,일,공휴일 휴무
				<br>Email : nutri25help@gmail.com
				</p>
			</div>
		</div>
		<div class="col-lg-5 col-md-3 col-sm-10" style="border-bottom: 0px solid #FFFFFF;max-width:558px">
			<div class="footer__widget">
			<img src="/img/logo/logo3.png" alt="" style="max-width:100%">
				<p>
				<br>
				브라보 마이 라이프는 통신판매중개자이며 통신판매의 당사자가 아니며,
				<br>판매자가 등록한 상품정보 및 거래에 대해 트리오브라이프는 일체 책임을 지지 않습니다.
				<br>COMPANY : (주)트리오브라이프 / 대표이사: 문소영
				<br>ADDRESS : 서울특별시 강남구 테헤란로33길 11 (JS빌딩) 3증 346호
				<br>사업자등록번호 : 220-88-82545 / 통신판매업 신고번호 : 제-2014-서울강남-01887호[사업자정보확인]
				</p>
			</div>
		</div>
	</div>
</div>
	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</form>
</body>
</html>