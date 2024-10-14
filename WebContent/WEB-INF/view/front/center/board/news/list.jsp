<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/news/list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style></style>
</head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
	function goView(value) {

		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_bbs").value = value;
		
		frmMain.action="/front/center/board/view.web";
		frmMain.submit();
	}
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		
		frmMain.action="/front/center/board/list.web";
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
<input type="hidden" name="seq_bbs"		id="seq_bbs" />
<input type="hidden" name="a"		id="a" value="${paging.register}"/>
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
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

	<section class="shop spad">
		<div class="container">
			<div class="col-lg-12" style="padding: 0 !important;">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
					<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">새소식</h6>
						<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none"></h6>
						<div class="brdSearchArea">
						<div style="display: flex; justify-content: flex-end;margin-bottom: 10px;">
							<select name="searchKey">
								<option value="title"<c:if test="${paging.searchKey == 'title'}"> selected</c:if>>제목</option>
								<option value="contents"<c:if test="${paging.searchKey == 'contents'}"> selected</c:if>>내용</option>
								<option value="title+contents"<c:if test="${paging.searchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
							</select>
							<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> 
							<input type="submit" value="검색"/>
						</div>
						
						<div class="row">
						<div class="col-lg-12 col-md-12">
							<div class="brdInfo">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</div>
								<table class="headTop_01" style=" margin-left: auto; margin-right: auto; width: 100%">
									<tr>
										<th style="width: 5%">NO</th>
										<th style="text-align: left; padding-left: 100px;">제목</th>
										<th style="width: 15%">등록일</th>
									</tr>
									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="6">등록된 글이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${list}" var="list">
												<tr>
													<td>
														${list.rnum}
													</td>
													<td style="text-align: left; padding-left: 100px;">
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
									<br/>
									<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;" >
										<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
									</div>
									<br/>
									<br/>
									<br/>
								</div>
							</div>
						</div>
						</div>
						</div>
				</div>
			</div>
		</div>
		</div>
	</section>
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
</form>
</body>
</html>