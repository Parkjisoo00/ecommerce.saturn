<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/statistics/index1.jsp" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<c:set var="arrayBest" value="" />
			<c:forEach var="item" items="${listsellingBestName}" varStatus="status_best">
				<c:set var="seq_sle">${item.seq_sle}</c:set>
				<c:if test="${status_best.index == 0}">
					<c:set var="arrayBest" value="${seq_sle}" />
				</c:if>
				<c:if test="${status_best.index != 0}">
					<c:set var="arrayBest" value="${arrayBest += ',' += seq_sle}" />
				</c:if>
				data.addColumn('number', '${status_best.index + 1}. ${fn:substring(item.name, 0, 10)} ...');
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
			
			// 대상 상품: <c:out value="${arrayBest}" />
			data.addRows([
				<c:forEach var="list" items="${listsellingBestList}" varStatus="status_list">
					<c:set var="month_before" value="${list.month}" />
					
					<c:if test="${month_before != month_after}">
						[${list.month}
					</c:if>
					
					<c:if test="${month_before == month_after}">
						${list.month}
						<c:forEach var="row" items="${fn:split(arrayBest, ',')}" varStatus="status_row">
							<c:if test="${row == list.seq_sle}">
							, ${list.count}
							</c:if>
							<c:if test="${row != list.seq_sle}">
							, 0
							</c:if>
						</c:forEach>
						],
					</c:if>
						
					<c:set var="month_after" value="${list.month}" />
				</c:forEach>
			]);
			
			var options = {
				chart: {
					title: '월 판매량 TOP 3 상품',
					subtitle: '2024년 기준',
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