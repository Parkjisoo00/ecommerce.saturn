<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/index.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag" uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
	.categories__item {
	position: relative;
	background-size: cover;
	background-position: center;
	}
	
	.categories__item::before {
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(255, 255, 255, 0.3); /* 반투명 흰색 덧씌우기 */
		z-index: 1;
	}
	
	.categories__text {
		position: relative;
		z-index: 2; /* 텍스트를 덮어씌운 반투명 레이어 위에 표시 */
	}
		
	
	</style>
	<script>
		function goTypeT(value) {
			
			var first_cd_ctg		= document.getElementById("first_cd_ctg").value;
			var second_cd_ctg		= document.getElementById("second_cd_ctg").value;
			var _searchWord			= document.getElementById("_searchWord").value;
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_ctg_b.setAttribute("value", first_cd_ctg);
			frmMain.cd_ctg_m.setAttribute("value", second_cd_ctg);
			frmMain.searchWord.setAttribute("value", _searchWord);
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/total_list.web";
			frmMain.submit();
		}
		
		function goTypeF(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/function_list.web";
			frmMain.submit();
		}
		
		function goTypeI(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/ingredient_list.web";
			frmMain.submit();
		}
		
		function goTypeG(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/gender_list.web";
			frmMain.submit();
		}
				
		function goList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/front/center/board/list.web";
			frmMain.submit();
		}
		
		function consolegoList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/console/center/board/list.web";
			frmMain.submit();
		}
		
		function hpSurgoList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/front/hpSur/ingredient.web";
			frmMain.submit();
		}
	</script>
<!-- Google Font -->
<%@ include file="/include/common/webfont.jsp" %>

<!-- Css Styles -->
<%@ include file="/include/common/css.jsp" %>

<style>
/*
	.categories__text.special-background {
	background-color: rgba(255, 255, 255, 0.5);
	padding: 10px;
	display: inline-block;
}

.categories__text.special-background h1,
.categories__text.special-background p {
	color: black;
}
*/
</style>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" name="corp_nm"			id="corp_nm" />
<input type="hidden" name="prd_type"		id="prd_type" />
<input type="hidden" name="filter"			id="filter" />
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m" />
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b" />
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type" />
<input type="hidden" name="searchWord"		id="searchWord" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<!-- Banner Section Begin -->
	<section class="banner set-bg" data-setbg="img/banner/banner7.jpg">
		<div class="container">
			<div class="row">
				<div class="col-xl-7 col-lg-8 ">
					<div class="banner__slider owl-carousel">
						<div class="banner__item">
							<div class="banner__text">
								<span>겨울맞이 특별 할인 - 최대 50% OFF! </span>
								<h1>이벤트</h1>
								<a href="/front/popup/event.web">바로가기</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>건강 목표 달성! 나만의 맞춤 영양제로 건강을 지키세요</span>
								<h1>맞춤 건강 관리</h1>
								<a href="/front/center/board/personalHealth/index.web">바로가기</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>인터넷 주문이 어려우시다면? <br> ※휴대폰에서만 주문가능※</span>
								<h1>ARS 전화주문</h1>
								<a href="/front/popup/ars.web">바로가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div class="categories__item categories__large__item set-bg"
						data-setbg="img/categories/home9.jpg">
						<div class="categories__text" style="text-align: left;">
						<div class="categories__text special-background">
							<h1 style="font-weight: bold; color: black;">나만의 맞춤 <br> 건강 추천</h1>
							<p style="font-weight: bold; font-size: 20px; ">건강 설문을 진행하고 나에게 맞는 영양제를 추천받아 보세요!</p>
							<a href="#" style="font-size: 20px;">바로가기</a>
						</div>
					</div>
				</div>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 p-0" style="border-bottom: 0px !important;">
							<div class="categories__item set-bg"
								data-setbg="img/categories/home4.jpg">
								<div class="categories__text">
								<div class="categories__text special-background">
									<h4 style="font-weight: bold;">안심 조회 서비스</h4>
									<p style="font-weight: bold;">구매하고 싶은 영양제가 인증 허가를 받은 <br> 안심상품인지 확인하세요</p>
									<a href="#">바로가기</a>
								</div>
							</div>
						</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 p-0" style="border-bottom: 0px !important;">
							<div class="categories__item"
								style="background-color: #dfd3c3;">
								<div class="categories__text">
									<h4>기능별 건강기능식품 조회</h4>
									<p>지금 당신에게 필요한 건강 솔루션은?</p>
									<a href="#">바로가기</a>
								</div>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 p-0" style="border-bottom: 0px !important;">
							<div class="categories__item"
								style="background-color: #c7b199;">
								<div class="categories__text">
									<h4>성분별 건강기능식품 조회</h4>
									<p>필요한 영양소를 한눈에! 성분별 영양제 가이드</p>
									<a href="#">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 p-0" style="border-bottom: 0px !important;">
							<div class="categories__item"
								style="background-color: #9f8473; border-bottom: 0px !important;">
								<div class="categories__text">
									<h4>대상별 건강기능식품 조회</h4>
									<p>남성과 여성, 당신의 몸에 맞춘 영양제 건강의 시작</p>
									<a href="#">바로가기</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Product Section Begin -->
	<section class="product" style="width: 70%; margin-left: auto; margin-right: auto;">
		<div class="container-fluid p-0">
			<div class="row" style="display: flex; justify-content: center;">
				<div class="col-lg-4 col-md-4">
					<div class="section-title" style="text-align: center;">
						<h4>브라보 마이 라이프 인기 상품</h4>
					</div>
				</div>
			</div>
			<div class="row property__gallery" style="display: flex; justify-content: center;">
				<c:forEach var="list" items="${list}">
					<div class="col-lg-2 col-md-6" style="padding: 0px !important; flex: 0 0 16.6% !important;">
						<div class="product__item">
							<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');" style="display: flex; justify-content: center; align-items: center;">
								<div style="height: 200px; width: 200px;" class="product__item__pic set-bg" data-setbg="${list.img}">
								<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
									<div class="label new">인기상품</div>
								</c:if>
								</div>
							</a>
							<div class="product__item__text">
								<h6 style="line-height: 1.5em; min-height: 3em; padding-left: 15px !important; padding-right: 15px !important;"><a style="font-size: 15px;">${list.sle_nm}</a></h6>
									<div class="rating">
										<c:if test="${list.star == 0}">
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 1}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 2}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 3}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 4}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 5}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
									</div>
								<c:choose>
									<c:when test="${list.discount == null || list.discount == 0}">
										<div class="product__price">
											<span style="text-decoration: none; font-size: 1.3em; color: black;">
												<fmt:formatNumber value="${list.price_sale}" type="number" />
											</span>원
										</div>
									</c:when>
									<c:otherwise>
										<div class="product__price" style="display: flex; align-items: center; justify-content: center;">
											<span style="margin-left:0px !important; font-size: 16px !important;">
												<fmt:formatNumber value="${list.price_sale}" type="number" />
											</span>
											<span class="discount-rate" style="padding-top: 1px !important; margin-left:4px !important; margin-top:2px !important; font-size: 13px !important; text-decoration: none;">
												${list.discount}%
											</span>
											<span style="text-decoration: none; color: black; font-size: 1.3em; margin-left: 7px;">
												<fmt:formatNumber value="${list.discount_sale}" type="number" />
											</span>원
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

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