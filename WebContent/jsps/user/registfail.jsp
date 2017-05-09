<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/mantou/images/favicon.ico"/>
<link rel="bookmark" href="/mantou/images/favicon.ico"/>
<title>馒头！</title>
<meta http-equiv="refresh" content ="5;url=/mantou/index.jsp">
<script type="text/javascript">
	var i = 6;
	function shownum() {
		i = i - 1;
		document.getElementById("time").innerHTML = i + "秒后自动跳转登陆界面";
		setTimeout('shownum()', 1000);
	}
</script>
<link href="/mantou/jsps/css/style.css" type="text/css" rel="stylesheet" />
</head>
<body onload="shownum()">
	<div class="wrapper">
		<h1>馒头!</h1>
		<h2></h2>
		<div id="mantou">
			<img alt="   &nbsp;(´・ω・`)图片加载失败了${pageContext.request.contextPath }"
				height="100px" width="160px" src="/mantou/images/mantou2.png">
		</div>
		<div align="center">
			<h2>发送激活邮件失败，请检查你的邮箱是否可用！</h2>
			<p id="time"></p>
			<h2></h2>
			<a href="/mantou/index.jsp" >点击立即跳转</a>
		</div>
	</div>
</body>
</html>