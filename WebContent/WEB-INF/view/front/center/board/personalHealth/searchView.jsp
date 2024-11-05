<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/searchView.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>	
	
	</script>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain">
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
					<h6 class="lowgnb-title" style="padding-bottom: 40px; text-align: left; font-weight: bold; font-size: 36px;">${rowDataDto.prdlst_nm}</h6>
						<h6 class="cart-title" style="padding-left:4px !important; margin-bottom: 10px !important; font-size: 18px !important; color: rgb(7, 42, 131) !important; font-weight: bold !important;"><span></span>상세정보</h6>
						<div class="shop__cart__table" style="border-radius: 6px !important; border: 1px solid #e0e0e0 !important;">
							<table class="cart-table">
								<tbody>
									<tr>
										<th class="health-head">
										제조사명
										</th>
										<td class="health-body">
										${rowDataDto.bssh_nm}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										제품명
										</th>
										<td class="health-body">
										${rowDataDto.prdlst_nm}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										신고번호
										</th>
										<td class="health-body">
										${rowDataDto.prdlst_report_no}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										등록일자
										</th>
										<td class="health-body">
										${rowDataDto.prms_dt}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										소비기한
										</th>
										<td class="health-body">
										${rowDataDto.pog_daycnt}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										성상
										</th>
										<td class="health-body">
										${rowDataDto.dispos}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										섭취량/섭취 방법
										</th>
										<td class="health-body">
										${rowDataDto.ntk_mthd}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										포장재질(방법)
										</th>
										<td class="health-body">
										${rowDataDto.prdt_shap_cd_nm}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										보존 및 유통기준
										</th>
										<td class="health-body">
										${rowDataDto.cstdy_mthd}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										섭취 시 주의사항
										</th>
										<td class="health-body">
											<div id="iftknAtntMatrCnContent">${rowDataDto.iftkn_atnt_matr_cn}</div>
										</td>
									</tr>
									<tr>
										<th class="health-head">
										기능성 내용
										</th>
										<td class="health-body">
											<div id="primaryFncltyContent">${rowDataDto.primary_fnclty}</div>
										</td>
									</tr>
									<tr>
										<th class="health-head">
										기준 및 규격
										</th>
										<td class="health-body">
											<div id="stdrStndContent">${rowDataDto.stdr_stnd}</div>
										</td>
									</tr>
									<tr>
										<th class="health-head">
										기능성 원료
										</th>
										<td class="health-body">
										${rowDataDto.rawmtrl_nm}
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
document.addEventListener('DOMContentLoaded', function() {
	
	var contentDiv = document.getElementById('iftknAtntMatrCnContent');
	var contentText = contentDiv.innerHTML;
	
	var items = [];
	var isFirst = true;
	
	var formattedContent = contentText.replace(/(\d+\.\s(?!\())|\d+\)\s?|[\(\)]?[가-힣]\)\s?|[①②③④⑤⑥⑦⑧⑨⑩]\s?/g, function(match) {
		
		if (isFirst) {
			
			isFirst = false;
			return match;
		}
		return '<br>' + match;
	});
	contentDiv.innerHTML = formattedContent;
});

document.addEventListener('DOMContentLoaded', function() {
	
	var contentDiv = document.getElementById('primaryFncltyContent');
	var contentText = contentDiv.innerHTML;
	
	var items = [];
	var isFirst = true;
	
	var formattedContent = contentText.replace(/(\d+\.\s(?!\())|\d+\)\s?|[\(\)]?[가-힣]\)\s?|[①②③④⑤⑥⑦⑧⑨⑩]\s?/g, function(match) {
		
		if (isFirst) {
			
			isFirst = false;
			return match;
		}
		return '<br>' + match;
	});
	contentDiv.innerHTML = formattedContent;
});

document.addEventListener('DOMContentLoaded', function() {
	
	var contentDiv = document.getElementById('stdrStndContent');
	var contentText = contentDiv.innerHTML;
	
	var items = [];
	var isFirst = true;
	
	var formattedContent = contentText.replace(/(\d+\.\s(?!\())|\d+\)\s?|[\(\)]?[가-힣]\)\s?|[①②③④⑤⑥⑦⑧⑨⑩]\s?/g, function(match) {
		
		if (isFirst) {
			
			isFirst = false;
			return match;
		}
		return '<br>' + match;
	});
	contentDiv.innerHTML = formattedContent;
});
</script>
</form>
</body>
</html>