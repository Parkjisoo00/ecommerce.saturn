<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/reviewList.jsp" %>
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
	
	function review(value, value2, value3, value4) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.seq_buy_dtl.setAttribute("value", value4);
		frmMain.action="/front/buy/review.web";
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
<form id="frmMain" method="POST">
<input type="hidden" name="seq_sle"			id="seq_sle"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="seq_buy_dtl"		id="seq_buy_dtl" value="0"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<ul class="my-custom-ul" >
				<li><img src="/img/mypage/mypage1.png"><a style="font-size :30px" href="/front/myPage/" class="menuLnb">마이 페이지</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/modifyForm.web" class="menuLnb">개인정보 수정</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="javascript:goList(3);" class="menuLnb">문의 이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">포인트</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">맞춤건강 결과표</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">찜한 상품</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">구매이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/withdraw.web" class="menuLnb">회원 탈퇴</a></li>
	</ul>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12" >
						<div class="review-form" style="display: flex; flex-direction: column; border-top: 0px !important; border-bottom: 1px solid #ddd !important">
							<c:choose>
								<c:when test="${empty list}">
									<div class="review-name" style="border-bottom: 0px !important; padding: 20px 20px 20px 30px !important; display: block !important; text-align: center; ">
										<p style="margin-bottom: 200px !important; margin-top: 200px !important; display: inline-block; text-align: center;">
											작성할 수 있는 상품후기가 없습니다.
										</p>
									</div>
								</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${list}">
										<div class="review-name" style="border-bottom: 0px !important; padding: 20px 20px 20px 30px !important;">
											<div class="photoreview" style="padding: 0px !important;">
												<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
													<img src="${list.img}" style="height: 100px !important;">
												</a>
											</div>
											<div class="product-name" style="flex-grow: 1; padding: 0px !important; display: flex; justify-content: space-between; align-items: center; margin-left: 20px !important; margin-right: 0px !important;">
												<div style="display: flex; flex-direction: column; flex-grow: 1;">
													<div class="product-name" style="padding: 0px !important; font-weight: bold !important;">
														${list.sle_nm}
													</div>
													<div class="product-name" style="padding: 0px !important; font-size: 14px !important;">
														${list.sle_nm}, ${list.count}개
													</div>
													<div class="product-name" style="padding: 0px !important; color: #888 !important; font-size: 14px !important; margin-top: 25px !important; padding-bottom: 5px !important">
														${list.dt_reg}
													</div>
												</div>
												<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px;">
													<a href="javascript:review('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}', '${list.seq_buy_dtl}');" class="cart-btn" style="border-radius: 0px !important; background: white; color: #346aff !important; border: 1px solid #346aff !important; margin: 0; padding: 7px 7px 7px !important;">
														후기 작성하기
													</a>
												</div>
											</div>
										</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
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
</form>
</body>
</html>