<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- <link href="/mantou/jsps/css/left.css" type="text/css" rel="stylesheet" /> -->
<title>bottom</title>
</head>
<body> --%>
	<div id="m_menu_proj">馒头</div>
	<div id="m_menu_list">
		<s:action name="page_getSubmMenu" namespace="/mantou"></s:action>
		<ul class="m_menu_sub_list">
			<c:forEach items="${submsMenu }" var="subm">
				<li><a href="/mantou/page_visit.action?subm=${subm.key }">${subm.value }</a></li>
			</c:forEach>

		</ul>
	</div>
	<div id="m_admin">管理</div>
	<div id="m_admin_list">
		<ul class="m_admin_sub_list">
			<li><a href="/mantou/manage_reports.action">值班室</a></li>
			<c:if test="${currentUser.userStatus==0 }">
			<li><a href="/mantou/manage_users.action">用户管理</a></li>
			</c:if>
		</ul>
	</div>
<!-- 
</body>
</html> -->