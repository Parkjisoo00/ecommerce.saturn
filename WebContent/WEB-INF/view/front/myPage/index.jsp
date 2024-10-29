<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/myPage/" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>

	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
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
		
		frmMain.action = "/front/center/board/myPageNotice/list.web";
		frmMain.submit();
	}
	</script>
</head>
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
						<input type="hidden" name="seq_sle"				id="seq_sle"			/>
						<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"			/>
						<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"			/>
						<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"		/>
						<input type="hidden" name="phone" id="phone" />
							<div class="row"style="display: flex; justify-content: center; align-items: center;">
								<div class="col-lg-12">
									<div class="mydiv1" id="myDiv1" style="width: 100%; display: flex; justify-content: space-between; align-items: center;margin-bottom:100px">
										<span class="styled-span" style="width: 40%; display: flex; justify-content: center; align-items: center;font-weight:700;color:#341d08">
										 <span style="font-size: 25px; font-weight: 700; color: #341d08;">${memberDto.mbr_nm}</span>&nbsp;님 반갑습니다.</span>
										<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;font-weight:700;color:#341d08">포인트:&nbsp;
										<span style="font-size: 25px; font-weight: 700; color: #341d08;">${memberDto.total_point}</span></span>
									</div>
					<h6 class="lowgnb-title" style="padding-bottom: 5px; text-align: left; font-size: 30px;">찜한 상품</h6>
					<div class="mypage-header">
						<h6 class="cart-title" style="font-size:15px">*이미지를 클릭하면 상품으로 이동합니다.</h6>
						<div class="mypage-header-right-group">
							<a href="/front/member/myLike.web" ><h6 class="cart-title" style="font-size:20px">더보기 </h6></a>
							<a href="/front/member/myLike.web" style="padding-bottom: 13px;"><img src="/img/mypage/mypage3.png"></a>
						</div>
					</div>
						<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;margin-bottom:100px">
							<table id="productBasket" class="cart-table">
								<thead style="border-bottom: 1px solid #dbdbdb !important;">
									<tr style="border-color: #707070 !important;">
										<th class="cart-th" style="width: 5%">
										<th class="cart-th" colspan="2">상품정보</th>
										<th class="cart-th" style="width: 20%">상품금액</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr style="text-align: center; border-bottom: 1px solid #707070;">
											<td colspan="4">찜한 상품이 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}" >
											<tr style="border: 0;">
												<td class="cart-td" style="text-align: center; vertical-align: middle;">
													<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden; display: inline-block;">
														<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
															<img class="cart-img" src="${list.img}" class="cart-img">
														</a>
													</div>
												</td>
												<td class="cart-td" style="text-align: left !important;">
													${list.sle_nm}
												</td>
												<td class="cart-td">
												</td>
												<td class="cart-td">
													<div style="display: flex; flex-direction: column; align-items: center;">
													<fmt:formatNumber value="${list.price_sale}" type="number" />원
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</div>
						
						
					<h6 class="lowgnb-title" style="padding-bottom: 5px; text-align: left; font-size: 30px;">구매 이력</h6>
						<div class="mypage-header">
					<h6 class="cart-title" style="font-size:15px">*이미지를 클릭하면 상품으로 이동합니다.</h6>
						<div class="mypage-header-right-group">
							<a href="/front/buy/history.web" ><h6 class="cart-title" style="font-size:20px">더보기 </h6></a>
							<a href="/front/buy/history.web" style="padding-bottom: 13px;"><img src="/img/mypage/mypage3.png"></a>
						</div>
					</div>
						<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;">
							<table id="productBasket" class="cart-table">
								<thead style="border-bottom: 1px solid #dbdbdb !important;">
									<tr style="border-color: #707070 !important;">
										<th class="cart-th" style="width: 5%">
										<th class="cart-th" >상품정보</th>
										<th class="cart-th" style="width: 10%">수량</th>
										<th class="cart-th" style="width: 10%">상품금액</th>
										<th class="cart-th" style="width: 20%">구매일</th>
										<th class="cart-th" style="width: 10%">결제상태</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty historyList}">
										<tr style="text-align: center; border-bottom: 1px solid #707070;">
											<td colspan="6">구매한 상품이 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="historyList" items="${historyList}">
											<tr style="border: 0;">
												
												<td class="cart-td" style="text-align: center; vertical-align: middle;">
												
													<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden; display: inline-block;">
														<a href="javascript:goWriteForm('${historyList.seq_sle}', '${historyList.cd_ctg_m}', '${historyList.cd_ctg_b}');">
															<img class="cart-img" src="${historyList.img}" class="cart-img">
														</a>
													</div>
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${historyList.sle_nm}
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${historyList.count} 개
												</td>
												<td class="cart-td">
													<fmt:formatNumber value="${historyList.price}" type="number" />원
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${historyList.dt_reg}
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${historyList.cd_state}
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
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
</body>
</html>