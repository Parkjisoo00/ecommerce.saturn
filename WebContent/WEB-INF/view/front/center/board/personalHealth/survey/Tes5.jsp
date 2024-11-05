	<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/sale/function_list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	<c:if test="${empty sessionScope.SEQ_MBR}">
	var isLogin = false;
	</c:if>
	
	<c:if test="${not empty sessionScope.SEQ_MBR}">
	var isLogin = true;
	</c:if>
	
	function setBasket() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/basket/setBasket.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
	}
	
	function setBasketOne(value, value2, value3,value4, value5, value6, value7, value8, value9, value10) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var subFrmMain = document.getElementById("subFrmMain");
		
		subFrmMain.sle_nm.setAttribute("value", value2);
		subFrmMain.discount_sale.setAttribute("value", value3);
		subFrmMain.basketCount.setAttribute("value", value4);
		subFrmMain.img.setAttribute("value", value5);
		subFrmMain.point_stack.setAttribute("value", value6);
		subFrmMain.basketCd_ctg_m.setAttribute("value", value7);
		subFrmMain.basketCd_ctg_b.setAttribute("value", value8);
		subFrmMain.price_sale.setAttribute("value", value9);
		subFrmMain.discount.setAttribute("value", value10);
		subFrmMain.basketSeq_sle.setAttribute("value", value);
		
		subFrmMain.action = "/front/basket/setBasket.web";
		subFrmMain.target = "frmBlank";
		subFrmMain.submit();
	}
	
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.goSeq_sle.setAttribute("value", value);
		frmMain.goCd_ctg_m.setAttribute("value", value2);
		frmMain.goCd_ctg_b.setAttribute("value", value3);
		
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
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
	<%@ include file="/include/front/bannergnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<section class="checkout spad" >
		<div class="container">
		<form id="subFrmMain" method="POST">
			<input type="hidden" name="basketList[0].point_stack"		id="point_stack"/>
			<input type="hidden" name="basketList[0].discount_sale"		id="discount_sale"/>
			<input type="hidden" name="basketList[0].img"				id="img"/>
			<input type="hidden" name="basketList[0].seq_sle"			id="basketSeq_sle"/>
			<input type="hidden" name="basketList[0].sle_nm"			id="sle_nm"/>
			<input type="hidden" name="basketList[0].cd_ctg_m"			id="basketCd_ctg_m"/>
			<input type="hidden" name="basketList[0].cd_ctg_b"			id="basketCd_ctg_b"/>
			<input type="hidden" name="basketList[0].price_sale"		id="price_sale"/>
			<input type="hidden" name="basketList[0].discount"			id="discount"/>
			<input type="hidden" name="basketList[0].count"				id="basketCount"	value="0" />
		</form>
			<form id="frmMain" method="POST" class="checkout__form">
			<input type="hidden" name="cd_survey_type"			id="cd_survey_type"/>
			<input type="hidden" name="gender"					id="gender"				value="${surveyDto.gender}"/>
			<input type="hidden" name="mbr_nm"					id="mbr_nm"				value="${surveyDto.mbr_nm}"/>
			<input type="hidden" name="user_age"				id="user_age"			value="${surveyDto.user_age}"/>
			<input type="hidden" name="seq_sle"					id="goSeq_sle"			value="0"/>
			<input type="hidden" name="cd_ctg_m"				id="goCd_ctg_m"/>
			<input type="hidden" name="cd_ctg_b"				id="goCd_ctg_b"/>
			<!-- 
			<c:forEach var="surveyListDto" items="${surveyListDto}"	varStatus="status">
				<input type="hidden" name="basketList[${status.index}].point_stack"		id="point_stack"	value="${surveyListDto.point_stack}" />
				<input type="hidden" name="basketList[${status.index}].discount_sale"	id="discount_sale"	value="${surveyListDto.discount_sale}" />
				<input type="hidden" name="basketList[${status.index}].img"				id="img"			value="${surveyListDto.img}" />
				<input type="hidden" name="basketList[${status.index}].seq_sle"			id="seq_sle"		value="${surveyListDto.seq_sle}" />
				<input type="hidden" name="basketList[${status.index}].sle_nm"			id="sle_nm"			value="${surveyListDto.sle_nm}" />
				<input type="hidden" name="basketList[${status.index}].cd_ctg_m"		id="cd_ctg_m"		value="${surveyListDto.cd_ctg_m}" />
				<input type="hidden" name="basketList[${status.index}].cd_ctg_b"		id="cd_ctg_b"		value="${surveyListDto.cd_ctg_b}" />
				<input type="hidden" name="basketList[${status.index}].price_sale"		id="price_sale"		value="${surveyListDto.price_sale}" />
				<input type="hidden" name="basketList[${status.index}].discount"		id="discount"		value="${surveyListDto.discount}" />
				<input type="hidden" name="basketList[${status.index}].count"			id="basketCount"	value="1" />
			</c:forEach>
			 -->
				
				
				
				
				
				
				<div class="row"style="display: flex; justify-content: center; align-items: center; margin-bottom: 30px !important;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						${surveyDto.user_age} / ${surveyDto.mbr_nm}
						<c:if test="${surveyDto.gender == 'M'}">
						남성
						</c:if>
						<c:if test="${surveyDto.gender == 'F'}">
						여성
						</c:if>
					</div>
					
					<c:forEach var="surveyListDto" items="${surveyListDto}"	varStatus="status">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
					<a href="javascript:goWriteForm('${surveyListDto.seq_sle}', '${surveyListDto.cd_ctg_m}', '${surveyListDto.cd_ctg_b}');">상세보기이동</a>
					
					${surveyListDto.img}(이미지) / ${surveyListDto.sle_nm}(상품명)
						<input type="hidden" name="basketList[${status.index}].point_stack"		id="point_stack"	value="${surveyListDto.point_stack}" />
						<input type="hidden" name="basketList[${status.index}].discount_sale"	id="discount_sale"	value="${surveyListDto.discount_sale}" />
						<input type="hidden" name="basketList[${status.index}].img"				id="img"			value="${surveyListDto.img}" />
						<input type="hidden" name="basketList[${status.index}].seq_sle"			id="seq_sle"		value="${surveyListDto.seq_sle}" />
						<input type="hidden" name="basketList[${status.index}].sle_nm"			id="sle_nm"			value="${surveyListDto.sle_nm}" />
						<input type="hidden" name="basketList[${status.index}].cd_ctg_m"		id="cd_ctg_m"		value="${surveyListDto.cd_ctg_m}" />
						<input type="hidden" name="basketList[${status.index}].cd_ctg_b"		id="cd_ctg_b"		value="${surveyListDto.cd_ctg_b}" />
						<input type="hidden" name="basketList[${status.index}].price_sale"		id="price_sale"		value="${surveyListDto.price_sale}" />
						<input type="hidden" name="basketList[${status.index}].discount"		id="discount"		value="${surveyListDto.discount}" />
						<input type="hidden" name="basketList[${status.index}].count"			id="basketCount"	value="1" />
					<div class="checkout__form__input">
						<input type="button" value="개별 장바구니 담기" style="width: 100%; text-align: center;" id="registerId"
						 onClick="setBasketOne('${surveyListDto.seq_sle}', '${surveyListDto.sle_nm}', '${surveyListDto.discount_sale}', '1',
						 ${surveyListDto.img}', '${surveyListDto.point_stack}', '${surveyListDto.cd_ctg_m}', '${surveyListDto.cd_ctg_b}', '${surveyListDto.price_sale}', '${surveyListDto.discount}');"/>
					</div>
					</div>
					</c:forEach>
					
					<div class="checkout__form__input">
						<input type="button" value="전체 상품 장바구니 담기" style="width: 100%; text-align: center;" id="registerId" onClick="setBasket();"/>
					</div>
				</div>
				
				
			</form>
		</div>
	</section>

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>