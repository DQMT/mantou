$(function() {

	$(".error").each(function() {
		showError($(this));// 遍历每个元素，使用每个元素来调用showError方法
	});

	$(".inputClass").focus(function() {

		var spanid = $(this).attr("id") + "Error";// 通过输入框找到对应的span的id
		$("#" + spanid).text("");// 把span的内容清空
		showError($("#" + spanid));// 隐藏没有信息的span

	});

	$(".inputClass").blur(function() {
		var id = $(this).attr("id");// 获取当前输入框的id
		var funName = "validate" + id.substring(0, 1).toUpperCase() + id.substring(1) + "()";// 得到对应的校验函数名
		eval(funName);// 执行函数调用
	});

});

function validateRegistForm() {
	var bool = true;
	if (!validateLoginName()) {
		bool = false;

	}
	if (!validateEmail()) {
		bool = false;

	}
	if (!validatePassWord()) {
		bool = false;

	}
	if (!validateRepassWord()) {
		bool = false;

	}
	return bool;
}

function validateLoginName() {
	var id = "loginName";
	var value = $("#" + id).val();// 获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if (!value) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("用户名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if (value.length < 3 || value.length > 20) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("用户名长度在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 3. 是否注册校验
	 */

	var flag = true;

	$.ajax({
		url : "/mantou/user_ajaxUserName.action",
		data : "userName=" + value,
		type : "POST",
		dataType : "text",
		async : false,
		cache : false,
		success : function(result) {
			if (result == "true") {
				$("#" + id + "Error").text("用户名已经存在！");
				showError($("#" + id + "Error"));
				flag = false;
			} else {
				$("#" + id + "Error").text("用户名可以使用");
				showPass($("#" + id + "Error"));
			}
		}
	});

	return flag;
}

function validateEmail() {
	var id = "email";
	var value = $("#" + id).val();// 获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if (!value) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("Email不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. Email格式校验
	 */
	if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("Email格式错误！");
		showError($("#" + id + "Error"));
		return false;
	}

	/*
	 * 邮箱是否已被注册
	 */
	var flag = true;
	$.ajax({
		url : "/mantou/user_ajaxEmail.action",
		data : "email=" + value,
		dataType : "text",
		type : "POST",
		async : false,
		cache : false,
		success : function(result) {
			if (result == "true") {
				$("#" + id + "Error").text("该邮箱已经注册过账户！");
				showError($("#" + id + "Error"));
				flag = false;
			} else {
				$("#" + id + "Error").text("邮箱名格式正确");
				showPass($("#" + id + "Error"));
			}
		}
	});

	return flag;
}

function validatePassWord() {
	var id = "passWord";
	var value = $("#" + id).val();// 获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if (!value) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if (value.length < 6 || value.length > 20) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("密码长度在6 ~ 20之间！");
		showError($("#" + id + "Error"));
		return false;
	}

	$("#" + id + "Error").text("密码格式正确");
	showPass($("#" + id + "Error"));

	return true;
}

function validateRepassWord() {
	var id = "repassWord";
	var value = $("#" + id).val();// 获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if (!value) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("确认密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}

	/*
	 * 2. 两次输入是否一致校验
	 */
	if (value != $("#passWord").val()) {
		/*
		 * 获取对应的label 添加错误信息 显示label
		 */
		$("#" + id + "Error").text("两次密码输入不一致！");
		showError($("#" + id + "Error"));
		return false;
	}

	$("#" + id + "Error").text("两次密码输入一致");
	showPass($("#" + id + "Error"));

	return true;
}

function showError(ele) {
	var text = ele.text();
	if (!text) {
		ele.html("&nbsp;");
	}
	ele.css("visibility", "visible");
	ele.css("color", "red");
}
function showPass(ele) {
	var text = ele.text();
	if (!text) {
		ele.html("&nbsp;");
	}
	ele.css("visibility", "visible");
	ele.css("color", "green");
}

function ajaxRegist() {
	if (validateLoginName() && validatePassWord()) {
		var userName = $("#loginName").val();
		var passWord = $("#passWord").val();
		var userStatus;
		if ($('#user_status').is(':checked')) {
			userStatus = 0;
		} else {
			userStatus = 2;
		}
		$.ajax({
			url : "/mantou/user_ajaxRegist.action",
			data : {
				name : userName,
				password : passWord,
				status : userStatus
			},
			type : "POST",
			dataType : "text",
			async : false,
			cache : false,
			success : function(result) {
				if(result == "success"){
					$("#user_reg_result").text("添加用户成功！");
				}else{
					$("#user_reg_result").text("添加用户失败！");
				}
			}
		});

	}

}