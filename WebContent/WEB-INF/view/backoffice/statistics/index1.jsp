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
		google.charts.load('current', {'packages':['line']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var data = new google.visualization.DataTable();
			
			// 월 및 상품명들
			data.addColumn('number', '월');
			<c:forEach var="item" items="${listsellingBestName}">
				data.addColumn('number', '${item.name}');
			</c:forEach>
			
			// 월 및 상품들의 판매 수량
			/*
			data.addRows([
				[3,  10,   8,   0,   0,   0,   0,   0,   0,   0,  12],
				[4,   0,   0,   0,   0,   0,   0,   0,   2,   0,   0],
				[5,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0],
				[7,   0,   0,   3,   0,   0,   0,   0,   0,   0,   0],
				[8,   0,   0,   0,   0,   2,   0,   0,   0,   0,   0],
				[9,   0,   0,   0,   0,   0,   0,   0,   0,   1,   0],
				[10,  0,   0,   0,  13,   0,  11,  11,   0,   0,  12],
			]);
			*/
			data.addRows([
				<c:forEach var="item" items="${listsellingBestList}" varStatus="status">
					<c:set var="month_new" value="${item.month}" />
						<c:if test="${month_new != month_old}">
							[${item.month}, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
						</c:if>
					<c:set var="month_old" value="${item.month}" />
				</c:forEach>
			]);
			
			var options = {
				chart: {
					title: '2024년 많이 팔린 상품 TOP 10',
					subtitle: '월별 판매량',
				},
				width: 1024,
				height: 500
			};
			
			var chart = new google.charts.Line(document.getElementById('linechart_material'));
			chart.draw(data, options);
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
	<div style="display: flex; justify-content: space-around; align-items: center;">
		<div id="linechart_material"></div>
	</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>