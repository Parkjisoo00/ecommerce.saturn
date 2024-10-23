<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/users/member/modifyForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	
	<script>
	
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" action="/console/users/member/modifyProc.web">
<input type="hidden" name="seq_mbr" value="${memberDto.seq_mbr}"/>	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<section>
	<div class="content-wrapper" >
		<article class="txtCenter">
			
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">성명</th>
					<td>
						${memberDto.mbr_nm}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;">성별</th>
					<td>
					<c:choose>
						<c:when test="${memberDto.gender == 'M'}">남</c:when>
						<c:otherwise>여</c:otherwise>
					</c:choose>
					</td>
				</tr>	
				<tr>
					<th style="width: 150px;">나이</th>
					<td>
						${memberDto.age}
					</td>
				</tr>
				<tr>
					<th>이메일(아이디)</th>
					<td colspan="3">
						${memberDto.email} / 
						<select name="cd_state" style="background:#F0F0F0">
							<option value="0"<c:if test="${memberDto.cd_state == 0}"> selected</c:if>>대기</option>
							<option value="1"<c:if test="${memberDto.cd_state == 1}"> selected</c:if>>사용중</option>
							<option value="2"<c:if test="${memberDto.cd_state == 2}"> selected</c:if>>반려</option>
							<option value="8"<c:if test="${memberDto.cd_state == 8}"> selected</c:if>>자퇴</option>
							<option value="9"<c:if test="${memberDto.cd_state == 9}"> selected</c:if>>강퇴</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="3">
						${fn:split(memberDto.phone, '-')[0]} - ${fn:split(memberDto.phone, '-')[1]} - ${fn:split(memberDto.phone, '-')[2]}
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">
						${memberDto.post} ${memberDto.addr1} ${memberDto.addr2}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;">포인트 총합</th>
					<td>
						${memberDto.total_point}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;">마지막 접속 일시</th>
					<td>
						${memberDto.last_dt}
					</td>
				</tr>
				<tr>
					<th>마케팅 수신 동의</th>
					<td colspan="3">
						SMS <input type="checkbox"<c:if test="${memberDto.flg_sms == 'Y'}"> checked</c:if>/>
						Email <input type="checkbox"<c:if test="${memberDto.flg_email == 'Y'}"> checked</c:if>/>
					</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align:center; padding-top: 10px;padding-bottom: 10px">
						<input type="submit" value="수정 하기" style="width:100px" />
						<input type="button" value="목록" style="width:100px" onclick="location.href='/console/users/member/list.web';"/>
					</td>
				</tr>
			</table>
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