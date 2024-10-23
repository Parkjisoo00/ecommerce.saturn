<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/users/member/list.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<style>
	
	</style>
	<script>
	
	function goModifyForm(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_state").remove();
		
		document.getElementById("seq_mbr").value = value;
		frmMain.action="/console/users/member/modifyForm.web";
		frmMain.submit();
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		frmMain.action="/console/users/member/list.web";
		frmMain.submit();
	}
	
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" action="/console/users/member/list.web">
<input type="hidden" name="seq_mbr"		id="seq_mbr" />
<input type="hidden" name="cd_state"	id="cd_state" />
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<section>
	<div class="content-wrapper" >
		<article class="txtCenter" style="padding-top: 150px;">
		<div style="position: relative; width: 900px; margin-left: auto; margin-right: auto;">
			<div class="brdSearchArea" style="float: right; position: relative; top: -20px;">
				<select name="searchKey">
					<option value="email"<c:if test="${paging.searchKey == 'email'}"> selected</c:if>>이메일</option>
					<option value="mbr_nm"<c:if test="${paging.searchKey == 'mbr_nm'}"> selected</c:if>>성명</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> <input type="submit" value="검색"/>
			</div>
			<div class="brdInfo" style="position: relative; top: 10px;">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
			<br/>
			<br/>
			<table class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">NO</th>
					<th>이메일(아이디)</th>
					<th style="width: 10%">상태</th>
					<th style="width: 15%">성명</th>
					<th style="width: 10%">구분</th>
					<th style="width: 10%">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="6">등록된 구매자(회원)가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>
								${list.rnum}
							</td>
							<td class="txtRight">
								<a href="javascript:goModifyForm(${list.seq_mbr});">
									<bravomylifeTag:masking text="${list.email}" letter="*" count="13" mode="right" />
								</a>
							</td>
							<td>
								<select style="background:#F0F0F0" disabled>
									<option value="0"<c:if test="${list.cd_state == 0}"> selected</c:if>>대기</option>
									<option value="1"<c:if test="${list.cd_state == 1}"> selected</c:if>>사용중</option>
									<option value="2"<c:if test="${list.cd_state == 2}"> selected</c:if>>반려</option>
									<option value="8"<c:if test="${list.cd_state == 8}"> selected</c:if>>자퇴</option>
									<option value="9"<c:if test="${list.cd_state == 9}"> selected</c:if>>강퇴</option>
								</select>
							</td>
							<td>
								<bravomylifeTag:masking text="${list.mbr_nm}" letter="*" count="1" mode="left" />
							</td>
							<td>
								<c:choose>
									<c:when test="${list.gender == 'M'}">남</c:when>
									<c:otherwise>여</c:otherwise>
								</c:choose>
							</td>
							<td>
								${list.dt_reg}
							</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<br/>
			<div style="text-align: center; position: relative; top: 30px; left: -30px;">
			<bravomylifeTag:page styleID="admin_text" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
			</div>
		</div>
		</article>
	</div>
</section>	
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>
