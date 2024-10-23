<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="main-header">
	<a href="/console/index.web" class="logo">
	<span class="logo-lg"><b>관리자</b></span>
	</a>
</header>
<span style="float:right;line-height:43px;vertical-align:middle;">
	<!-- 세션이 있으면 -->
	<c:if test="${not empty sessionScope.SEQ_MNG}">
		<a href="/console/myPage/" class="menuTop" title="<%=session.getAttribute("NAME")%>" style="font-weight: bold; font-size: 1.2em;">[마이페이지]</a>
		 <a href="/console/login/logout.web" class="menuTop" style="font-weight: bold; font-size: 1.2em;">[로그아웃]</a>
		 <!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="treeview">
					<a href="#">
						<i class="fa fa-dashboard"></i> <span>사용자 관리</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li class="active"><a href="index.html"><i class="fa fa-circle-o"></i> 회원 관리</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> 관리자 관리</a></li>
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
						<li><a href="#"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Boxed</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Fixed</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
					</ul>
					</li>
					<li>
					<a href="#">
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
						<li><a href="#"><i class="fa fa-circle-o"></i> ChartJS</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Morris</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Flot</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Inline charts</a></li>
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
						<li><a href="#"><i class="fa fa-circle-o"></i> General</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Icons</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Buttons</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Sliders</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Timeline</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Modals</a></li>
					</ul>
					</li>
					<li class="treeview">
					<a href="#">
						<i class="fa fa-edit"></i> <span>상품</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="/console/product/productReg.web"><i class="fa fa-circle-o"></i> 상품 등록</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Editors</a></li>
					</ul>
					</li>
					<li class="treeview">
					<a href="#">
						<i class="fa fa-fw fa-volume-up"></i> <span>고객 센터</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-bullhorn"></i> 공지사항</a></li>
						<li><a href="#"><i class="fa fa-fw fa-users"></i> 자주찾는 질문(FAQ)</a></li>
						<li><a href="#"><i class="fa fa-fw fa-user"></i> 1:1문의</a></li>
					</ul>
					</li>
					<li>
					<a href="#">
						<i class="fa fa-calendar"></i> <span>Calendar</span>
						<span class="pull-right-container">
						<small class="label pull-right bg-red">3</small>
						<small class="label pull-right bg-blue">17</small>
						</span>
					</a>
					</li>
					<li>
					<a href="#">
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
						<li><a href="#"><i class="fa fa-circle-o"></i> Invoice</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Profile</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Login</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Register</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> 404 Error</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> 500 Error</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Blank Page</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Pace Page</a></li>
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
					<li><a href="#"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
					<li class="header">LABELS</li>
					<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
				</ul>
				</section>
				<!-- /.sidebar -->
			</aside>
	</c:if>
	<!-- 세션이 없으면 -->
	<c:if test="${empty sessionScope.SEQ_MNG}">
	</c:if>
</span>