<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/writeForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>
	<script>
	<c:if test="${empty sessionScope.SEQ_MBR}">
	var isLogin = false;
	</c:if>
	
	<c:if test="${not empty sessionScope.SEQ_MBR}">
	var isLogin = true;
	</c:if>
	
	function setLike(value) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var seq_sle	= document.getElementById("seq_sle").value;
		var myData = { flg_like: value, seq_sle: seq_sle };
		
		$.ajax({
			type: "POST",
			url: "/front/sale/setLike.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function(res) {
				
				// alert("받아온 값" + res.flg_like);
				
				if (res.flg_like === 'Y') {
					$('.like-button').attr({
						'style': 'padding: 5px !important; border-radius: 50% !important; background-color: #ca1515 !important; transition: background-color 1s ease !important;',
						'href': 'javascript:delLike(\'N\');'
					});
					$('.icon_heart_alt').attr(
							'style', 'color: white !important;'
					);
					
					var likeButtonOffset = $('.like-button').offset();
					$('#setlike-alert').css({
						
						'top': (likeButtonOffset.top - $('#setlike-alert').outerHeight() - 20) + 'px',
						'left': likeButtonOffset.left + 'px'
					}).fadeIn(400).delay(1500).fadeOut(400);
				}
			},
		});
	}
	
	function delLike(value) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var seq_sle	= document.getElementById("seq_sle").value;
		var myData = { flg_like: value, seq_sle: seq_sle };
		
		$.ajax({
			type: "POST",
			url: "/front/sale/delLike.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function(res) {
				
				if (res.flg_like === 'N') {
					
					$('.like-button').attr({
						
						'style': 'background-color: white !important; transition: background-color 0.5s ease !important;',
						'href': 'javascript:setLike(\'Y\');'
					});
					$('.icon_heart_alt').attr(
						'style', 'font-size: 18px !important; color: #666666 !important; display: flex !important; align-items: center !important; justify-content: center !important; transform: translateY(14px) !important;'
					);
					
					var likeButtonOffset = $('.like-button').offset();
					$('#dellike-alert').css({
						
						'top': (likeButtonOffset.top - $('#dellike-alert').outerHeight() - 20) + 'px',
						'left': likeButtonOffset.left + 'px'
					}).fadeIn(400).delay(1500).fadeOut(400);
				}
			},
		});
	}
		
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
	
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function setBasket() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var seq_sle			= document.getElementById("seq_sle").value;
		var sle_nm			= document.getElementById("sle_nm").value;
		var discount_sale	= document.getElementById("discount_sale").value;
		var count			= document.getElementById("count").value;
		var img				= document.getElementById("img").value;
		var point_stack		= document.getElementById("point_stack").value;
		var cd_ctg_m		= document.getElementById("cd_ctg_m").value;
		var cd_ctg_b		= document.getElementById("cd_ctg_b").value;
		var price_sale		= document.getElementById("price_sale").value;
		var discount		= document.getElementById("discount").value;
		
		var item = seq_sle + "|" + sle_nm + "|" + discount_sale + "|" + count + "|" + img + "|" + point_stack + "|" + cd_ctg_m + "|" + cd_ctg_b + "|" + price_sale + "|" + discount;
		document.getElementById("item").value = item;
		
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/front/basket/setBasket.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
	}
	
	function checkOut() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/front/pay/index.web";
		frmMain.target = "";
		frmMain.submit();
	}
		
	function reviewListPage() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}

		frmMain.action = "/front/buy/reviewListPage.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
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
<input type="hidden" name="item"				id="item"/>
<input type="hidden" name="point_stack"			id="point_stack"	value="${saleDto.point_stack}"/>
<input type="hidden" name="discount_sale"		id="discount_sale"	value="${saleDto.discount_sale}"/>
<input type="hidden" name="img"					id="img"			value="${saleDto.img}"/>
<input type="hidden" name="seq_sle"				id="seq_sle"		value="${saleDto.seq_sle}"/>
<input type="hidden" name="sle_nm"				id="sle_nm"			value="${saleDto.sle_nm}"/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"		value="${saleDto.cd_ctg_m}"/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"		value="${saleDto.cd_ctg_b}"/>\
<input type="hidden" name="price_sale"			id="price_sale"		value="${saleDto.price_sale}"/>
<input type="hidden" name="discount"			id="discount"		value="${saleDto.discount}"/>
<input type="hidden" name="corp_nm"				id="corp_nm"		value="${saleDto.corp_nm}"/>
<input type="hidden" name="prd_type"			id="prd_type"		value="${saleDto.prd_type}"/>
<input type="hidden" name="filter"				id="filter">
<input type="hidden" name="type"				id="type"/>
<input type="hidden" name="currentPage"			id="currentPage"	value="${paging.currentPage}"/>
<input type="hidden" name="buyList[0].img"							value="${saleDto.img}"/>
<input type="hidden" name="buyList[0].seq_sle"						value="${saleDto.seq_sle}"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->
	
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6" style="display: flex; justify-content: center; align-items: center;">
					<div class="product__details__pic">
						<img data-hash="product-1" class="product__big__img" src="/img/product/${saleDto.img}" alt="판매상품 이미지" style="width: 450px; height: 450px; cursor: pointer" onclick="window.open(this.src)">
					</div>
				</div>
				<div class="col-lg-6" style="padding-right: 0;">
					<div class="product__details__text">
						<h6 class="pd-main">${saleDto.sle_nm}</h6>
						<input type="hidden" name="buyList[0].sle_nm" value="${saleDto.sle_nm}" />
						<div class="product__details__widget">
							<div class="rating">
								<c:if test="${saleDto.star == 0}">
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 1}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 2}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 3}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 4}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
							</div>
							<ul class="pd-ul">
								<li>
									<div>
									<span class="pd-title">원가</span>
										<label for="stockin" class="pd-label">
											<span class="pd-text"><fmt:formatNumber value="${saleDto.price_sale}" type="number" /></span>
											<span class="pd-text">원</span>
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">판매가</span>
										<label for="stockin" class="pd-label">
											<span class="pd-text" style="color: #ff4c2e !important;"><fmt:formatNumber value="${saleDto.discount_sale}" type="number" /></span>
											<span class="pd-text">원</span>
											<input type="hidden" name="buyList[0].price"value="${saleDto.discount_sale}" />
											<span class="pd-text" style="color: #ff4c2e !important;">(${saleDto.discount}%)</span>
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">적립 포인트</span>
										<label for="stockin" class="pd-label">
											<span class="pd-text">${saleDto.point_value}</span>
											<span class="pd-text">적립</span>
											<span class="pd-text" style="color: #346aff !important;">(${saleDto.point_stack}%)</span>
											<input type="hidden" name="buyList[0].point" value="${saleDto.point_value}" />
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">브랜드</span>
										<label for="stockin" class="pd-label">
											${saleDto.corp_nm}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">제품타입</span>
										<label for="stockin" class="pd-label">
											${saleDto.prd_type}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">재고</span>
										<label for="stockin" class="pd-label">
											${saleDto.count_stock}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">등록일${saleDto.flg_like}</span>
										<label for="stockin" class="pd-label">
											${saleDto.dt_reg}
										</label>
									</div>
								</li>
							</ul>
						</div>
						</br>
						<div class="product__details__button" 
							 style="display: flex !important; justify-content: center !important; gap: 10px !important; width: 100% !important;">
						<div class="pro-qty" style="padding: 0px; display: flex !important; align-items: center !important; justify-content: center !important; gap: 10px !important; height: 51px !important;">
							<input type="text" value="1" name="buyList[0].count" id="count" size="3" style="text-align: center !important; font-size: 14px !important; width: 40px; display: inline-block !important;">
						</div>
							<a href="javascript:setBasket();" class="cart-btn" style="display: inline-block !important; margin: 0px !important; background: white; color: #346aff !important; border: 1px solid #346aff">
								<span class="icon_bag_alt"></span> 장바구니 담기
							</a>
							<a href="javascript:checkOut();" class="cart-btn" style="display: inline-block !important; margin: 0px !important;">
								바로구매
							</a>
							<ul style="list-style: none !important; padding: 0 !important; margin: 0 !important; display: flex !important; align-items: center !important; gap: 10px !important;">
								<c:choose>
									<c:when test="${saleDto.flg_like == 'Y'}">
										<li>
											<a class="like-button" href="javascript:delLike('N');" style="background-color: #ca1515 !important; padding: 5px !important; border-radius: 50% !important;">
												<span class="icon_heart_alt" style="color: white !important;"></span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a class="like-button" href="javascript:setLike('Y');"  style="padding: 5px !important; border-radius: 50% !important;">
												<span class="icon_heart_alt"></span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5 class="pd-h5">이런 상품은 어떠세요?</h5><h5 class=pd-subh5>지금 보고 계시는 상품과 관련된 상품들입니다.</h5>
					</div>
				</div>
				<div class="row" style="justify-content: center;">
				<c:forEach var="list" items="${list}">
					<div class="col-lg-3 col-md-6" style="padding: 0px !important;">
						<div class="product__item">
							<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');" style="display: flex; justify-content: center; align-items: center;">
								<div class="product__item__pic set-bg" data-setbg="${list.img}" style="width: 180px; height: 180px;">
								<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
									<div class="label new">베스트</div>
								</c:if>
								</div>
							</a>
							<div class="product__item__text">
								<h6 style="line-height: 1.5em; min-height: 3em;"><a style="font-size: 15px;">${list.sle_nm}</a></h6>
									<div class="rating">
										<c:if test="${list.star == 0}">
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 1}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 2}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 3}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 4}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
										<c:if test="${list.star == 5}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i><span class="rate">${list.total_count}개 상품평</span>
										</c:if>
									</div>
								<c:choose>
									<c:when test="${list.discount == null || list.discount == 0}">
										<div class="product__price">
											<span style="text-decoration: none; font-size: 1.3em; color: black;">
												<fmt:formatNumber value="${list.price_sale}" type="number" />
											</span>원</div>
									</c:when>
									<c:otherwise>
										<div class="product__price">
											<span><fmt:formatNumber value="${list.price_sale}" type="number" /></span>
											 <span style="text-decoration: none; color : #ff4c2e">-${list.discount}%</span>
											 <span style="text-decoration: none; color: black; font-size: 1.3em">
											 	<fmt:formatNumber value="${list.discount_sale}" type="number" />
											 </span>원</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="col-lg-12" style="padding: 0;">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품상세정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">상품후기 (${reviewCount.review_count})</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품 Q&A</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div style="display: flex; justify-content: center; align-items: center; height: 100%;">
									<img src="/img/product/${saleDto.desces}" alt="">
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								
									<div style="text-align: right;">
										<c:if test="${saleDto.flg_review == 'N'}">
											<a href="javascript:reviewListPage();" class="cart-btn" style="font-size: 12px !important; font-weight: normal !important; cursor: pointer; background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c; margin: 0; padding: 5px 10px 5px !important;">
												상품후기 쓰기
											</a>
										</c:if>
										<c:if test="${saleDto.flg_review == 'Y'}">
											<a href="javascript:reviewListPage();" class="cart-btn" style="font-size: 12px !important; font-weight: normal !important; cursor: pointer; background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c; margin: 0; padding: 5px 10px 5px !important;">
												리뷰관리
											</a>
											<h6 class="cart-title" style="padding-top: 5px !important; padding-bottom: 0px !important; margin-bottom: 0px !important; font-weight: normal !important; text-align: right !important;">*이미 등록된 상품후기가 있습니다. 리뷰관리로 이동합니다.</h6>
										</c:if>
									</div>
								<div class="row">
									<div class="col-lg-12 col-md-12" >
									<c:choose>
										<c:when test="${empty reviewList}">
											<div class="col-lg-12 col-md-12 d-flex justify-content-center align-items-center" style="height: 400px;">
												<p>등록된 상품후기가 없습니다.</p>
											</div>
										</c:when>
											<c:otherwise>
												<c:forEach var="review" items="${reviewList}">
												<div class="review-form" style="display: flex; flex-direction: column; border-top: 0px !important; margin: 0px !important; width: 100% !important; padding-bottom: 25px !important; margin-bottom: 20px !important">
													<div class="review-title" style="border-bottom: 0px !important; border-top: 0px !important; padding-left: 0px !important; padding-top: 0px !important">
														<div>
															<span class="reviewsub" style="font-weight: bold !important; font-size: 14px !important;">${review.mbr_nm}</span>
														</div>
														<div>
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
																<span class="reviewsub" style="padding-top: 5px; font-size: 12px !important;">
																	${review.dt_reg}
																</span>
															</div>
																	</div>
																</div>
																<div style="margin-top: 10px !important;">
																	<span class="reviewsub" style="font-size: 12px !important;">${review.sle_nm}</span>
																</div>
															</div>
															<div class="review-name" style="border-bottom: 0px !important; padding-left: 0px !important; border-top: 0px !important; margin-top: 5px !important">
															<c:choose>
																<c:when test="${empty review.imgs}">
																	<div class="photoreview" style="display: inline-block; padding-bottom: 20px !important; padding-left: 0px !important; padding-top: 0px !important; width: auto !important;">
																		<h6 class="cart-title" style="padding-bottom: 0px !important; margin-bottom: 0px !important; font-weight: normal !important;">*등록된 상품후기 이미지가 없습니다.</h6>
																	</div>
																</c:when>
																<c:otherwise>
																	<c:forEach var="imgs" items="${review.imgs}">
																		<div class="photoreview" style="display: inline-block; padding-right: 5px !important; padding-left: 0px !important; padding-top: 0px !important; width: auto !important;">
																			<img src="/img/review/${imgs}" style="width: 70px; height: 80px; object-fit: cover;">
																		</div>
																	</c:forEach>	
																</c:otherwise>
															</c:choose>
															</div>
															<div class="review-name" style="display: block !important; padding-left: 0px !important; border-top: 0px !important; border-bottom: 0px !important;">
																<div class="reviewsub">
																	${review.rate_review}
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
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<p>[TODO] 1대1 문의 게시판 코드 적용</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div id="dellike-alert" style="display: none; position: absolute; background-color: white; color: #333; padding: 10px 20px; border-radius: 5px; z-index: 9999; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); font-size: 16px; border: 1px solid #ddd;">
		찜에서 삭제했습니다.
	</div>
	<div id="setlike-alert" style="display: none; position: absolute; background-color: white; color: #333; padding: 10px 20px; border-radius: 5px; z-index: 9999; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); font-size: 16px; border: 1px solid #ddd;">
		찜에 등록되었습니다.
	</div>

	</section>
	<!-- Product Details Section End -->

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
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>