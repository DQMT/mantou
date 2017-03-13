<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mantou/jsps/css/tools.css" type="text/css" rel="stylesheet" />
<link href="/mantou/jsps/css/bottom.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/mantou/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/page/tool.js"></script>
<title>bottom</title>
</head>
<body class="bottom_body">
	<div id="options">
		<ul>
			<li><a href="/mantou/page_history.action">回复历史</a></li>
			<li><a href="/mantou/user_password.action">修改密码</a></li>
		</ul>
	</div>
	<!-- <div id="m_tool">
		<a href="#anchor_top" title="前往顶部" class="m_tool_btn icon_up" ></a>
		<span href="#" title="刷新" onclick="location.reload()" class="m_tool_btn icon_refresh"></span> 
		<a href="#anchor_bottom" title="前往底部" class="m_tool_btn icon_down"></a>
	</div> -->
	<div id="m_bottom">
		和平讨论 理性发言
		<a href="https://github.com/DQMT/mantou" target="_blank">本站源码 on github</a>
		<div class="m_bottom_user">
			<%-- <span class="m_bottom_user_info">
				欢迎用户：${sessionScope.currentUser.userName} <a class="logout"
				href="/mantou/user_exit.action"><font color="red">退出</font></a> <a
				href="/mantou/jsps/success.jsp">首页</a> <a href="#" id="usercenter"
				onmouseover="optionon();" onmouseout="optionoff();">用户中心</a>
			</span> --%>
		</div>
	</div>
</body>
</html>