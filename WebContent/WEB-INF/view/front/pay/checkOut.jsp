<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/function_list.jsp" %>
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
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<section class="checkout spad">
		<div class="container">
			<div class="col-lg-12">
				<h6 class="customer-main">주문/결제</h6>
			</div>
				<div class="col-lg-8" style="max-width: 100%;">
					<h5 class="customer-title">구매자정보</h5>
						<div class="shop__cart__table">
							<table class="customer-table">
								<tbody>
								<tr style="border: 0;">
									<td class="customer-td1">이름</td>
									<td class="customer-td2">${memberDto.mbr_nm}</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">이메일</td>
									<td class="customer-td2">${memberDto.email}</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">연락처</td>
									<td class="customer-td2">${memberDto.phone}</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">배송주소</td>
									<td class="customer-td2">
										<input type="text" maxlength="5" style="text-align:center;width:50px;pointer-events:none" id="post" name="post" required readonly value="${memberDto.post}"/>
										도로명 <input type="text" size="40" required id="addr1" name="addr1" style="pointer-events:none" readonly value="${memberDto.addr1}"/>
										<input type="hidden" id="jibunAdd" />
										<input type="hidden" id="extraAddress" />
										<span id="guide" style="color:#999; display:none"></span>
										상세 <input type="text" placeholder="상세 주소" required id="addr2" name="addr2" value="${memberDto.addr2}"/>
										<input type="button" value="우편번호 찾기" style="width:100px" onClick="execDaumPostcode();" />
									</td>
								</tr>
								</tbody>
							</table>
						</div>
						<h5 class="customer-title">결제정보</h5>
						<div class="shop__cart__table">
							<table class="customer-table">
								<tbody>
								<tr style="border: 0;">
									<td class="customer-td1">총상품금액</td>
									<td class="customer-td2"></td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">포인트적립</td>
									<td class="customer-td2"></td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">포인트</td>
									<td class="customer-td2"></td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">총결제금액</td>
									<td class="customer-td2"></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				<div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 100% !important; flex: 0 0 100% !important; border-bottom: none;">
					<div class="cart__total__procced" style="text-align: right;">
						<p style="margin-top: 15px;">
							<span style="font-size: 16px;">총 <strong id="totalItems" style="font-size: 20px;"></strong>개의 상품금액 
							<strong id="totalPrice" style="font-size: 20px;"></strong>원
							<img src="/img/cartbtn/total.png" style="padding-left: 10px; padding-right: 10px; vertical-align: -4px;">
							<strong id="totalPriceFinal" style="font-size: 20px;"></strong>원
							</span>
						</p>
						<p>
							<span style="font-size: 14px; color: #ff4c2e;">적립 예정 포인트 : </span><span id="totalPoints" style="font-size: 14px; color: #ff4c2e;"></span>
						</p>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<div>
							<a href="#" class="cart-btn" style="background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c;">결제 하기</a>
						</div>
					</div>
				</div>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
</form>
</body>
</html>