<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<title>馒头！</title>
<!-- <link href="jsps/css/main.css" type="text/css" rel="stylesheet" /> -->
<link href="/mantou/jsps/css/style.css?v=1" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/mantou/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/user/login.js"></script>
</head>
<body>

	<div class="wrapper">
		<h1>馒头!</h1>
		<h2></h2>
		<div id="mantou">
			<img alt="   &nbsp;(´・ω・`)图片加载失败了${pageContext.request.contextPath }"
				height="100px" width="160px" src="/mantou/images/mantou2.png">
		</div>
		<div class="content">
			<div id="form_wrapper" class="form_wrapper">
				<form class="register active" action="/mantou/user_login.action"
					method="post">

					<h3>登录</h3>

					<div class="regist">
						<div>
							<label>用户名:</label> <input type="text" name="user.userName"
								class="inputClass" id="loginName"
								onfocus="javascript:inputfocus();"
								value="${currentUser.userName }" /> <span class="error"
								id="loginNameError">${error }</span>
						</div>
						<div>
							<label>密码:</label> <input type="password" name="user.passWord"
								class="inputClass" id="passWord"
								onfocus="javascript:inputfocus();"
								value="${currentUser.passWord }" /> <span class="error"
								id="passWordError">${error }</span>
						</div>

					</div>


					<div class="bottom">
						<div class="remember">
							<!-- <input type="checkbox" name="rememberme" /> 
							<span><font	size="3px">记住我</font></span> -->
							<a href="/mantou/jsps/user/user_anonymousUserLogin.action" >匿名登录!</a>
							<!-- <input type="submit"  value="匿名登录!" /> -->
						</div>
						
						<input type="submit"  value="登录账号" />
						<a href="/mantou/jsps/user/regist.jsp" rel="login"
							class="linkform">还没有账号？点击这里注册</a>
						<div class="clear"></div>
					</div>
				</form>


			</div>
			<div class="clear"></div>
		</div>

	</div>
</body>
</body>
</html>