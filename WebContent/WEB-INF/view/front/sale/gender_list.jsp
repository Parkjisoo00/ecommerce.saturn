<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/gender_list.jsp" %>
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
	
	function goTypeG(value, value2, value3, value4, value5, selectElement) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		frmMain.elements["linePerPage"].value = selectElement.value;
		frmMain.action = "/front/sale/gender_list.web";
		frmMain.submit();
	}
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		frmMain.action="/front/sale/gender_list.web";
		frmMain.submit();
	}
	
	function goWriteForm(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.action="/front/buy/writeForm.web";
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
		<%@ include file="/include/front/middlegnb.jsp" %>
	<!-- Breadcrumb End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<%@ include file="/include/front/lowgnbG.jsp" %>
			<div class="row">
				<div class="col-lg-9 col-md-9">
					<div class="row">
						<c:choose>
							<c:when test="${empty list}">
								<div class="col-12 d-flex justify-content-center align-items-center" style="height: 600px;">
									<p>상품이 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${list}">
									<div class="col-lg-4 col-md-6">
										<input type="hidden" name="cd_ctg_b" id="cd_ctg_b" value="${list.cd_ctg_b}" />
										<div class="product__item">
											<a href="javascript:goWriteForm(${list.seq_sle});">
												<div class="product__item__pic set-bg" data-setbg="${list.img}">
												<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
													<div class="label new">베스트</div>
												</c:if>
												</div>
											</a>
											<div class="product__item__text">
												<h6 style="line-height: 1.5em; min-height: 3em;"><a href="#" style="font-size: 15px;">${list.sle_nm}</a></h6>
													<div class="rating">
														<c:if test="${list.average_rate == 1}">
															<i class="fa fa-star"></i><span style="margin-left: 10px; color: #346aff; font-size: 13px; font-weight: bold;">${list.count}개 상품평</span>
														</c:if>
														<c:if test="${list.average_rate == 2}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i><span style="margin-left: 10px; color: #346aff; font-size: 13px; font-weight: bold;">${list.count}개 상품평</span>
														</c:if>
														<c:if test="${list.average_rate == 3}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i><span style="margin-left: 10px; color: #346aff; font-size: 13px; font-weight: bold;">${list.count}개 상품평</span>
														</c:if>
														<c:if test="${list.average_rate == 4}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i><span style="margin-left: 10px; color: #346aff; font-size: 13px; font-weight: bold;">${list.count}개 상품평</span>
														</c:if>
														<c:if test="${list.average_rate == 5}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i><span style="margin-left: 10px; color: #346aff; font-size: 13px; font-weight: bold;">${list.count}개 상품평</span>
														</c:if>
													</div>
												<c:choose>
													<c:when test="${list.discount == null || list.discount == 0}">
														<div class="product__price"><span style="text-decoration: none; font-size: 1.3em; color: black;">${list.price_sale}</span>원</div>
													</c:when>
													<c:otherwise>
														<div class="product__price"><span>${list.price_sale}</span> <span style="text-decoration: none; color : red">-${list.discount}%</span><span style="text-decoration: none; color: black; font-size: 1.3em">${list.discount_sale}</span>원</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
							<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

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