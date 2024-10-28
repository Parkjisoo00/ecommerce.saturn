<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/statistics/index.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		// Google Charts 라이브러리 로드 완료 후 실행
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawCharts);
		
		function drawCharts() {
			// 남성, 여성 데이터 초기화
			var maleDataArray = [['나이대', '수']];
			var femaleDataArray = [['나이대', '수']];
	
			// JSP에서 남성과 여성 데이터를 JavaScript 배열로 추가
			<c:forEach items="${listMemberAge}" var="list">
				<c:choose>
					<c:when test="${list.gender == 'M'}">
						maleDataArray.push(['${list.ageGroup}', ${list.sumAge}]);
					</c:when>
					<c:when test="${list.gender == 'F'}">
						femaleDataArray.push(['${list.ageGroup}', ${list.sumAge}]);
					</c:when>
				</c:choose>
			</c:forEach>
		
			// 남성 데이터 차트
			var maleData = google.visualization.arrayToDataTable(maleDataArray);
			var optionsMale = {
				title: '남성 나이대 통계',
				width: 500,
				height: 400,
				colors: ['#0033ff', '#0099ff', '#00ccff','#00ffff', '#3300ff', '#3333ff'] ,
				pieSliceTextStyle: {
					color: 'black'
					,fontSize: 13
				}
				
			};
			var chartMale = new google.visualization.PieChart(document.getElementById('chart_div_male'));
			chartMale.draw(maleData, optionsMale);
	
			// 여성 데이터 차트
			var femaleData = google.visualization.arrayToDataTable(femaleDataArray);
			var optionsFemale = {
				title: '여성 나이대 통계',
				width: 500,
				height: 400,
				colors: ['#6600ff', '#9900ff', '#9999ff', '#cc99ff', '#ccccff', '#cc00ff'],
				pieSliceTextStyle: {
					color: 'black'
					,fontSize: 13
				}
				
			};
			var chartFemale = new google.visualization.PieChart(document.getElementById('chart_div_female'));
			chartFemale.draw(femaleData, optionsFemale);
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
	<div style="display: flex; justify-content: space-around; align-items: center;">
		<div id="chart_div_male" style="width: 100px; height: 800px;"></div>
		<div id="chart_div_female" style="width: 300px; height: 800px;"></div>
	</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>