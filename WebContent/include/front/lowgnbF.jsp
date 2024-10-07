<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-12" style="padding: 0 !important;">
	<div>
		<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 20px; font-size: 30px; font-weight: bold;">기능별</h6>
			<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none">
			<c:choose>
				<c:when test="${paging.cd_ctg_m == 0}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
				</c:when>
				<c:otherwise>
					<c:if test="${paging.cd_ctg_m == 1}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 2}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 3}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 4}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 5}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 6}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 7}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 8}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 9}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px; font-weight: 1000;">위/간/갑상선</a>
					</c:if>
				</c:otherwise>
			</c:choose>
		</h6>
	</div>
	<h6 class="coupon__link" style="text-align: left; letter-spacing: 1.5px;">
		<ul style="padding: 0; margin: 0;">
		<c:choose>
		<c:when test="${paging.filter == '' && paging.corp_nm == '' && paging.prd_type == ''}">
			<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">판매인기순</a></li>
			<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">낮은가격순</a></li>
			<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">높은가격순</a></li>
			<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">등록일순</a></li>
			<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">브랜드</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
					<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
					<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
					<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
					<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
					<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
					<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
					<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
					<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
					<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
				</ul>
			</li >
			<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">제품타입</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
					<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
					<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
					<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
					<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
					<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
					<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
				</ul>
			</li>
			<select name="linePerPage" id="linePerPage" style="width: 90px; height: 25px; border-radius: 5px; font-size: 13px; padding: 0; margin: 0 30px 0 380px;" onchange="javascript:goTypeF('', '', '', '', '${paging.cd_ctg_m}', this);">
				<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
				<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
				<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
				<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
			</select>
			</c:when>
			<c:otherwise>
				<c:if test="${paging.filter == 'BestP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 14px !important; color: #9f8473; font-weight: bold;">✔판매인기순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">낮은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">높은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">등록일순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" style="width: 90px; height: 25px; border-radius: 5px; font-size: 13px; padding: 0; margin: 0 30px 0 380px;" onchange="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'LowP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">판매인기순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 14px !important; color: #9f8473; font-weight: bold;">✔낮은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">높은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">등록일순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" style="width: 90px; height: 25px; border-radius: 5px; font-size: 13px; padding: 0; margin: 0 30px 0 380px;" onchange="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'HighP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">판매인기순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">낮은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 14px !important; color: #9f8473; font-weight: bold;">✔높은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">등록일순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" style="width: 90px; height: 25px; border-radius: 5px; font-size: 13px; padding: 0; margin: 0 30px 0 380px;" onchange="javascript:goTypeF('', 'HighP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'DtReg' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">판매인기순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">낮은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">높은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 14px !important; color: #9f8473; font-weight: bold;">✔등록일순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" style="width: 90px; height: 25px; border-radius: 5px; font-size: 13px; padding: 0; margin: 0 30px 0 380px;" onchange="javascript:goTypeF('', 'DtReg', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm != '' && paging.prd_type == ''}">
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">판매인기순</a></li>
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">낮은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">높은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">등록일순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 14px !important; color: #9f8473; font-weight: bold;">✔브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" style="width: 90px; height: 25px; border-radius: 5px; font-size: 13px; padding: 0; margin: 0 30px 0 380px;" onchange="javascript:goTypeF('', '', '${paging.corp_nm}', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm == '' && paging.prd_type != ''}">
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">판매인기순</a></li>
					<li style="padding: 0; margin: 5px 30px 5px 10px;"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">낮은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">높은가격순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" style="font-size: 13px !important;">등록일순</a></li>
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 13px !important;">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li style="padding: 0; margin: 0 30px 0 0;"><a style="font-size: 14px !important; color: #9f8473; font-weight: bold;">✔제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" style="width: 90px; height: 25px; border-radius: 5px; font-size: 13px; padding: 0; margin: 0 30px 0 380px;" onchange="javascript:goTypeF('', '', '', '${paging.prd_type}', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
			</c:otherwise>
			</c:choose>
		</ul>
	</h6>
</div>