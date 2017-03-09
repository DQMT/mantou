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

<title>Insert title here</title>

<link href="/mantou/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

<script src="http://code.jquery.com/jquery.js"></script>

<script src="/mantou/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#page_content {
	position: fixed;
	border-style: solid;
	border-top-width: 5px;
	border-right-width: 10px;
	border-bottom-width: 5px;
	border-left-width: 10px;
	border-color:#FBFBFF;
	height: 92%;
	width: 80%;
	overflow-y: scroll;
	
}
body{
	height:100%;
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
	<div class="navbar navbar-inverse navbar-fixed-top" >
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand active" href="#">馒头！</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right ">
				<li class="active"><a href="#">欢迎</a></li>
				<li><a href="#">关于</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 选项 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">回复历史</a></li>
						<li><a href="#">修改密码</a></li>
						<li class="divider"></li>
						<li><a href="#">分离的链接</a></li>
						<li class="divider"></li>
						<li><a href="#">另一个分离的链接</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</div>
	<br><br><br>
	<div class="container-fluid ">
		<div class="row ">
			<div class="col-md-1 column ">
				<div id="page_menu">
				<jsp:include page="/jsps/left.jsp"></jsp:include>
				</div>
			</div>
			<div class="col-md-10 column  ">
				<div id="page_content" >
					<div class="container-fluid ">
					
					<jsp:include page="/jsps/page/replycontent.jsp"></jsp:include>
					<jsp:include page="/jsps/page/pagination.jsp"></jsp:include>
					</div>
				</div>
				
			</div>
			<div class="col-md-1 column">
				<div id="page_tool">
					something
				</div>
			</div>
		</div>
	</div>

</body>
</html>