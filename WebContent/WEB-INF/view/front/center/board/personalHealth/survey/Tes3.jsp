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
	
	function surveyProc(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_survey_type.setAttribute("value", value);
		
		frmMain.action="/front/center/board/surveyProc.web";
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
			<input type="hidden" name="cd_survey_type"								id="cd_survey_type"/>
			<input type="hidden" name="gender"										id="gender"			value="${surveyDto.gender}"/>
			<input type="hidden" name="mbr_nm"										id="mbr_nm"			value="${surveyDto.mbr_nm}"/>
			<input type="hidden" name="user_age"									id="user_age"		value="${surveyDto.user_age}"/>
			<c:forEach var="surveyListDto" items="${surveyListDto}"	varStatus="status">
				<input type="hidden" name="surveyList[${status.index}].cd_ctg_m"	id="surveyList[${status.index}].cd_ctg_m"	value="${surveyListDto.cd_ctg_m}" />
				<input type="hidden" name="surveyList[${status.index}].cd_ctg_b"	id="surveyList[${status.index}].cd_ctg_b"	value="${surveyListDto.cd_ctg_b}" />
			</c:forEach>
				
				<div class="row"style="display: flex; justify-content: center; align-items: center; margin-bottom: 30px !important;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						<input type="checkbox" name="cd_ctg" value="11"/>기능별1
						<input type="checkbox" name="cd_ctg" value="12"/>기능별2
						<input type="checkbox" name="cd_ctg" value="13"/>기능별3
						<input type="checkbox" name="cd_ctg" value="14"/>기능별4
						<input type="checkbox" name="cd_ctg" value="15"/>기능별5
						<input type="checkbox" name="cd_ctg" value="16"/>기능별6
						<input type="checkbox" name="cd_ctg" value="17"/>기능별7
						<input type="checkbox" name="cd_ctg" value="18"/>기능별8
						<input type="checkbox" name="cd_ctg" value="19"/>기능별9
					</div>
					<div class="checkout__form__input">
						<input type="button" value="다음" style="width: 100%; text-align: center;" id="registerId" onClick="surveyProc('4');"/>
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
</body>
</html>