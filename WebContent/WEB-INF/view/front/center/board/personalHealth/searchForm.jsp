<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/searchForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>	
	function searchView(value) {
		
		console.log("받아온 값 log 확인" + value);
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.prdlst_report_no.setAttribute("value", value);
		
		frmMain.action = "/front/center/board/personalHealth/searchView.web";
		frmMain.submit();
	}
	</script>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain">
<input type="hidden" name="prdlst_report_no"	id="prdlst_report_no"/>
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
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="lowgnb-title" style="padding-bottom: 20px; text-align: left; font-weight: bold; font-size: 36px;">안심 조회 서비스</h6>
						<div style="margin-bottom: 20px !important">
							<div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 20px !important;">
								<input class="search-container" type="text" id="prdlst_nm" name="prdlst_nm" onkeydown="checkEnter(event)" />
								<a class="health-btn" href="javascript:item_search();" style="margin-left: 10px;">
									검색
								</a>
							</div>
						</div>
						<h6 class="cart-title" style="margin-bottom: 10px !important; font-size: 14px !important;">* 안심 조회 서비스에서는 모든 건강기능식품 정보(수출용 포함)를 제공합니다</h6>
						<div class="shop__cart__table">
							<table class="cart-table" style="border-bottom: 1px solid #818181; border-top: 1px solid #818181;">
								<thead>
									<tr>
										<th class="health-head" style="background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">제품명</th>
										<th class="health-head" style="width: 20% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">제조사명</th>
										<th class="health-head" style="width: 15% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">신고번호</th>
										<th class="health-head" style="width: 10% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">등록일</th>
									</tr>
								</thead>
								<tbody id="dataBody">
									<tr>
										<td colspan="4" class="health-body" style="text-align: center !important; line-height: 100px !important;">
											조회를 대기중입니다.
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
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
	function item_search() {
		
		var myData = {prdlst_nm: $("#prdlst_nm").val()};
		
		$.ajax({
			type: "POST",
			url: "/front/board/searchItem.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function (res) {
				
				var responseDto = res.responseDto;
				var tableBody = $('#dataBody');
				
				tableBody.empty();
				
				if (responseDto && responseDto.C003 && Array.isArray(responseDto.C003.row) && responseDto.C003.row.length > 0) {
					
					var rows = responseDto.C003.row;
					
					rows.forEach(function(item) {
						
						var tr = $('<tr></tr>');
						
						tr.on('click', function() {
							
							searchView("'" + item.PRDLST_REPORT_NO + "'");
						});
						tr.css('cursor', 'pointer');
						
						var date = item.PRMS_DT;
						var formattedDate = date.substring(0, 4) + '-' + date.substring(4, 6) + '-' + date.substring(6);
						
						tr.append('<td class="health-body">' + item.PRDLST_NM + '</td>');
						tr.append('<td class="health-body" style="text-align: center !important;">' + item.BSSH_NM + '</td>');
						tr.append('<td class="health-body" style="text-align: center !important;">' + item.PRDLST_REPORT_NO + '</td>');
						tr.append('<td class="health-body" style="text-align: center !important;">' + formattedDate + '</td>');
						
						tableBody.append(tr);
					});
				} else {
					
					var noDataTr = $('<tr></tr>');
					noDataTr.append('<td colspan="4" class="health-body" style="text-align: center !important; line-height: 100px !important;">검색 결과가 없습니다.</td>');
					
					tableBody.append(noDataTr);
				}
			},
		});
	}
	
	function checkEnter(event) {
	
		if (event.keyCode === 13) {
			
			event.preventDefault();
			item_search();
		}
	}
</script>
</form>
</body>
</html>