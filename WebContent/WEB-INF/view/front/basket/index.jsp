<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
		function goTypeT(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/total_list.web";
			frmMain.submit();
		}
		
		function goTypeF(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/function_list.web";
			frmMain.submit();
		}
		
		function goTypeI(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/ingredient_list.web";
			frmMain.submit();
		}
		
		function goTypeG(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/gender_list.web";
			frmMain.submit();
		}
		
		function goPages(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.currentPage.setAttribute("value", value);
			frmMain.action="/front/sale/gender_list.web";
			frmMain.submit();
		}
		
		function goWriteForm(value, value2, value3) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.seq_sle.setAttribute("value", value);
			frmMain.cd_ctg_m.setAttribute("value", value2);
			frmMain.cd_ctg_b.setAttribute("value", value3);
			frmMain.action="/front/buy/writeForm.web";
			frmMain.target = "";
			frmMain.submit();
		}
		
		function checkOut() {
			
			var frmMain = document.getElementById("frmMain");
			frmMain.action = "/front/pay/checkOut.web";
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
<input type="hidden" id="seq_sle"		name="seq_sle"/>
<input type="hidden" id="cd_ctg_m"		name="cd_ctg_m"/>
<input type="hidden" id="cd_ctg_b"		name="cd_ctg_b"/>
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="corp_nm"		name="corp_nm"			value="${paging.corp_nm}"/>
<input type="hidden" id="prd_type"		name="prd_type"			value="${paging.prd_type}"/>
<input type="hidden" id="filter"		name="filter"			value="${paging.filter}"/>
<input type="hidden" name="currentPage" id="currentPage"		value="${paging.currentPage}" />
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
					<h6 class="lowgnb-title" style="padding-bottom: 20px; text-align: left; font-size: 24px;">장바구니</h6>
					<h6 class="cart-title">*이미지를 클릭하면 상품으로 이동합니다</h6>
						<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;">
							<table id="productBasket" class="cart-table">
								<thead>
									<tr style="border-color: #707070 !important;">
										<th class="cart-th" style="width: 5%"><input type="checkbox" id="selectAll" checked/></th>
										<th class="cart-th" colspan="2">상품정보</th>
										<th class="cart-th" style="width: 15%">수량</th>
										<th class="cart-th" style="width: 10%">상품금액</th>
										<th class="cart-th" style="width: 10%">적립포인트</th>
										<th class="cart-th" style="width: 10%">합계포인트</th>
										<th class="cart-th" style="width: 10%">합계금액</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${empty list}">
										<tr style="text-align: center; border-bottom: 1px solid #707070;">
											<td colspan="7">장바구니에 상품이 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}" varStatus="status">
											<tbody>
											<tr style="border: 0;" data-seq-sle="${list.seq_sle}">
												<td class="cart-td">
													<input type="checkbox" class="selectItem" checked/>
												</td>
												<td class="cart-td" style="text-align: center; vertical-align: middle;">
													<input type="hidden" name="buyList[${status.index}].seq_sle" value="${list.seq_sle}" />
													<div class="cart-div">
														<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
															<img src="${list.img}" class="cart-img">
														</a>
													</div>
												</td>
												<td class="cart-td" style="text-align: left !important;">
													${list.sle_nm}
													<input type="hidden" name="buyList[${status.index}].sle_nm" value="${list.sle_nm}">
												</td>
												<td class="cart-td">
													<div class="pro-qty" style="border: 1.5px solid #c4cdd5;">
														<input type="text" class="quantityCart" name="buyList[${status.index}].count" value="${list.count}">
													</div>
												</td>
												<td class="cart-td">
													<fmt:formatNumber value="${list.price}" type="number" />원
													<input type="hidden" name="buyList[${status.index}].price" value="${list.price}">
												</td>
												<td class="cart-td">
													<span class="rate" style="margin-left: 0px !important;"><fmt:formatNumber value="${list.point_value}" type="number" /></span>포인트
													<input type="hidden" name="buyList[${status.index}].point" value="${list.point_value}">
												</td>
												<td class="cart-td" data-total-point="${list.total_point}">
													<span class="totalPointDisplay">
														${list.format_total_point}
														<input type="hidden" name="buyList[${status.index}].total_point_sum" value="${list.total_point}">
													</span>
												</td>
												<td class="cart-td" style="font-size: 16px !important; color: #707070 !important; font-weight: bold;" data-total-price="${list.total_price}">
													<span class="totalPriceDisplay" style="font-size: 16px !important; color: #707070 !important; font-weight: bold;">
														${list.format_total_price}원
														<input type="hidden" name="buyList[${status.index}].total_price_sum" value="${list.total_price}">
													</span>
												</td>
											</tr>
											</tbody>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
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
							<a href="#" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">선택 상품 삭제</a>
							<a href="#" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">선택 상품 주문</a>
							<a href="javascript:checkOut();" class="cart-btn" style="background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c;">전체 상품 주문</a>
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
<script>
	document.addEventListener('DOMContentLoaded', function () {
		
		const selectAllCheckbox = document.getElementById('selectAll');
		const itemCheckboxes = document.querySelectorAll('.selectItem');
		
		
		selectAllCheckbox.addEventListener('change', function (e) {
			
			itemCheckboxes.forEach(function (checkbox) {
				checkbox.checked = e.target.checked;
			});
			updateTotal();
		});
		
		
		itemCheckboxes.forEach(function (checkbox) {
			
			checkbox.addEventListener('change', updateTotal);
		});
	
		updateTotal();
	});
	
	function updateTotal() {
		
		let totalPrice = 0;
		let totalPoints = 0;
		let totalItems = 0;
		
		
		document.querySelectorAll('.selectItem:checked').forEach(function (checkbox) {
			
			const priceElement = checkbox.closest('tr').querySelector('td[data-total-price]');
			const pointElement = checkbox.closest('tr').querySelector('td[data-total-point]');
		
			const itemPrice = parseInt(priceElement.getAttribute('data-total-price')) || 0;
			const itemPoints = parseInt(pointElement.getAttribute('data-total-point')) || 0;
		
			totalPrice += itemPrice;
			totalPoints += itemPoints;
			totalItems++;
		});
		
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
		document.getElementById('totalPriceFinal').innerText = totalPrice.toLocaleString();
		document.getElementById('totalPoints').innerText = totalPoints.toLocaleString();
		document.getElementById('totalItems').innerText = totalItems;
	}
	
	$(document).ready(function () {
		
		$('.dec.qtybtn').off('click');
		$('.inc.qtybtn').off('click');
		
		$('.dec.qtybtn').on('click', function () {
			
			var parentRow = $(this).closest('tr');
			var seq_sle = parentRow.data('seq-sle');
			var currentValue = parseInt(parentRow.find('.quantityCart').val());
			
			if (currentValue > 1) {
				
				parentRow.find('.quantityCart').val(currentValue);
				
				var newValue = currentValue - 1;
				
				sendValueToServer(newValue, seq_sle);
			}
		});
		
		$('.inc.qtybtn').on('click', function () {
			
			var parentRow = $(this).closest('tr');
			var seq_sle = parentRow.data('seq-sle');
			var currentValue = parseInt(parentRow.find('.quantityCart').val());
			
			parentRow.find('.quantityCart').val(currentValue);
			
			var newValue = currentValue + 1;
			
			sendValueToServer(newValue, seq_sle);
		});
		
		$('.quantityCart').off('keypress').on('keypress', function (e) {
			
			if (e.which == 13) {
				
				var parentRow = $(this).closest('tr');
				var seq_sle = parentRow.data('seq-sle');
				var newValue = parseInt($(this).val());
				
				if (!isNaN(newValue) && newValue >= 1) {
					sendValueToServer(newValue, seq_sle);
				}
			}
		});
		
		function sendValueToServer(value, seq_sle) {
			
			var myData = { count: value, seq_sle: seq_sle };
			
			$.ajax({
				type: "POST",
				url: "/front/basket/basketCount.json",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(myData),
				success: function (res) {
					
					var resArray = Array.isArray(res) ? res : [res];
					
					if (resArray.length > 0) {
						
						var summary = resArray[0];
						
						$('#totalItems').text(summary.seq_sle_count);
						
						var formattedTotalPrice = new Intl.NumberFormat().format(summary.total_price_sum) + "원";
						$('#totalPrice').text(formattedTotalPrice);
						$('#totalPriceFinal').text(formattedTotalPrice);
						
						var formattedTotalPoint = new Intl.NumberFormat().format(summary.total_point_sum);
						$('#totalPoints').text(formattedTotalPoint);
						
						resArray.forEach((item) => {
							
							var seqSle = item.seq_sle;
							var totalPrice = item.total_price;
							var totalPoint = item.total_point;
							
							var row = $('tr').filter(function () {
								
								return $(this).attr('data-seq-sle') == seqSle;
							});
							
							if (row.length) {
								
								var spantotalprice = row.find('td[data-total-price] span.totalPriceDisplay');
								var spantotalpoint = row.find('td[data-total-point] span.totalPointDisplay');
								
								if (spantotalprice.length && spantotalpoint.length) {
									
									var formattedPrice = new Intl.NumberFormat().format(totalPrice) + "원";
									var formattedPoint = new Intl.NumberFormat().format(totalPoint);
									
									spantotalprice.text(formattedPrice);
									spantotalpoint.text(formattedPoint);
									
									spantotalprice.closest('td').attr('data-total-price', totalPrice);
									spantotalpoint.closest('td').attr('data-total-point', totalPoint);
								}
							}
						});
					}
				},
			});
		}
	});
</script>
</form>
</body>
</html>