$(function() {
	$(".sub_m_users_tab a").mouseover(function() {
		$(this).addClass('on').siblings().removeClass('on');
		var id = $(this).attr("id") + "_content";
		$("#" + id).show();
		$(".sub_m_users_content").not("#" + id).hide();

	});

	$("#user_query_content").css("display", "block");

	$("[name='no']").keyup(function() {
		if (/\D/.test(this.value)) {
			alert('只能输入数字');
			this.value = '';
		}
	});

	$("input[type='text']").focus(function() {
		this.value = '';
	});

});

function userBan() {
	var value = $("#userNum").val();

	$.ajax({
		url : "/mantou/user_ajaxSwitchUserStatus.action",
		data : "uid=" + value,
		type : "POST",
		dataType : "text",
		async : false,
		cache : false,
		success : function(result) {
			$("#user_ban_error").text(result);
		}
	});
}

