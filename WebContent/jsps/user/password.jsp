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
<link href="/mantou/jsps/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/mantou/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/user/password.js"></script>
</head>
<body>

	<div class="wrapper">
		<div id="mantou">
			<img alt="   &nbsp;(´・ω・`)图片加载失败了${pageContext.request.contextPath }"
				height="100px" width="160px" src="/mantou/images/mantou2.png">
		</div>
		<div class="content">
			<div id="form_wrapper" class="form_wrapper">
				<form class="register active"
					action="/mantou/user_changePassword.action" method="post">

					<h3>修改密码：${currentUser.userName }</h3>

					<div class="regist">
						<div>
							<label>当前密码:</label> <input type="password" name="user.passWord"
								class="inputClass" id="passWord"
								value="" /> <span
								class="error" id="passWordError">${error }</span>
						</div>
						<div>
							<label>新密码:</label> <input type="password" name="newpw"
								class="inputClass" id="newPassWord"
								value="" /> <span
								class="error" id="newPassWordError"></span>
						</div>
						<div>
							<label>确认新密码:</label> <input type="password" class="inputClass"
								id="renewPassWord"  value="" /> <span
								class="error" id="renewPassWordError"></span>
						</div>

					</div>


					<div class="bottom">
						<div class="remember">
							<input type="button" onclick="location='/mantou/jsps/success.jsp'" value="我不改了！" />
							<!-- <span><a href="/mantou/jsps/success.jsp">我不改了！</a></span> -->
						</div>
						<input type="submit" onclick="return validateForm();" value="提交" />
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