<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/productReg.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>상품 등록</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="/include/backoffice/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="/include/backoffice/AdminLTE.min.css">
	<link rel="stylesheet" href="/include/backoffice/_all-skins.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>	
	<script>

		window.onload = function () {
			// HTML Editor
			tinymce.init({selector:'textarea'});
		}
	
		function commaValue(input) {
			// 입력된 값에서 콤마를 제거
			let value = input.value.replace(/,/g, '');
			
			// 숫자 형식으로 변환
			let formattedValue = Number(value).toLocaleString();
			
			// 포맷된 값을 다시 입력 필드에 설정
			input.value = formattedValue;
		}
		
		$(function() {
			$('#dt_sale_start').datepicker({ dateFormat: 'yy-mm-dd' });
			$('#dt_sale_end').datepicker({ dateFormat: 'yy-mm-dd' });
		});
	
		function productRegProc() {
			
			var frmMain = document.getElementById("frmMain");
			
			if (document.getElementById("sle_nm").value == ""
					|| document.getElementById("img").value == ""
					|| document.getElementById("price_sale").value == ""
					|| document.getElementById("desces").value == ""
					|| document.getElementById("cd_ctg_b").value == "0"
					|| document.getElementById("cd_ctg_m").value == "0"
					|| document.getElementById("cd_state_sale").value == ""
					|| document.getElementById("prd_type").value == ""
					|| document.getElementById("count_stock").value == 0
					|| document.getElementById("corp_nm").value == ""
					|| document.getElementById("dt_sale_start").value == ""
					|| document.getElementById("dt_sale_end").value == ""
					|| document.getElementById("discount").value == 0
					|| document.getElementById("point_stack").value == 0) {
				alert("필수 항목을 입력하세요!");
				return;
			}
			document.getElementById("price_sale").value = document.getElementById("price_sale").value.replaceAll(",", "");
			
			frmMain.action = "/backoffice/product/productRegProc.web";
			frmMain.submit();
			
		}
	
		function updateCategoryMinor() {
			var cd_ctg_b = document.getElementById("cd_ctg_b").value;
			var cd_ctg_m = document.getElementById("cd_ctg_m");
			
			// 기존 옵션 삭제
			cd_ctg_m.innerHTML = "";
	
			let options = [];
	
			if (cd_ctg_b === "1") { // 기능별
				options = [
					{ value: "1", text: "혈당/혈행/혈압" },
					{ value: "2", text: "항산화/면역력" },
					{ value: "3", text: "염증/항염" },
					{ value: "4", text: "관절/뼈/치아" },
					{ value: "5", text: "피로회복" },
					{ value: "6", text: "눈 건강" },
					{ value: "7", text: "장 건강" },
					{ value: "8", text: "두뇌/기억력" },
					{ value: "9", text: "위/간/갑상선" }
				];
			} else if (cd_ctg_b === "2") { // 성분별
				options = [
					{ value: "1", text: "폴리코사놀" },
					{ value: "2", text: "오메가-3" },
					{ value: "3", text: "비타민/미네랄" },
					{ value: "4", text: "유산균" },
					{ value: "5", text: "글루코사민/MSM" },
					{ value: "6", text: "루테인" },
					{ value: "7", text: "코큐텐" },
					{ value: "8", text: "아르기닌" },
					{ value: "9", text: "밀크씨슬" }
				];
			} else if (cd_ctg_b === "3") { // 대상별
				options = [
					{ value: "1", text: "남성" },
					{ value: "2", text: "여성" }
				];
			}
	
			// 새 옵션 추가
			options.forEach(option => {
				const newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.textContent = option.text;
				cd_ctg_m.appendChild(newOption);
			});
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form action= "/backoffice/product/productRegProc.web"id="frmMain" method="POST" enctype="multipart/form-data">
<div class="wrapper">

<header class="main-header">
	<!-- Logo -->
	<a href="../../index2.html" class="logo">
	<!-- mini logo for sidebar mini 50x50 pixels -->
	<span class="logo-mini"><b>A</b>LT</span>
	<!-- logo for regular state and mobile devices -->
	<span class="logo-lg"><b>Admin</b>LTE</span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
	<!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</a>

	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
		<!-- Messages: style can be found in dropdown.less-->
		<li class="dropdown messages-menu">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<i class="fa fa-envelope-o"></i>
			<span class="label label-success">4</span>
			</a>
			<ul class="dropdown-menu">
			<li class="header">You have 4 messages</li>
			<li>
				<!-- inner menu: contains the actual data -->
				<ul class="menu">
				<li><!-- start message -->
					<a href="#">
					<h4>
						Support Team
						<small><i class="fa fa-clock-o"></i> 5 mins</small>
					</h4>
					<p>Why not buy a new awesome theme?</p>
					</a>
				</li>
				<!-- end message -->
				<li>
					<a href="#">
					<h4>
						AdminLTE Design Team
						<small><i class="fa fa-clock-o"></i> 2 hours</small>
					</h4>
					<p>Why not buy a new awesome theme?</p>
					</a>
				</li>
				<li>
					<a href="#">
					<h4>
						Developers
						<small><i class="fa fa-clock-o"></i> Today</small>
					</h4>
					<p>Why not buy a new awesome theme?</p>
					</a>
				</li>
				<li>
					<a href="#">
					<h4>
						Sales Department
						<small><i class="fa fa-clock-o"></i> Yesterday</small>
					</h4>
					<p>Why not buy a new awesome theme?</p>
					</a>
				</li>
				<li>
					<a href="#">
					<h4>
						Reviewers
						<small><i class="fa fa-clock-o"></i> 2 days</small>
					</h4>
					<p>Why not buy a new awesome theme?</p>
					</a>
				</li>
				</ul>
			</li>
			<li class="footer"><a href="#">See All Messages</a></li>
			</ul>
		</li>
		<!-- Notifications: style can be found in dropdown.less -->
		<li class="dropdown notifications-menu">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<i class="fa fa-bell-o"></i>
			<span class="label label-warning">10</span>
			</a>
			<ul class="dropdown-menu">
			<li class="header">You have 10 notifications</li>
			<li>
				<!-- inner menu: contains the actual data -->
				<ul class="menu">
				<li>
					<a href="#">
					<i class="fa fa-users text-aqua"></i> 5 new members joined today
					</a>
				</li>
				<li>
					<a href="#">
					<i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
					page and may cause design problems
					</a>
				</li>
				<li>
					<a href="#">
					<i class="fa fa-users text-red"></i> 5 new members joined
					</a>
				</li>

				<li>
					<a href="#">
					<i class="fa fa-shopping-cart text-green"></i> 25 sales made
					</a>
				</li>
				<li>
					<a href="#">
					<i class="fa fa-user text-red"></i> You changed your username
					</a>
				</li>
				</ul>
			</li>
			<li class="footer"><a href="#">View all</a></li>
			</ul>
		</li>
		<!-- Tasks: style can be found in dropdown.less -->
		<li class="dropdown tasks-menu">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<i class="fa fa-flag-o"></i>
			<span class="label label-danger">9</span>
			</a>
			<ul class="dropdown-menu">
			<li class="header">You have 9 tasks</li>
			<li>
				<!-- inner menu: contains the actual data -->
				<ul class="menu">
				<li><!-- Task item -->
					<a href="#">
					<h3>
						Design some buttons
						<small class="pull-right">20%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">20% Complete</span>
						</div>
					</div>
					</a>
				</li>
				<!-- end task item -->
				<li><!-- Task item -->
					<a href="#">
					<h3>
						Create a nice theme
						<small class="pull-right">40%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">40% Complete</span>
						</div>
					</div>
					</a>
				</li>
				<!-- end task item -->
				<li><!-- Task item -->
					<a href="#">
					<h3>
						Some task I need to do
						<small class="pull-right">60%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">60% Complete</span>
						</div>
					</div>
					</a>
				</li>
				<!-- end task item -->
				<li><!-- Task item -->
					<a href="#">
					<h3>
						Make beautiful transitions
						<small class="pull-right">80%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">80% Complete</span>
						</div>
					</div>
					</a>
				</li>
				<!-- end task item -->
				</ul>
			</li>
			<li class="footer">
				<a href="#">View all tasks</a>
			</li>
			</ul>
		</li>
		<!-- User Account: style can be found in dropdown.less -->
		<li class="dropdown user user-menu">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<span class="hidden-xs">Alexander Pierce</span>
			</a>
			<ul class="dropdown-menu">
			<!-- User image -->
			<li class="user-header">
				<p>
				Alexander Pierce - Web Developer
				<small>Member since Nov. 2012</small>
				</p>
			</li>
			<!-- Menu Body -->
			<li class="user-body">
				<div class="row">
				<div class="col-xs-4 text-center">
					<a href="#">Followers</a>
				</div>
				<div class="col-xs-4 text-center">
					<a href="#">Sales</a>
				</div>
				<div class="col-xs-4 text-center">
					<a href="#">Friends</a>
				</div>
				</div>
				<!-- /.row -->
			</li>
			<!-- Menu Footer-->
			<li class="user-footer">
				<div class="pull-left">
				<a href="#" class="btn btn-default btn-flat">Profile</a>
				</div>
				<div class="pull-right">
				<a href="#" class="btn btn-default btn-flat">Sign out</a>
				</div>
			</li>
			</ul>
		</li>
		<!-- Control Sidebar Toggle Button -->
		<li>
			<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
		</li>
		</ul>
	</div>
	</nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
	<!-- Sidebar user panel -->
	<div class="user-panel">
		<div class="pull-left info">
		<p>Alexander Pierce</p>
		<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		</div>
	</div>
	<!-- search form -->
	<form action="#" method="get" class="sidebar-form">
		<div class="input-group">
		<input type="text" name="q" class="form-control" placeholder="Search...">
			<span class="input-group-btn">
				<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
				</button>
			</span>
		</div>
	</form>
	<!-- /.search form -->
	<!-- sidebar menu: : style can be found in sidebar.less -->
	<ul class="sidebar-menu">
		<li class="header">MAIN NAVIGATION</li>
		<li class="treeview">
		<a href="#">
			<i class="fa fa-dashboard"></i> <span>Dashboard</span>
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
			<li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
		</ul>
		</li>
		<li class="treeview">
		<a href="#">
			<i class="fa fa-files-o"></i>
			<span>Layout Options</span>
			<span class="pull-right-container">
			<span class="label label-primary pull-right">4</span>
			</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
			<li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
			<li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
			<li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
		</ul>
		</li>
		<li>
		<a href="../widgets.html">
			<i class="fa fa-th"></i> <span>Widgets</span>
			<span class="pull-right-container">
			<small class="label pull-right bg-green">new</small>
			</span>
		</a>
		</li>
		<li class="treeview">
		<a href="#">
			<i class="fa fa-pie-chart"></i>
			<span>Charts</span>
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
			<li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
			<li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
			<li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
		</ul>
		</li>
		<li class="treeview">
		<a href="#">
			<i class="fa fa-laptop"></i>
			<span>UI Elements</span>
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
			<li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
			<li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
			<li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
			<li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
			<li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
		</ul>
		</li>
		<li class="treeview active">
		<a href="#">
			<i class="fa fa-edit"></i> <span>Forms</span>
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
		<ul class="treeview-menu">
			<li class="active"><a href="general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
			<li><a href="advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
			<li><a href="editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
		</ul>
		</li>
		<li class="treeview">
		<a href="#">
			<i class="fa fa-table"></i> <span>Tables</span>
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="../tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
			<li><a href="../tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
		</ul>
		</li>
		<li>
		<a href="../calendar.html">
			<i class="fa fa-calendar"></i> <span>Calendar</span>
			<span class="pull-right-container">
			<small class="label pull-right bg-red">3</small>
			<small class="label pull-right bg-blue">17</small>
			</span>
		</a>
		</li>
		<li>
		<a href="../mailbox/mailbox.html">
			<i class="fa fa-envelope"></i> <span>Mailbox</span>
			<span class="pull-right-container">
			<small class="label pull-right bg-yellow">12</small>
			<small class="label pull-right bg-green">16</small>
			<small class="label pull-right bg-red">5</small>
			</span>
		</a>
		</li>
		<li class="treeview">
		<a href="#">
			<i class="fa fa-folder"></i> <span>Examples</span>
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="../examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
			<li><a href="../examples/profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>
			<li><a href="../examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>
			<li><a href="../examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>
			<li><a href="../examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
			<li><a href="../examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
			<li><a href="../examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
			<li><a href="../examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>
			<li><a href="../examples/pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>
		</ul>
		</li>
		<li class="treeview">
		<a href="#">
			<i class="fa fa-share"></i> <span>Multilevel</span>
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
			<li>
			<a href="#"><i class="fa fa-circle-o"></i> Level One
				<span class="pull-right-container">
				<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
			<ul class="treeview-menu">
				<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
				<li>
				<a href="#"><i class="fa fa-circle-o"></i> Level Two
					<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
					<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
				</ul>
				</li>
			</ul>
			</li>
			<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
		</ul>
		</li>
		<li><a href="../../documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
		<li class="header">LABELS</li>
		<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
		<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
		<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
	</ul>
	</section>
	<!-- /.sidebar -->
</aside>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="padding-left: 290px;">
	<h1>
		상품등록
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Forms</a></li>
		<li class="active">General Elements</li>
	</ol>
	</section>
	
<!-- Main content -->
<section class="content">
	<div class="row" style="display: flex; justify-content: center; align-items: center;">
		<div class="col-md-8">
			<div class="box box-warning">
				<div class="box-body">
					<div class="form-group">
						<label>판매 상품명</label>
						<input type="text" id="sle_nm" name="sle_nm" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>판매 상품 원가</label>
						<input type="text" class="form-control" id="price_sale" name="price_sale" onkeyup="commaValue(this);" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>판매 상품 이미지</label>
						<input type="file" id="img" name="files[0]" required>
					</div>

					<div class="form-group">
						<label>판매 상품 상세 이미지</label>
						<input type="file" id="desces" name="files[1]" required>
					</div>

					<div class="form-group">
						<label>카테고리 대분류</label>
						<select class="form-control" id="cd_ctg_b" name="cd_ctg_b" onchange="updateCategoryMinor()" required>
							<option value="0">선택하세요</option>
							<option value="1">기능별</option>
							<option value="2">성분별</option>
							<option value="3">대상별</option>
						</select>
					</div>
					
					<div class="form-group">
						<label>카테고리 중분류</label>
						<select class="form-control" id="cd_ctg_m" name="cd_ctg_m" required>
							<option value="0">먼저 대분류를 선택하세요</option>
						</select>
					</div>

					<div class="form-group">
						<label>판매 상품 상태</label>
						<select class="form-control" id="cd_state_sale" name="cd_state_sale" required>
							<option value="1">대기(1)</option>
							<option value="2">판매(2)</option>
							<option value="3">중지(3)</option>
							<option value="9">재고소진(9)</option>
						</select>
					</div>

					<div class="form-group">
						<label>판매 상품 섭취 타입</label>
						<select class="form-control" id="prd_type" name="prd_type" required>
							<option value="1">액상(1)</option>
							<option value="2">정(2)</option>
							<option value="3">캡슐(3)</option>
							<option value="4">베지캡슐(4)</option>
							<option value="5">젤리(5)</option>
							<option value="6">분말(6)</option>
							<option value="7">츄어블(7)</option>
						</select>
					</div>

					<div class="form-group">
						<label>판매 상품 재고</label>
						<input type="text" id="count_stock" name="count_stock" class="form-control" onkeyup="commaValue(this);" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>판매 상품 브랜드</label>
						<input type="text" id="corp_nm" name="corp_nm" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>상품 판매 시작일:</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" id="dt_sale_start" name="dt_sale_start" required autocomplete="off">
						</div>
					</div>
					
					<div class="form-group">
						<label>상품 판매 종료일:</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" id="dt_sale_end" name="dt_sale_end" required autocomplete="off">
						</div>
					</div>

					<div class="form-group">
						<label>할인율</label>
						<input type="text" id="discount" name="discount" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>포인트 적립률</label>
						<input type="text" id="point_stack" name="point_stack" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<button type="button" class="btn btn-primary" onclick="javascript:productRegProc();">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Main content End -->

</div>
<!-- /.content-wrapper -->
<footer class="main-footer">
	<div class="pull-right hidden-xs">
	<b>Version</b> 2.3.8
	</div>
	<strong>Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Create the tabs -->
	<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
	<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
	<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
	<!-- Home tab content -->
	<div class="tab-pane" id="control-sidebar-home-tab">
		<h3 class="control-sidebar-heading">Recent Activity</h3>
		<ul class="control-sidebar-menu">
		<li>
			<a href="javascript:void(0)">
			<i class="menu-icon fa fa-birthday-cake bg-red"></i>

			<div class="menu-info">
				<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

				<p>Will be 23 on April 24th</p>
			</div>
			</a>
		</li>
		<li>
			<a href="javascript:void(0)">
			<i class="menu-icon fa fa-user bg-yellow"></i>

			<div class="menu-info">
				<h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

				<p>New phone +1(800)555-1234</p>
			</div>
			</a>
		</li>
		<li>
			<a href="javascript:void(0)">
			<i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

			<div class="menu-info">
				<h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

				<p>nora@example.com</p>
			</div>
			</a>
		</li>
		<li>
			<a href="javascript:void(0)">
			<i class="menu-icon fa fa-file-code-o bg-green"></i>

			<div class="menu-info">
				<h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

				<p>Execution time 5 seconds</p>
			</div>
			</a>
		</li>
		</ul>
		<!-- /.control-sidebar-menu -->

		<h3 class="control-sidebar-heading">Tasks Progress</h3>
		<ul class="control-sidebar-menu">
		<li>
			<a href="javascript:void(0)">
			<h4 class="control-sidebar-subheading">
				Custom Template Design
				<span class="label label-danger pull-right">70%</span>
			</h4>

			<div class="progress progress-xxs">
				<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
			</div>
			</a>
		</li>
		<li>
			<a href="javascript:void(0)">
			<h4 class="control-sidebar-subheading">
				Update Resume
				<span class="label label-success pull-right">95%</span>
			</h4>

			<div class="progress progress-xxs">
				<div class="progress-bar progress-bar-success" style="width: 95%"></div>
			</div>
			</a>
		</li>
		<li>
			<a href="javascript:void(0)">
			<h4 class="control-sidebar-subheading">
				Laravel Integration
				<span class="label label-warning pull-right">50%</span>
			</h4>

			<div class="progress progress-xxs">
				<div class="progress-bar progress-bar-warning" style="width: 50%"></div>
			</div>
			</a>
		</li>
		<li>
			<a href="javascript:void(0)">
			<h4 class="control-sidebar-subheading">
				Back End Framework
				<span class="label label-primary pull-right">68%</span>
			</h4>

			<div class="progress progress-xxs">
				<div class="progress-bar progress-bar-primary" style="width: 68%"></div>
			</div>
			</a>
		</li>
		</ul>
		<!-- /.control-sidebar-menu -->

	</div>
	<!-- /.tab-pane -->
	<!-- Stats tab content -->
	<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
	<!-- /.tab-pane -->
	<!-- Settings tab content -->
	<div class="tab-pane" id="control-sidebar-settings-tab">
		<form method="post">
		<h3 class="control-sidebar-heading">General Settings</h3>

		<div class="form-group">
			<label class="control-sidebar-subheading">
			Report panel usage
			<input type="checkbox" class="pull-right" checked>
			</label>

			<p>
			Some information about this general settings option
			</p>
		</div>
		<!-- /.form-group -->

		<div class="form-group">
			<label class="control-sidebar-subheading">
			Allow mail redirect
			<input type="checkbox" class="pull-right" checked>
			</label>

			<p>
			Other sets of options are available
			</p>
		</div>
		<!-- /.form-group -->

		<div class="form-group">
			<label class="control-sidebar-subheading">
			Expose author name in posts
			<input type="checkbox" class="pull-right" checked>
			</label>

			<p>
			Allow the user to show his name in blog posts
			</p>
		</div>
		<!-- /.form-group -->

		<h3 class="control-sidebar-heading">Chat Settings</h3>

		<div class="form-group">
			<label class="control-sidebar-subheading">
			Show me as online
			<input type="checkbox" class="pull-right" checked>
			</label>
		</div>
		<!-- /.form-group -->

		<div class="form-group">
			<label class="control-sidebar-subheading">
			Turn off notifications
			<input type="checkbox" class="pull-right">
			</label>
		</div>
		<!-- /.form-group -->
	
		<div class="form-group">
			<label class="control-sidebar-subheading">
			Delete chat history
			<a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
			</label>
		</div>
		<!-- /.form-group -->
		</form>
	</div>
	<!-- /.tab-pane -->
	</div>
</aside>
<!-- /.control-sidebar -->
<!-- Add the sidebar's background. This div must be placed
	 immediately after the control sidebar -->
<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<script src="/include/backoffice/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/include/backoffice/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/include/backoffice/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/include/backoffice/js/demo.js"></script>
</form>
</body>
</html>