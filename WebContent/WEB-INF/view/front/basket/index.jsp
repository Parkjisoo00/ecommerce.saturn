<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
		function writeProc() {
			/* Database + iFrame
			[2024-10-10][TODO: 데이터베이스 정보(장바구니) 삭제 처리 필요(정상적으로 구매 및 결제된 경우)]
			*/
			
			var frmMain = document.getElementById("frmMain");
			frmMain.action = "/front/buy/writeProc.web";
			frmMain.submit();
		}
		
		window.onload = function () {
		
		}
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shop__cart__table">
						<h6 class="lowgnb-title" style="padding-bottom: 30px; text-align: left; font-size: 24px;">장바구니</h6>
						<table id="productBasket">
							<thead style="border-bottom: 1px solid #dbdbdb; border-top: 1px solid #707070; background: #f7f7f7;">
								<tr style="border-color: #707070 !important;">
									<th class="cart-th" style="width: 5%">선택</th>
									<th class="cart-th">상품</th>
									<th class="cart-th" style="width: 15%">수량</th>
									<th class="cart-th" style="width: 10%">상품금액</th>
									<th class="cart-th" style="width: 10%">적립포인트</th>
									<th class="cart-th" style="width: 10%">합계금액</th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${empty list}">
									<tr style="text-align: center; border-bottom: 1px solid #707070;">
										<td colspan="6" >장바구니에 상품이 없습니다</td>
									</tr>
								</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}">
											<tbody>
												<tr>
													<td>
														<input type="checkbox" />
													</td>
													<td class="cart__product__item">
														<div>
															<img src="${list.img}" style="margin-right: 0;">
														</div>
														<div class="cart-text">
															<h6>${list.sle_nm}</h6>
														</div>
													</td>
													<td style="justify-content: center; align-items: center;">
														<div class="pro-qty">
															<input type="text" value="${list.count}">
														</div>
													</td>
													<td class="cart-text">${list.price}원</td>
													<td class="cart-text" style="font-weight: normal !important;">${list.point_value}</td>
													<td class="cart-text">${list.total_price}원</td>
												</tr>
											</tbody>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
					<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
						<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
					</div>
				</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="border-bottom: none;">
					<div class="cart__btn">
						<a href="/">◃ 쇼핑 계속하기</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 100% !important; flex: 0 0 100% !important; border-bottom: none;">
					<div class="cart__total__procced" style="text-align: right;">
						<p style="margin-top: 15px;">
							<span style="font-size: 16px;">총 <strong style="font-size: 20px;">1</strong>개의 상품금액 
							<strong style="font-size: 20px;">10,000</strong>원
							<img src="/img/cartbtn/total.png" style="padding-left: 10px; padding-right: 10px; vertical-align: -4px;">
							<strong style="font-size: 20px;">10,000</strong>원
							</span>
						</p>
						<p>
							<span style="font-size: 14px; color: #ff4c2e;">적립 예정 포인트 : </span><span style="font-size: 14px; color: #ff4c2e;">1000</span>
						<p>
					</div>
					<div style="display: flex; justify-content: space-between;">
						<a href="#" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c; margin-left: 0;">선택 상품 삭제</a>
						<div>
							<a href="javascript:writeProc();" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">선택 상품 주문</a>
							<a href="javascript:writeProc();" class="cart-btn" style="background: #2c2c2c; color: white !important;">전체 상품 주문</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Cart Section End -->

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