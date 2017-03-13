<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
<link href="/mantou/jsps/css/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function mover() {
		document.getElementById('m_post_pic_text').style.backgroundColor = '#b8cfff';
	}

	function mout() {
		document.getElementById('m_post_pic_text').style.backgroundColor = '#b8cfa7';
	}
</script>
</head>
<body>
	<div id="m_menu">
		<jsp:include page="/jsps/left.jsp"></jsp:include>

	</div>


	<div id="m_content">
		<a name="anchor_top"> </a>
		<div class="wrapper_content">


			<div>
				<h1>馒头</h1>
			</div>
			<div>
				<p>欢迎来到馒头！</p>
			</div>
			<div class="wrapper_image">
				<img alt="" src="/mantou/images/sg.jpg">
			</div>
			<div class="desc">
				<p>馒头是一个贴图匿名论坛，每个人都可以在这里进行平等自由的交流。</p>
			</div>
		</div>
		<a name="anchor_bottom"> </a>
	</div>
	<jsp:include page="/jsps/bottom.jsp"></jsp:include>

</body>
</html>