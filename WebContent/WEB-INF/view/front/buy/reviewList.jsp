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
	
	function reviewWriteForm(value, value2, value3, value4) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.seq_buy_dtl.setAttribute("value", value4);
		frmMain.action="/front/buy/reviewWriteForm.web";
		frmMain.submit();
	}
	
	function reviewModifyForm(value, value2, value3, value4, value5) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.seq_buy_dtl.setAttribute("value", value4);
		frmMain.seq_review.setAttribute("value", value5);
		frmMain.action="/front/buy/reviewModifyForm.web";
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
<input type="hidden" name="seq_review"		id="seq_review" value="0"/>
<input type="hidden" name="currentPage"		id="currentPage"	value="${paging.currentPage}"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<ul class="my-custom-ul" >
				<li><a style="font-size :30px" href="/front/myPage/" class="menuLnb">	마이 페이지</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/modifyForm.web" class="menuLnb">개인정보 수정</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="javascript:goList(3);" class="menuLnb">문의 이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">포인트</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">맞춤건강 결과표</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/myLike.web" class="menuLnb">찜한 상품</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/buy/reviewListPage.web" class="menuLnb">리뷰관리</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/buy/history.web" class="menuLnb">구매이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/withdraw.web" class="menuLnb">회원 탈퇴</a></li>
	</ul>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="padding: 0;">
					<div class="product__details__tab" style="padding-left: 17px !important; padding-right: 17px !important; padding-top: 0px !important;">
						<ul class="nav nav-tabs" role="tablist" style="margin-bottom: 40px !important; border: 1px solid #d9d9d9 !important; display: flex !important; justify-content: space-between !important;">
							<li class="nav-item" style="padding-top: 10px !important; padding-bottom: 10px !important; flex: 1 !important; text-align: center !important; display: flex !important; align-items: center !important; justify-content: center !important; margin-right: 0px !important; border-right: 1px solid #d9d9d9 !important;">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" style="display: inline-block !important;">상품후기 작성 (${count})</a>
							</li>
							<li class="nav-item" style="padding-top: 10px !important; padding-bottom: 10px !important; flex: 1 !important; text-align: center !important; display: flex !important; align-items: center !important; justify-content: center !important;">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" style="display: inline-block !important;">작성한 후기(${reviwCount})</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<h6 class="cart-title" style="font-weight: normal !important; margin-bottom: 0px !important; ">*이미지를 클릭하면 상품으로 이동합니다</h6>
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
														<div style="padding-right: 20px !important; display: flex; flex-direction: column; flex-grow: 1;">
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
														<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; width: 25% !important; height: auto !important; flex-shrink: 0 !important; overflow: hidden !important;">
															<a href="javascript:reviewWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}', '${list.seq_buy_dtl}');" class="cart-btn" style="border-radius: 0px !important; background: white; color: #346aff !important; border: 1px solid #346aff !important; margin: 0; padding: 7px 7px 7px !important; text-align: center !important;">
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
							<h6 class="cart-title" style="font-weight: normal !important; margin-bottom: 0px !important; ">*상품명을 클릭하면 상품으로 이동합니다.</h6>
							<div class="review-form" style="display: flex; flex-direction: column; border-top: 0px !important; margin: 0px !important; width: 100% !important; padding-bottom: 20px !important;">
								<c:choose>
									<c:when test="${empty reviewList}">
										<div class="review-name" style="border-bottom: 0px !important; padding: 20px 20px 20px 30px !important; display: block !important; text-align: center; ">
											<p style="margin-bottom: 200px !important; margin-top: 200px !important; display: inline-block; text-align: center;">
												등록된 상품후기가 없습니다.
											</p>
										</div>
									</c:when>
										<c:otherwise>
											<c:forEach var="review" items="${reviewList}">
												<div class="review-title" style="border-bottom: 0px !important; border-top: 1px solid #aaa !important; padding-left: 0px !important; padding-top: 0px !important">
													<div class="review-name" style="padding: 10px 15px !important; border-top: 0px !important;">
														<div class="photoreview" style="width: unset !important; display: inline-block; padding: 0 !important;">
															<a href="javascript:goWriteForm('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}');">
																<img src="${review.img}" style="width: 50px !important; height: 50px !important; vertical-align: middle !important;">
															</a>
														</div>
														<div class="product-name" style="flex-grow: 1; display: flex; justify-content: space-between; align-items: center; padding: 0px !important">
															<div style="padding-right: 20px !important; display: flex; flex-direction: column; flex-grow: 1;">
																<div class="product-name" style="margin-left: 20px !important; padding: 0px !important; font-weight: normal !important; font-size: 14px !important; color: #346aff !important;">
																	<a style="font-weight: normal !important; font-size: 14px !important; color: #346aff !important;" href="javascript:goWriteForm('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}');">${review.sle_nm}</a>, ${review.count}개
																</div>
															</div>
															<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; width: 25% !important; height: auto !important; flex-shrink: 0 !important; overflow: hidden !important;">
																<span>
																<a href="javascript:reviewModifyForm('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}', '${review.seq_buy_dtl}', '${review.seq_review}');" style="padding-right: 2px !important; margin-right: 5px !important; border-right: 1px solid #d5d5d5 !important;color: #346aff !important; margin: 0; text-align: center !important; font-size: 14px !important">
																 수정
																</a>
																<a href="javascript:#('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}', '${review.seq_buy_dtl}', '${review.seq_review}');" style="color: #346aff !important; margin: 0; text-align: center !important; font-size: 14px !important">
																 삭제
																</a>
																</span>
															</div>
														</div>
													</div>
													<div style="padding: 10px 15px !important; margin-top: 10px !important">
														<div class="product-name" style="padding: 0px !important; display: flex; align-items: center;">
															<div class="rating" style="display: flex; align-items: center;">
																<c:if test="${review.mbr_rate_star == 1}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 2}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 3}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 4}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 5}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																</c:if>
															</div>
															<div style="margin-left: 5px; display: flex;">
																<span class="reviewsub" style="font-family: Dotum, 돋움, Helvetica, AppleSDGothicNeo, Arial, sans-serif !important; padding-top: 5px; font-size: 12px !important; color: #888 !important;">
																	${review.dt_reg}
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="review-name" style="padding: 10px 15px !important; border-bottom: 0px !important; border-top: 0px !important;">
													<c:choose>
														<c:when test="${empty review.imgs}">
															<div class="photoreview" style="display: inline-block; padding-bottom: 20px !important; padding-left: 0px !important; padding-top: 0px !important; width: auto !important;">
																<h6 class="cart-title" style="padding-bottom: 0px !important; margin-bottom: 0px !important; font-weight: normal !important;">*등록된 상품후기 이미지가 없습니다.</h6>
															</div>
														</c:when>
														<c:otherwise>
															<c:forEach var="imgs" items="${review.imgs}">
																<div class="photoreview" style="display: inline-block; padding: 0px !important; width: auto !important;">
																	<img src="/img/review/${imgs}" style="width: 70px; height: 80px; object-fit: cover;">
																</div>
															</c:forEach>	
														</c:otherwise>
													</c:choose>
												</div>
													<div class="review-name" style="padding: 10px 15px 40px 15px !important; display: block !important; border-top: 0px !important; border-bottom: 0px !important;">
														<div class="reviewsub">
															${review.rate_review}
														</div>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
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