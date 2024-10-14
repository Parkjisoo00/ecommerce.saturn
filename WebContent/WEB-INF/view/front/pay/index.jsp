<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/pay/index.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
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
			frmMain.target = "";
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
			frmMain.target = "";
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
			frmMain.target = "";
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
			frmMain.target = "";
			frmMain.submit();
		}
	
		function writeProc() {
			
			var frmMain = document.getElementById("frmMain");
			frmMain.action = "/front/buy/writeProc.web";
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
<input type="hidden" id="seq_sle"		name="seq_sle" />
<input type="hidden" id="corp_nm"		name="corp_nm" value="${paging.corp_nm}"/>
<input type="hidden" id="prd_type"		name="prd_type" value="${paging.prd_type}"/>
<input type="hidden" id="filter"		name="filter" value="${paging.filter}"/>
<input type="hidden" id="cd_ctg_m"		name="cd_ctg_m" />
<input type="hidden" id="cd_ctg_b"		name="cd_ctg_b" />
<input type="hidden" id="type"			name="type" />
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
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
									<input class="customer-input" type="text" id="post" name="post" size="5" autocomplete="off" value="${memberDto.post}"/>
									<label for="addr1">도로명</label>
									<input class="customer-input" type="text"	id="addr1"	name="addr1" size="40" autocomplete="off" value="${memberDto.addr1}"/>
									<span id="guide" style="color:#999; display:none"></span>
									<label for="addr2">상세</label>
									<input style="width:40px" class="customer-input" type="text"	id="addr2"	name="addr2" size="20" placeholder="상세 주소" autocomplete="off" value="${memberDto.addr2}"/>
									<input class="customer-button" type="button" onclick="#" value="배송지 변경">
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
									<td class="customer-td2" style="font-weight: bold; font-size: 12px !important;">
										${formatTotalPriceSum}원
										<input type="hidden" id="totalPriceSum" value="${totalPriceSum}">
									</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">포인트적립</td>
									<td class="customer-td2" style="font-weight: bold; font-size: 12px !important;">
										${formatTotalPointSum} 포인트
										<input type="hidden" id="totalPointSum" value="${totalPointSum}">
									</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">포인트사용</td>
									<td class="customer-td2">
										<input name="usePoint" class="customer-input" type="text" style="width:100px; text-align: center; margin-right: 20px;" autocomplete="off" placeholder="포인트 입력" id="pointInput" />
										보유 : <span class="rate" id="totalPoint" style="margin-left: 0px !important;">
											${memberDto.total_point}
										</span> 포인트
									</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">총결제금액</td>
									<td class="customer-td3" id="finalAmountCell">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div style="display: flex; justify-content: flex-end; padding-right: 15px; align-items: flex-start;">
					<div>
						<a href="javascript:writeProc();" class="cart-btn" style="background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c; margin: 0;">
							결제 하기
						</a>
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
	<c:forEach var="list" items="${buyList}" varStatus="status">
		<input type="hidden" name="buyList[${status.index}].seq_sle" value="${list.seq_sle}" />
		<input type="hidden" name="buyList[${status.index}].sle_nm" value="${list.sle_nm}" />
		<input type="hidden" name="buyList[${status.index}].price" value="${list.price}" />
		<input type="hidden" name="buyList[${status.index}].count" value="${list.count}" />
		<input type="hidden" name="buyList[${status.index}].point" value="${list.point}" />
	</c:forEach>
	<script>
	$(document).ready(function () {
		
		var totalPriceSum = Number($('#totalPriceSum').val());
		var totalPoint = Number($('#totalPoint').text());
		var pointInput = $('#pointInput');
		var finalAmountCell = $('#finalAmountCell');
		
		pointInput.on('input keydown', function (event) {
			
			let inputValue = Number($(this).val());
			
			if (isNaN(inputValue) || inputValue < 0) {
				
				$(this).val('');
				alert('유효한 포인트를 입력해주세요.');
				return;
			}
			
			if (event.key === 'Enter') {
				
				event.preventDefault();
				
				if (inputValue > totalPoint) {
					
					alert('보유한 포인트보다 큰 값을 입력할 수 없습니다.');
					inputValue = totalPoint;
					$(this).val(totalPoint);
				}
				
				if (inputValue > totalPriceSum) {
					
					alert('사용할 포인트는 총 상품 금액을 초과할 수 없습니다.');
					inputValue = totalPriceSum;
					$(this).val(totalPriceSum);
				}
				
				let finalPrice = totalPriceSum - inputValue;
				finalAmountCell.text(finalPrice.toLocaleString() + '원');
			}
		});
	});
</script>
</form>
</body>
</html>