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
				<div class="col-lg-12" style="padding: 0;">
					<div class="product__details__tab" style="padding-left: 100px !important; padding-right: 100px !important;">
						<ul class="nav nav-tabs" role="tablist" style="border: 1px solid #d9d9d9 !important; padding-top: 10px !important; padding-bottom: 10px !important; border-left: 0px !important; border-right: 0px !important;">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품후기 작성</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">작성한 후기</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="review-form" style="border-top: 0px !important; border-bottom: 1px solid #ddd !important">
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
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="row">
									<div class="col-lg-12 col-md-12" >
												<div class="review-form" style="display: flex; flex-direction: column; border-top: 0px !important; margin: 0px !important; width: 100% !important; padding-bottom: 25px !important; margin-bottom: 20px !important">
													<div class="review-title" style="border-bottom: 0px !important; border-top: 0px !important; padding-left: 0px !important; padding-top: 0px !important">
														<div>
															<span class="reviewsub" style="font-weight: bold !important; font-size: 14px !important;">이름</span>
														</div>
														<div>
															<div class="product-name" style="padding: 0px !important; display: flex; align-items: center;">
																<div class="rating" style="display: flex; align-items: center;">
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</div>
															<div style="margin-left: 5px; display: flex;">
																<span class="reviewsub" style="padding-top: 5px; font-size: 12px !important;">
																	날짜
																</span>
															</div>
																	</div>
																</div>
																<div style="margin-top: 10px !important;">
																	<span class="reviewsub" style="font-size: 12px !important;">상품명, 수량개</span>
																</div>
															</div>
															<div class="review-name" style="border-bottom: 0px !important; padding-left: 0px !important; border-top: 0px !important; margin-top: 5px !important">
																<div class="photoreview" style="display: inline-block; padding-right: 5px !important; padding-left: 0px !important; padding-top: 0px !important; width: auto !important;">
																	<img src="/img/review/이미지" style="width: 70px; height: 80px; object-fit: cover;">
																	이미지
																</div>
															</div>
															<div class="review-name" style="display: block !important; padding-left: 0px !important; border-top: 0px !important; border-bottom: 0px !important;">
																<div class="reviewsub">
																	리뷰 내용
																</div>
															</div>
														</div>
										<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
											<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
										</div>
									</div>
								</div>
							</div>
						</div>
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
$(document).ready(function() {
	
	$('<style>.nav::before { display: none; }</style>').appendTo('head');
	$('<style>.nav::after { display: none; }</style>').appendTo('head');
});
</script>
</form>
</body>
</html>