<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/faq/list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
	<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	
	function goView(value) {

		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_bbs").value = value;
		
		frmMain.action="/front/center/board/view.web";
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
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- 페이지의 상단 로고 바로 밑에 출력되는 전체 상품 / 기능별 / 성분별 / 대상별 / 맞춤 건강 / 고객센터 / 소개 메뉴 -->
		<%@ include file="/include/front/middlegnb.jsp" %>
	<!-- Breadcrumb End -->

	<section class="shop spad">
		<div class="container">
			<div class="col-lg-12" style="padding: 0 !important;">
		<div>
			<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">자주 찾는 질문</h6>
			<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none">
			<c:choose>
				<c:when test="${paging.cd_bbs_type == 1}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #346aff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1대1 문의 사항</a>
				</c:when>
				<c:otherwise>
					<c:if test="${paging.cd_bbs_type == 2}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #346aff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1대1 문의 사항</a>
					</c:if>
					<c:if test="${paging.cd_bbs_type == 3}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #346aff; border: 1px solid #cccccc; border-radius: 10px;">1대1 문의 사항</a>
					</c:if>
				</c:otherwise>
			</c:choose>
		</h6>
		</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12">
				<table class="headTop_01" style=" margin-left: auto; margin-right: auto; width: 100%">
				<tr>
					<th style="width: 5%">NO</th>
					<th>제목</th>
					<th style="width: 15%">작성시간</th>
					<th style="width: 7%">조회수</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4">등록된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>
									${list.rnum}
								</td>
								<td style="text-align: left">
									<c:if test="${list.flg_top == 'Y'}">[공지] </c:if>
										<a href="javascript:goView(${list.seq_bbs});">
										${list.title}
										</a>
								</td>
								<td>
									${list.dt_reg}
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</table>
					<div class="row">
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
</form>
</body>
</html>