<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/cancelForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.submit();
	}
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		frmMain.action="/front/sale/ingredient_list.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
	
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action = "/front/center/board/myPageNotice/list.web";
		frmMain.submit();
	}
	
	function goMyList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;

		frmMain.action = "/front/center/board/myPageNotice/list.web";
		frmMain.submit();
	}
	
	function cancelOrder() {
		
		var frmMain = document.getElementById("frmMain");
		
		var myData = {deal_num: $("#deal_num").val(), seq_sle: $("#seq_sle").val(), seq_buy_mst: $("#seq_buy_mst").val(), seq_buy_dtl: $("#seq_buy_dtl").val(), seq_pay: $("#seq_pay").val()};
		
		$.ajax({
			type: "POST",
			url: "/front/pay/cancleOrder.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function(res) {
				
				
				
				
			},
		});
	}
	</script>
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>
<!-- 
var star = document.querySelector('.fa-star-large');
var value = star.getAttribute('data-value');
alert("평점 확인" + value);
 -->
<body>
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
	<section class="checkout spad" >
		<div class="container">
			<form id="frmMain" method="POST" class="checkout__form">
			<input type="hidden" 	id="seq_sle"			value="${buyDetailDto.seq_sle}"/>
			<input type="hidden" 	id="seq_buy_mst"		value="${buyDetailDto.seq_buy_mst}"/>
			<input type="hidden" 	id="seq_buy_dtl"		value="${buyDetailDto.seq_buy_dtl}"/>
			<input type="hidden" 	id="sle_nm"				value="${buyDetailDto.sle_nm}"/>
			<input type="hidden" 	id="count"				value="${buyDetailDto.count}"/>
			<input type="hidden" 	id="total_price_sum"	value="${buyDetailDto.total_price_sum}"/>
			<input type="hidden" 	id="seq_pay"			value="${buyDetailDto.seq_pay}"/>
			<input type="hidden" 	id="deal_num"			value="${buyDetailDto.deal_num}"/>
				<div class="row"style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-8">
						<h5 style="padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;">주문 취소</h5>
						<div class="cancle-layout">	
							<div class="cancle-top" style=" margin-bottom: 24px !important;">
								<div class="cancle-body" style="font-weight: bold !important;">
									상품정보
								</div>
								<div class="cancle-middle">
									<div style="margin-bottom: 8px !important;">
										<div style="display: flex !important; flex-direction: row !important;">
											<div style="position: relative !important; width: 64px !important; margin-right: 16px !important;">
												<img style="width: 64px !important; height: 64px !important;" src="${buyDetailDto.img}">
											</div>
											<div style="flex: 1 1 0% !important; display: flex !important; user-select: none !important; overflow: hidden !important; align-items: normal !important;">
												<div style="display: flex !important; flex-direction: column !important;">
													<div style="display: flex !important; padding-bottom: 8px !important; line-height: 1.25rem !important;">
														${buyDetailDto.sle_nm}
													</div>
													<div style="padding-bottom: 0px !important;">
														${buyDetailDto.count}개, <fmt:formatNumber value="${buyDetailDto.total_price}" type="number" /> 원
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<span class="cancle-subSpan">환불 정보를 확인해주세요</span>
							<div class="cancle-top" style="margin-bottom: 24px !important;">
								<div class="cancle-body" style="font-weight: bold !important;">
									환불안내
								</div>
								<div class="cancle-middle" style="margin-bottom: 8px !important;">
									<div style="display: flex !important; flex-direction: row !important; width: 100%; justify-content: space-between !important;">
										<div style="display: flex !important; flex-direction: column !important;">
											<div class="cancle-footer" style="margin-bottom: 8px !important;">
												<div style="box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
													상품금액
												</div>
											</div>
										</div>
										<div style="display: flex !important; flex-direction: column !important; text-align: right !important;">
											<div class="cancle-footer" style="margin-bottom: 8px !important;">
												<div style="font-weight: bold !important; font-weight: bold;box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
													<fmt:formatNumber value="${buyDetailDto.total_price}" type="number" /> 원
												</div>
											</div>
										</div>
									</div>
									<div style="display: flex !important; flex-direction: row !important; width: 100%; justify-content: space-between !important;">
										<div style="display: flex !important; flex-direction: column !important;">
											<div class="cancle-footer" style="margin-bottom: 8px !important;">
												<div style="box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
													배송비
												</div>
											</div>
										</div>
										<div style="display: flex !important; flex-direction: column !important; text-align: right !important;">
											<div class="cancle-footer" style="margin-bottom: 8px !important;">
												<div style="font-weight: bold !important; box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
													-2500 원
												</div>
											</div>
										</div>
									</div>
									<div class="cancle-line"></div>
									<div class="cancle-bottom">
										<div style="display: flex !important; flex-direction: row !important; width: 100%; justify-content: space-between !important;">
											<div style="display: flex !important; flex-direction: column !important;">
												<div class="cancle-footer" style="margin-bottom: 8px !important;">
													<div style="font-weight: bold !important; box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
														환불 예상금액
													</div>
												</div>
											</div>
											<div style="display: flex !important; flex-direction: column !important; text-align: right !important;">
												<div class="cancle-footer" style="margin-bottom: 8px !important;">
													<div style="font-weight: bold !important; color: red !important; box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
														<fmt:formatNumber value="${buyDetailDto.total_price_sum}" type="number" /> 원
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="margin-bottom: 24px !important; text-align: right !important;">
								<button type="button" onclick="cancelOrder()" class="cancle-button">주문 취소하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
<!-- Checkout Section end -->

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
</script>
</body>
</html>