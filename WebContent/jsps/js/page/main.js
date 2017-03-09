$(function() {
	$(".m_threads_content_ref").mouseover(function refon() {
		$(this).next().css('display', 'block');
		$(this).next().css('visibility', 'hidden');
		$(this).next().css(' z-index', '2');

		var tid = $(this).html();
		tid = tid.replace("&gt;&gt;", "").replace("&lt;&lt;", "").replace("No.","");

		$.ajax({
			url : "/mantou/page_ajaxThreadsReference.action",
			data : "tid=" + tid,
			type : "POST",
			dataType : "json",
			async : false,
			cache : false,
			success : function(result) {
				if (result == "") {
					// alert("nothing!");
					$(this).next().css('display', 'none');
					return;
				} else {
					 //alert(result);
					$("ref_threads_info_report").children(":first").attr('href', '/mantou/manage_reports.action?tid=' + result[3]);
					$("ref_threads_info_reply").children(":first").attr('href', '/mantou/page_reply.action?tid=${threads.tid}&rid=${reply.tid}');
					$(".ref_threads_info_title").text(result[0]);
					$(".ref_threads_info_time").text(result[1]);
					$(".ref_threads_info_uid").text("ID:" + result[2]);
					$(".ref_threads_info_threadid").text("No." + result[3]);
					$(".ref_threads_content_text").html(result[5].replace("<br/>", ""));
					if (result[4] != '0') {
						var ref = ">>No." + result[4] + "<<";
						$(".ref_threads_content_ref").html(ref);
						$(".ref_threads_content_ref").css('display', 'block');
					} else {

						$(".ref_threads_content_ref").css('display', 'none');
					}

					if (result[6] != null) {
						$(".ref_threads_imagebox").css('display', 'block');
						$(".ref_threads_image").attr("src", "/mantou/images/" + result[6]);

					} else {
						//alert("hide image!00");
						$(".ref_threads_imagebox").css('display', 'none');
					}

				}
			}
		});
		$(this).next().css('visibility', 'visible');
	});

	$(".ref_threads").mouseover(function refon() {
		$(this).css('display', 'block');
	});

	$(".m_threads_content_ref").mouseout(function refoff() {
		$(this).next().css('display', 'none');
	});

	$(".ref_threads").mouseout(function refoff() {
		$(this).css('display', 'none');
	});


});

function mover() {
	// document.getElementById('m_post_pic_text').style.backgroundColor =
	// '#b8cfff';
	$("#" + 'm_post_pic_text').css('background', '#b8cfff');
}

function mout() {
	$("#" + 'm_post_pic_text').css('background', '#b8cfa7');
}

function jump() {
	var pc = document.getElementById('gotoPageCode').value;// 获取文本框中的当前页码
	if (!/^[1-9]\d*$/.test(pc)) {// 对当前页码进行整数校验
		pc = 1;
	}
	if (parseInt(pc) > parseInt(maxcode)) {// 判断当前页码是否大于最大页,js默认字符串，需要转数字比较
		pc = maxcode;
	}
	if (parseInt(pc) < parseInt(1)) {
		pc = 1;
	}
	location = url + "&pageCode=" + pc;
}

function validatePostForm() {
	var text_id = "post_content";
	var text_value = $("#" + text_id).val();// 获取正文
	var image_id = "post_image";
	var image_value = $("#" + image_id).val();// 获取图片

	if ((!text_value) && (!image_value)) {
		alert("发送失败，正文和图片至少有一项不能为空！");
		return false;
	}
	if (text_value.length > 1000) {
		alert("发送失败，正文不能超过1000字！");
		return false;
	}
	if (image_value) {
		var v = validateImage();
		if (!v) {
			return false;
		}
	}

	return true;
}





function validateImage() {
	var maxsize = 1024 * 1024 * 2;// 2M
	var errMsg = "图片大小不能超过2M！！！";
	var typeMsg = "图片仅支持bmp, gif, png, jpg ,jpeg格式！";
	var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过2M，建议使用IE、FireFox、Chrome浏览器。";
	var browserCfg = {};
	var ua = window.navigator.userAgent;
	if (ua.indexOf("MSIE") >= 1) {
		browserCfg.ie = true;
	} else if (ua.indexOf("Firefox") >= 1) {
		browserCfg.firefox = true;
	} else if (ua.indexOf("Chrome") >= 1) {

		browserCfg.chrome = true;
	}

	try {
		var obj_file = document.getElementById("post_image");
		var filename = obj_file.value;
		var filetype = filename.substring(filename.lastIndexOf(".") + 1, filename.length);
		var arr = [ "bmp", "gif", "png", "jpg", "jpeg" ];
		if ($.inArray(filetype, arr) < 0) {
			alert(typeMsg);
			return false;
		}
		var filesize = 0;
		if (browserCfg.firefox || browserCfg.chrome) {
			filesize = obj_file.files[0].size;
		} else if (browserCfg.ie) {
			var obj_img = document.getElementById('tempimg');
			obj_img.dynsrc = obj_file.value;
			filesize = obj_img.fileSize;
		} else {
			alert(tipMsg);
			return true;
		}
		if (filesize == -1) {
			alert(tipMsg);
			return true;
		} else if (filesize > maxsize) {
			alert(errMsg);
			return false;
		} else {
			return true;
		}
	} catch (e) {
		alert(e);
	}

}

