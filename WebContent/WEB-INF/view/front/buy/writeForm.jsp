<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/writeForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
	<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
	
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" id="item" name="item" />

<input type="hidden" id="seq_sle"	value="${saleDto.seq_sle}" />
<input type="hidden" id="sle_nm"	value="${saleDto.sle_nm}" />
<input type="hidden" id="price"		value="${saleDto.price_sale}" />

<input type="hidden" name="buyList[0].seq_sle" value="${saleDto.seq_sle}" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- 페이지의 상단 로고 바로 밑에 출력되는 전체 상품 / 기능별 / 성분별 / 대상별 / 맞춤 건강 / 고객센터 / 소개 메뉴 -->
		<%@ include file="/include/front/middlegnb.jsp" %>
	<!-- Breadcrumb End -->
	
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="product__details__pic">
						<div class="product__details__slider__content">
							<div class="product__details__pic__slider owl-carousel">
								<img data-hash="product-1" class="product__big__img" src="${saleDto.img}" alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<h6 style="line-height: 1.5em; min-height: 3em; font-size: 18px; font-weight: bold;">${saleDto.sle_nm}</h6>
						<span>판매자 : ${saleDto.corp_nm}</span>
						<div class="rating">
							<c:if test="${salDto.average_rate == 1}">
								<i class="fa fa-star"></i><span style="margin-left: 10px;">${saleDto.count}개 상품평</span>
							</c:if>
							<c:if test="${saleDto.average_rate == 2}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i><span style="margin-left: 10px;">${saleDto.count}개 상품평</span>
							</c:if>
							<c:if test="${saleDto.average_rate == 3}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i><span style="margin-left: 10px;">${saleDto.count}개 상품평</span>
							</c:if>
							<c:if test="${saleDto.average_rate == 4}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i><span style="margin-left: 10px; color: #346aff; font-size: 12px;">${saleDto.count}개 상품평</span>
							</c:if>
							<c:if test="${saleDto.average_rate == 5}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i><span style="margin-left: 10px;">${saleDto.count}개 상품평</span>
							</c:if>
						</div>
						<div class="product__details__price">$ 75.0 <span>$ 83.0</span></div>
						<p>제품 설명</p>
						<div class="product__details__button">
							<div class="quantity">
								<span>구매 수량:</span>
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
							<a href="#" class="cart-btn"><span class="icon_bag_alt"></span> 장바구니에 담기</a>
							<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__details__widget">
							<ul>
								<li>
									<span>재고:</span>
									<div class="stock__checkbox">
										<label for="stockin">
											재고 숫자
											<input type="checkbox" id="stockin">
											
										</label>
									</div>
								</li>
								<li>
									<span>제품 타입:</span>
									<div class="stock__checkbox">
										<label for="stockin">
											제품 타입
											<input type="checkbox" id="stockin">
											
										</label>
									</div>
								</li>
								<li>
									<span>등록일</span>
									<div class="stock__checkbox">
										<label for="stockin">
											등록일
											<input type="checkbox" id="stockin">
											
										</label>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Reviews ( 2 )</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<h6>Description</h6>
								<p>제품 설명 이미지</p>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<h6>TODO 리뷰 ( 2 )</h6>
								<p>리뷰 작성</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 리스트 형태로 이 페이지의 상품과 같은 대분류의 중분류 상품들을 넣기 -->
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5>함께 보면 좋은 상품</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-1.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명r</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-2.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-3.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-4.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

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