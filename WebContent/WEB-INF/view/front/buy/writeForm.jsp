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
	<!-- Breadcrumb End -->
	
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6" style="display: flex; justify-content: center; align-items: center;">
					<div class="product__details__pic">
						<img data-hash="product-1" class="product__big__img" src="${saleDto.img}" alt="" style="width: 450px; height: 450px;">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<h6 style="line-height: 1.5em; min-height: 3em; font-size: 20px; font-weight: bold;">${saleDto.sle_nm}</h6>
						<div class="product__details__widget">
							<div class="rating">
								<c:if test="${salDto.average_rate == 1}">
									<i class="fa fa-star"></i><span class="rate">${saleDto.count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.average_rate == 2}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i><span class="rate">${saleDto.count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.average_rate == 3}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i><span class="rate">${saleDto.count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.average_rate == 4}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i><span class="rate">${saleDto.count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.average_rate == 5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i><span class="rate">${saleDto.count}개 상품평</span>
								</c:if>
							</div>
							<ul>
								<li>
									
									<div>
									<span class="pd-title">원가</span>
										<label for="stockin">
											<span class="pd-text">${saleDto.price_sale}원</span>
										</label>
									</div>
								</li>
								<li>
									
									<div>
									<span>판매가</span>
										<label for="stockin">
											<c:choose>
												<c:when test="${saleDto.discount == null || saleDto.discount == 0}">
													<span class="pd-text">${saleDto.price_sale}원</span>
												</c:when>
												<c:otherwise>
													<span>${saleDto.price_sale}</span> <span style="text-decoration: none; color : red">-${saleDto.discount}%</span><span style="text-decoration: none; color: black; font-size: 1.3em">${saleDto.discount_sale}</span>
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</li>
								<li>
									<span>적립 포인트</span>
									<div>
										<label for="stockin">
											100
										</label>
									</div>
								</li>
								<li>
									<span>브랜드</span>
									<div>
										<label for="stockin">
											100
										</label>
									</div>
								</li>
								<li>
									<span>제품타입</span>
									<div>
										<label for="stockin">
											100
											
										</label>
									</div>
								</li>
								<li>
									<span>재고</span>
									<div>
										<label for="stockin">
											100
										</label>
									</div>
								</li>
								<li>
									<span>등록일</span>
									<div>
										<label for="stockin">
											100
										</label>
									</div>
								</li>
							</ul>
						</div>
						</br>
						<div class="product__details__button">
							<div class="quantity">
								<span>구매 수량:</span>
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
							<a href="#" class="cart-btn"><span class="icon_bag_alt"></span> 장바구니에 담기</a>
							<ul>
								<c:choose>
									<c:when test="${saleDto.flg_like == 'Y'}">
										<li><a href="#" style="background-color: #ca1515;"><span class="icon_heart_alt" style="color: white;"></span></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#"><span class="icon_heart_alt"></span></a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품상세정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">리뷰 (${saleDto.count})</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품 Q&A</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div style="display: flex; justify-content: center; align-items: center; height: 100%;">
									<img src="${saleDto.desces}" alt="">
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="row">
									<div class="col-lg-12 col-md-12">
									<table class="headTop_01" style=" margin-left: auto; margin-right: auto; width: 100%">
									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="4">등록된 리뷰가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${list}" var="list">
												<tr>
													<td>
														평점
													</td>
													<td style="text-align: left">
														내용
													</td>
													<td>
														등록자
													</td>
													<td>
														등록일
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
										</c:choose>
									</table>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<p>링크</p>
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