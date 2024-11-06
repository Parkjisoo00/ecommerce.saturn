<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>

<c:if test="${surveyListDto.cd_ctg_b == '3' && surveyListDto.cd_ctg_m == '1'}">
	<h1 class="survey-h1-3">
		<br>추천 상태별 <span style="color:rgb(247, 114, 2);">1</span> - 남성에게 더 알맞은 제품
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '3' && surveyListDto.cd_ctg_m == '2'}">
	<h1 class="survey-h1-3">
		<br>성별 추천 <span style="color:rgb(247, 114, 2);">1</span> - 여성에게 더 알맞은 제품
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '1'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 혈관·혈액 순환
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '2'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 항산화·면역력
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '3'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 염증·항염
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '4'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 뼈·관절
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '5'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 피로감
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '6'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 눈 건강
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '7'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 소화·장
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '8'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 두뇌 활동
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '1' && surveyListDto.cd_ctg_m == '9'}">
	<h1 class="survey-h1-3">
		<br>고객님이 관심있는<span style="color:rgb(247, 114, 2);">2</span> - 위·간
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '1'}">
	<h1 class="survey-h1-3">
		<br>곡물류를 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 폴리코사놀
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '2'}">
	<h1 class="survey-h1-3">
		<br>생선을 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 오메가-3
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '3'}">
	<h1 class="survey-h1-3">
		<br>브로콜리를 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 비타민/미네랄
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '4'}">
	<h1 class="survey-h1-3">
		<br>요거트를 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 유산균
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '5'}">
	<h1 class="survey-h1-3">
		<br>조개류를 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 글루코사민/MSM
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '6'}">
	<h1 class="survey-h1-3">
		<br>시금치를 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 루테인
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '7'}">
	<h1 class="survey-h1-3">
		<br>소고기를 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 코큐텐
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '8'}">
	<h1 class="survey-h1-3">
		<br>호두를 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 아르기닌
	</h1>
</c:if>

<c:if test="${surveyListDto.cd_ctg_b == '2' && surveyListDto.cd_ctg_m == '9'}">
	<h1 class="survey-h1-3">
		<br>밀크씨슬 씨앗을 자주 드시지 않은 고객님께<span style="color:rgb(247, 114, 2);">3</span> - 밀크씨슬
	</h1>
</c:if>
