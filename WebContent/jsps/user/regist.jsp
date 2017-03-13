<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">



<title>注册</title>

<link href="/mantou/jsps/css/style.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/mantou/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/user/md5.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/user/regist.js"></script>


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
				<form class="register active" id="registForm" 
				action="/mantou/user_regist.action"
				method="post">
				
					<h3>注册</h3>

					<div class="column">
						<div>
							<label>用户名:</label> <input type="text" id="loginName" name="user.userName" class="inputClass" value="" /> <span class="error" id="loginNameError">&nbsp;</span>
						</div>
						<div>
							<label>Email:</label> <input type="text" id="email" name="user.email" class="inputClass" value="" /> <span class="error" id="emailError">&nbsp;</span>
						</div>

					</div>

					<div class="column">

						<div>
							<label>登录密码:</label> <input type="password" id ="passWord" name="user.passWord" class="inputClass" value="" /><span
								class="error" id="passWordError">&nbsp;</span>
						</div>

						<div>
							<label>确认密码:</label> <input type="password" id="repassWord" class="inputClass"  /> <span
								class="error" id="repassWordError">&nbsp;</span>
						</div>
					</div>
					<div class="bottom">
						<div class="remember">
							<!-- <input type="checkbox" /> <span>Send me updates</span> -->
						</div>
						<input type="submit" onclick="return validateRegistForm()" value="马上注册" /> <a href="/mantou/index.jsp"
							rel="login" class="linkform">已经有账号了？点击这里登录</a>
						<div class="clear"></div>
					</div>
				</form>


			</div>
			<div class="clear"></div>
		</div>

	</div>

</body>

</html>