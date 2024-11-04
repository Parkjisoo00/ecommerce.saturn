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
			<form id="frmMain" method="POST" class="checkout__form">
				
				
				<div class="row"style="display: flex; justify-content: center; align-items: center; margin-bottom: 30px !important;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						내용1
					</div>
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