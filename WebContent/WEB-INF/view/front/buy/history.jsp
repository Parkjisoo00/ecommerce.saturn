<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/history.jsp" %>
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
		
		frmMain.action="/front/member/myLike.web";
		frmMain.submit();
	}
	
	function setBasket(value, value2, value3,value4, value5, value6,value7, value8, value9, value10) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.sle_nm.setAttribute("value", value2);
		frmMain.discount_sale.setAttribute("value", value3);
		frmMain.count.setAttribute("value", value4);
		frmMain.img.setAttribute("value", value5);
		frmMain.point_stack.setAttribute("value", value6);
		frmMain.cd_ctg_m.setAttribute("value", value7);
		frmMain.cd_ctg_b.setAttribute("value", value8);
		frmMain.price_sale.setAttribute("value", value9);
		frmMain.discount.setAttribute("value", value10);
		
		var item = value + "|" + value2 + "|" + value3 + "|" +1+ "|" + value5 + "|" + value6 + "|" + value7 + "|" + value8 + "|" +  value9 + "|" + value10;
		document.getElementById("item").value = item;
		
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/front/basket/setBasket.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
	}
	
	function delivery(value, value2) {
	
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_buy_mst.setAttribute("value", value);
		frmMain.seq_mbr_addr.setAttribute("value", value2);
		
		frmMain.action="/front/buy/buyDelivertView.web";
		frmMain.submit();
	}
	
	function cancelForm(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_buy_mst.setAttribute("value", value);
		
		frmMain.action="/front/pay/cancelForm.web";
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

<body>
<form id="frmMain" method="POST">
<input type="hidden" name="item"				id="item"/>
<input type="hidden" name="point_stack"			id="point_stack"		value="0"/>
<input type="hidden" name="discount_sale"		id="discount_sale"		value="0"/>
<input type="hidden" name="img"					id="img"				/>
<input type="hidden" name="seq_sle"				id="seq_sle"			value="0"/>
<input type="hidden" name="sle_nm"				id="sle_nm"				/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"			/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"			/>
<input type="hidden" name="count"				id="count"				value="0"/>
<input type="hidden" name="price_sale"			id="price_sale"			value="0"/>
<input type="hidden" name="discount"			id="discount"			value="0"/>
<input type="hidden" name="seq_buy_dtl"			id="seq_buy_dtl"		value="0"/>
<input type="hidden" name="seq_buy_mst"			id="seq_buy_mst"		/>
<input type="hidden" name="seq_mbr_addr"		id="seq_mbr_addr"		value="0"/>
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"		/>
<input type="hidden" name="currentPage"			id="currentPage"	value="${paging.currentPage}"/>

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

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad" style="min-height: calc(100vh - 100px);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="lowgnb-title" style="padding-bottom: 20px; text-align: left; font-size: 35px;">주문 목록</h6>
					<h6 class="cart-title">*이미지를 클릭하면 상품으로 이동합니다</h6>
						<div class="shop__cart__table">
						<c:choose>
							<c:when test="${empty buyList}">
								<div class="history-div">
									<p style="margin-bottom: 100px !important; margin-top: 100px !important; text-align: center;">
										등록된 주문 정보가 없습니다.
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="buyList" items="${buyList}">
									<div class="history-div">
										<div class="history-head">
											<div class="history-head-title">${buyList.dt_reg} 주문</div>
											<div class="history-head-subtitle">
												<a href="javascript:delivery('${buyList.seq_buy_mst}', '${buyList.seq_mbr_addr}');" class="cart-btn" style="font-weight: normal; padding: 9px 15px 9px !important; font-size: 15px !important; margin-top: 0px !important; background: white; color: rgb(52, 106, 255) !important; border: 1px solid rgb(52, 106, 255);">배송조회 확인</a>
												<a href="javascript:cancelForm('${buyList.seq_buy_mst}');" class="cart-btn" style="font-weight: normal; margin-right: 10px !important; padding: 9px 15px 9px !important; font-size: 15px !important; margin-top: 0px !important; background: white; color: #2c2c2c; border: 1px solid rgb(221, 221, 221);">주문취소 신청</a>
											</div>
										</div>
										<div class="history-table-div">
											<table id="productBasket" class="cart-table">
												<tbody>
													<c:forEach var="buyDatas" items="${buyList.buyDatas}">
														<tr style="border: 0;">
															<td class="cart-td" style="text-align: center; vertical-align: middle;">
																<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden; display: inline-block;">
																	<a href="javascript:goWriteForm('${buyDatas.seq_sle}', '${buyDatas.cd_ctg_m}', '${buyDatas.cd_ctg_b}');">
																		<img class="cart-img" src="${buyDatas.img}" class="cart-img">
																	</a>
																</div>
															</td>
															<td class="cart-td" style="text-align: left !important; font-size: 16px !important;">
																<div>
																${buyDatas.sle_nm}
																</div>
																<div style="color: rgb(85, 85, 85) !important;">
																<fmt:formatNumber value="${buyDatas.price}" type="number" />원 ${buyDatas.count}개
																</div>
															</td>
															<td class="cart-td" style="text-align: right !important; padding-right: 0px !important; padding-left: 0px !important;">
																	<a href="javascript:setBasket('${buyDatas.seq_sle}', '${buyDatas.sle_nm}', '${buyDatas.discount_sale}', '${buyDatas.count}'
																	, '${buyDatas.img}', '${buyDatas.point_stack}', '${buyDatas.cd_ctg_m}', '${buyDatas.cd_ctg_b}', '${buyDatas.price_sale}', '${buyDatas.discount}');" 
																	class="cart-btn" style="letter-spacing: -0.5px !important; margin-left:10px !important; margin-right:15px !important; padding: 9px 15px 9px !important; font-weight: normal; font-size: 13px !important; color: #2c2c2c; border: 1px solid rgb(221, 221, 221); margin-top:0px;">장바구니 담기</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div style="margin-top: 10px !important;"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div style="text-align: center; width: 1000px; margin-top: 20px; color: black !important;">
							<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<div id="loadingSpinner" style=" display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;">
	<img src="https://i.gifer.com/ZZ5H.gif" alt="Loading..." style="width: 50px; height: 50px;">
</div>
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
</script>
</form>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>