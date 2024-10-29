<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/deliveryView.jsp" %>
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
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	
	function goMyList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		document.getElementById("currentPage").remove();
		
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
				<div class="row"style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-8">
						<h5 style="font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;">배송 조회</h5>
						<div class="delivery_div_head" style="border-radius: 2px !important; padding: 22px 0px 17px !important;">
							<div style="font-size: 28px !important;">
							${memberDto.dt_reg}<span style="font-size: 23px !important;"> 일</span>
							</div>
							<c:if test="${memberDto.cd_state_delivery == 'C'}">
							<div style="margin-top: 8px !important; font-size: 18px !important;">
							고객님이 주문하신 상품이 <span style="font-size: 28px !important;">판매 확인중</span>입니다.
							</div>
							</c:if>
							<c:if test="${memberDto.cd_state_delivery == 'P'}">
							<div style="margin-top: 8px !important; font-size: 18px !important;">
							고객님이 주문하신 상품이 <span style="font-size: 28px !important;">배송 준비중</span>입니다.
							</div>
							</c:if>
							<c:if test="${memberDto.cd_state_delivery == 'D'}">
							<div style="margin-top: 8px !important; font-size: 18px !important;">
							고객님이 주문하신 상품이 <span style="font-size: 28px !important;">배송중</span>입니다.
							</div>
							</c:if>
							<c:if test="${memberDto.cd_state_delivery == 'Y'}">
							<div style="margin-top: 8px !important; font-size: 18px !important;">
							고객님이 주문하신 상품이 <span style="font-size: 28px !important;">배송 완료</span> 되었습니다.
							</div>
							</c:if>
						</div>
						<div class="delivery_div_head" style="background: white !important; height: 200px !important; padding: 15px 10px 10px !important; border-radius: 2px !important;">
							<div style="text-align: left; padding-bottom: 15px !important;">
								<span style="margin-right: 30px !important;">상품 정보</span>${memberDto.sle_nm}, ${memberDto.count}개
							</div>
							<div style="text-align: left;">
								<span style="margin-right: 30px !important;">받는 사람</span>${memberDto.mbr_nm}
							</div>
							<div style="text-align: left;">
								<span style="margin-right: 30px !important;">받는 주소</span>${memberDto.post}<span style="padding-left: 10px !important;">${memberDto.addr1}</span>
							</div>
							<div style="text-align: left;">
								<span style="margin-right: 30px !important;">상세 주소</span>${memberDto.addr2}
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