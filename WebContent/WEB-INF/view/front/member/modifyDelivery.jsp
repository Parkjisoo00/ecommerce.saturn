<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/modifyForm.jsp" %>
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
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>
	function execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					document.getElementById('post').value = data.zonecode;
					document.getElementById('addr1').value = data.roadAddress;
				}
			}).open();
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
						<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"		/>
							<div class="row"style="display: flex; justify-content: center; align-items: center;">
								<div class="col-lg-8">
									<h5 style="font-size :30px; border-bottom: 0px !important;">배송지 관리</h5>
									<div class="shop__cart__table">
										<table class="cart-table" style="border-bottom: 1px solid #818181; border-top: 1px solid #818181;">
											<thead>
												<tr>
													<th class="health-head" style="width:20% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">주소</th>
													<th class="health-head" style="background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">도로명</th>
													<th class="health-head" style="width:25% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">상세</th>
													<th class="health-head" style="width:15% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">등록일</th>
												</tr>
											</thead>
											<tbody id="dataBody">
												<c:choose>
													<c:when test="${empty list}">
														<tr>
															<td colspan="4" class="health-body" style="text-align: center !important; line-height: 100px !important;">
																등록된 배송지가 없습니다.
															</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach var="list" items="${list}">
															<tr style="border-bottom: 0px !important;">
															<td class="health-body" style="text-align: center !important; border-bottom: 0px !important;">
																${list.post}
															</td>
															<td class="health-body" style="text-align: center !important; border-bottom: 0px !important;">
																${list.addr1}
															</td>
															<td class="health-body" style="text-align: center !important; border-bottom: 0px !important;">
																${list.addr2}
															</td>
															<td class="health-body" style="text-align: center !important; border-bottom: 0px !important;">
																${list.dt_reg}
																
															</td>
															</tr>
														<tr>
															<td style="padding-bottom: 15px !important; padding-top: 0px !important; text-align: center; vertical-align: middle;">
																<span style="display: inline-flex; gap: 10px; align-items: center;">
																	<a class="reviewBtn" href="javascript:deliveryWriteForm('${list.seq_mbr_addr}');">
																		수정
																	</a>
																	<a class="reviewBtn" href="javascript:deliveryDel('${list.seq_mbr_addr}');">
																		삭제
																	</a>
																</span>
															</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
									<div class="row">
										<!-- 주소 -->
										<div class="col-lg-12 col-md-6 col-sm-6">
											<div class="checkout__form__input">
											<p style="font-family: 'Noto Sans KR', sans-serif !important;">주소 <span>*</span></p>
												<input type="text" id="post" name="post" size="5"/>
													<label for="addr1">도로명</label>
												<input type="text"	id="addr1" name="addr1" size="40"/>
												<span id="guide" style="color:#999; display:none"></span>
													<label for="addr2">상세</label>
												<input type="text"	id="addr2" name="addr2" size="20" placeholder="상세 주소" />
												<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>
										<!-- 수정 버튼 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<input type="button" value="추가하기" style="width: 100%; text-align: center;" id="registerId" onClick="checkModifyDelivery();"/>
											</div>
										</div>
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
<script>
	function checkModifyDelivery() {
		
	var isSubmit	= true;
	var frmMain		= document.getElementById("frmMain");
	
	if (document.getElementById("post").value == ""
			|| document.getElementById("addr1").value == ""
			|| document.getElementById("addr2").value == "") {
		alert("필수 항목을 입력하세요!");
		isSubmit = false;
	}
	
		if (isSubmit) {
			
			$.ajax({
				type: "POST",
				url: "/front/member/deliveryCheck.json",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				success: function(res) {
					
					if (res.check) {
						
						ModifyDeliveryProc();
					}
					else {
						
						alert("배송지는 2개까지 추가할 수 있습니다.");
					}
				},
			});
		}
	}
	
	function ModifyDeliveryProc() {
		
		var frmMain = document.getElementById("frmMain");
				
		frmMain.action = "/front/member/modifyDeliveryProc.web";
		frmMain.submit();
	}
</script>
</body>
</html>