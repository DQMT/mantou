<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<title>mantou</title>

<link href="/mantou/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="/mantou/jsps/css/main.css?v=2.0.4" type="text/css"
	rel="stylesheet" />

<script src="/mantou/jquery/jquery.js"></script>
<script src="/mantou/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style type="text/css">
#page_content {
	position: fixed;
	border-style: solid;
	border-top-width: 5px;
	border-right-width: 10px;
	border-bottom-width: 5px;
	border-left-width: 10px;
	border-color: #FBFBFF;
	height: 92%;
	width: 80%;
	overflow-y: scroll;
}

body {
	height: 100%;
	overflow-y: hidden;
}

.col-center-block {
	float: none;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>
<body>
	<jsp:include page="/jsps/page/base/navbar.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<div class="container-fluid ">
		<div class="row ">
			<div class="col-md-1 column col-sm-1">
				<div id="page_menu">
					<jsp:include page="/jsps/left.jsp"></jsp:include>
				</div>
			</div>


			<div class="col-md-10 column col-sm-11 ">
				<div id="page_content">
					<div class="container-fluid ">
						<jsp:include page="/jsps/page/threads/content.jsp"></jsp:include>
						<jsp:include page="/jsps/page/base/pagination.jsp"></jsp:include>
					</div>
				</div>

			</div>
			<div class="col-md-1 column col-sm-0 ">
				<div id="page_tool">
					<jsp:include page="/jsps/right.jsp"></jsp:include>
				</div>
			</div>

		</div>
	</div>

</body>
</html>