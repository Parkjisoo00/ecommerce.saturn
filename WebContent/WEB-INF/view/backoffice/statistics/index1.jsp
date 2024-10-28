<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/statistics/index1.jsp" %>
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
					
			// 차트 6 - 스택된 세로 막대 그래프
			
			var data = google.visualization.arrayToDataTable([
				['날짜', 'Best1', 'Best2', 'Best3', 'Best4', 'Best5', 'Best6', 'Best7', 'Best8', 'Best9', 'Best10'],
				<c:forEach items="${listsellingBest}" var="sales">
					['${sales.month}', ${sales.product1}, ${sales.product2}, ${sales.product3}, ${sales.product4}, ${sales.product5}, ${sales.product6}, ${sales.product7}, ${sales.product8}, ${sales.product9}, ${sales.product10}]
					<c:if test="${!salesStatus.last}">,</c:if>
				</c:forEach>
			]);

			var options = {
				title: '월별 인기 상품 판매 통계',
				width: 800,
				height: 400,
				colors: ['#ccffcc', '#ccff99', '#ccff66', '#ccff33', '#ccff00', '#99ffcc', '#99ff99', '#99ff66', '#99ff33', '#99ff00'],
				isStacked: true
			};

			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_best'));
			chart.draw(data, options);
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
	<div style="display: flex; justify-content: center;">
		<div id="chart_div_best" style="width: 700px; height: 800px;"></div>
	</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>