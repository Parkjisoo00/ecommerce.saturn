<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/cancelForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
<style>
#modalOverlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: transparent;
	display: none;
	z-index: 9998;
	font-family: 돋움, Dotum, sans-serif !important;
}

#resultModal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	width: 300px;
	border-radius: 4px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center; /* 텍스트 가운데 정렬 */
	font-family: 돋움, Dotum, sans-serif !important;
	display: none;
	z-index: 9999;
}

#buttonContainer {
	width: 100%;
	text-align: center; /* 버튼을 가로 중앙 정렬 */
	margin-top: 15px;
}

#closeModalBtn {
	cursor: pointer;
	background: white;
	color: #346aff !important;
	border: 1px solid #346aff;
	padding: 4px 12px;
	border-radius: 4px;
	font-weight: 600;
	font-size: 14px;
	font-family: 돋움, Dotum, sans-serif !important;
	font-weight: normal;
}
</style>
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
			<input type="hidden" 	id="cd_state"			value="${buyDetailDto.cd_state}"/>
				<div class="row"style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-8">
						<c:if test="${buyDetailDto.cd_state == 1}">
							<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;">주문 취소</h5>
						</c:if>
						<c:if test="${buyDetailDto.cd_state == 2}">
							<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;"><span style="font-weight:normal !important; font-size: 20px !important;">${buyDetailDto.dt_upt}의</span > 주문 취소가 <span style="font-weight:normal !important; font-size: 20px !important;">${buyDetailDto.dt_reg}에</span> 처리중입니다.</h5>
						</c:if>
						<c:if test="${buyDetailDto.cd_state == 3}">
							<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;"><span style="font-weight:normal !important; font-size: 20px !important;">${buyDetailDto.dt_upt}의</span > 교환 신청이 <span style="font-weight:normal !important; font-size: 20px !important;">${buyDetailDto.dt_reg}에</span> 처리중입니다.</h5>
						</c:if>
						<c:if test="${buyDetailDto.cd_state == 4}">
							<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;"><span style="font-weight:normal !important; font-size: 20px !important;">${buyDetailDto.dt_upt}의</span > 환불 신청이 <span style="font-weight:normal !important; font-size: 20px !important;">${buyDetailDto.dt_reg}에</span> 처리중입니다.</h5>
						</c:if>
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
							<div style="display: flex; gap: 20px; justify-content: flex-end;">
							<c:choose>
								<c:when test="${buyDetailDto.cd_state == 1}">
									<div style="margin-bottom: 24px; text-align: right;">
										<button type="button" onclick="cancelOrder('2')" class="cancle-button">주문 취소</button>
									</div>
									<div style="margin-bottom: 24px; text-align: right;">
										<button type="button" onclick="cancelOrder('3')" class="cancle-button" style="background: white !important; color: #346aff !important; border: 1px solid #346aff;">교환 신청</button>
									</div>
									<div style="margin-bottom: 24px; text-align: right;">
										<button type="button" onclick="cancelOrder('4')" class="cancle-button" style="background: white !important; color: #346aff !important; border: 1px solid #346aff;">환불 신청</button>
									</div>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<div id="modalOverlay"></div>
	<div id="resultModal">
		<div id="modalMessage" style="font-weight: bold;"></div>
		<div id="buttonContainer">
			<button id="closeModalBtn">닫기</button>
		</div>
	</div>
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
	function cancelOrder(value) {
		
		var cd_state = value;
		
		var myData = {
				
			deal_num: $("#deal_num").val(),
			seq_sle: $("#seq_sle").val(),
			seq_buy_mst: $("#seq_buy_mst").val(),
			seq_buy_dtl: $("#seq_buy_dtl").val(),
			seq_pay: $("#seq_pay").val(),
			cd_state: cd_state
		};
		
		$.ajax({
			
			type: "POST",
			url: "/front/pay/cancleOrder.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function(res) {
				
				$("#modalMessage").text(res.message);
				$("#modalOverlay").show();
				$("#resultModal").show();
			},
		});
	}
	
	$(document).on('click', '#closeModalBtn', function() {
		
		$('#modalOverlay').hide();
		$('#resultModal').hide();
		
		window.location.href = "/front/buy/history.web";
	});
</script>
</body>
</html>