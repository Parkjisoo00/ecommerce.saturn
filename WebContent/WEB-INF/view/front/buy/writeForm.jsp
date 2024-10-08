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
											<span class="pd-text" style="width: 55px;">${saleDto.price_sale}</span>
											<span class="pd-text">원</span>
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">판매가</span>
										<label for="stockin">
											<span class="pd-text" style="color: #ff4c2e !important; width: 55px;">${saleDto.discount_sale}</span>
											<span class="pd-text" style="width: 20px !important;">원</span>
											<span class="pd-text" style="color: #ff4c2e !important; font-size: 14px !important; padding-top: 3px;">(${saleDto.discount}%)</span>
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">적립 포인트</span>
										<label for="stockin">
											<span class="pd-text" style="width: 65px;">${saleDto.point_value} 적립</span>
											<span class="pd-text" style="color: #346aff !important; font-size: 14px !important; padding-top: 3px;">(2%)</span>
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">브랜드</span>
										<label for="stockin">
											${saleDto.corp_nm}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">제품타입</span>
										<label for="stockin">
											${saleDto.prd_type}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">재고</span>
										<label for="stockin">
											${saleDto.count_stock}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">등록일</span>
										<label for="stockin">
											${saleDto.dt_reg}
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
										<c:when test="${empty reviewList}">
											<tr>
												<td colspan="4">등록된 리뷰가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${reviewList}" var="reviewList">
												<tr>
													<td>
														
													</td>
													<td style="text-align: left">
														${reviewList.rate_review}
													</td>
													<td>
														${reviewList.mbr_nm}
													</td>
													<td>
														${reviewList.dt_reg}
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
								<p>[TODO] 1대1 문의 게시판 코드 적용</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 리스트 형태로 이 페이지의 상품과 같은 대분류의 중분류 상품들을 넣기 -->
			<div class="col-lg-12 text-center">
				<div class="related__title">
					<h5>함께 보면 좋은 상품</h5>
				</div>
			</div>
			<div class="row">
			<c:forEach var="list" items="${list}">
				<div class="col-lg-3 col-md-6">
					<div class="product__item">
						<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_b}', '${list.cd_ctg_m}');">
							<div class="product__item__pic set-bg" data-setbg="${list.img}">
							<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
								<div class="label new">베스트</div>
							</c:if>
							</div>
						</a>
						<div class="product__item__text">
							<h6 style="line-height: 1.5em; min-height: 3em;"><a href="#" style="font-size: 15px;">${list.sle_nm}</a></h6>
								<div class="rating">
									<c:if test="${list.average_rate == 1}">
										<i class="fa fa-star"></i><span class="rate">${list.count}개 상품평</span>
									</c:if>
									<c:if test="${list.average_rate == 2}">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i><span class="rate">${list.count}개 상품평</span>
									</c:if>
									<c:if test="${list.average_rate == 3}">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i><span class="rate">${list.count}개 상품평</span>
									</c:if>
									<c:if test="${list.average_rate == 4}">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i><span class="rate">${list.count}개 상품평</span>
									</c:if>
									<c:if test="${list.average_rate == 5}">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i><span class="rate">${list.count}개 상품평</span>
									</c:if>
								</div>
							<c:choose>
								<c:when test="${list.discount == null || list.discount == 0}">
									<div class="product__price"><span style="text-decoration: none; font-size: 1.3em; color: black;">${list.price_sale}</span>원</div>
								</c:when>
								<c:otherwise>
									<div class="product__price"><span>${list.price_sale}</span> <span style="text-decoration: none; color : #ff4c2e">-${list.discount}%</span><span style="text-decoration: none; color: black; font-size: 1.3em">${list.discount_sale}</span>원</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				</c:forEach>
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