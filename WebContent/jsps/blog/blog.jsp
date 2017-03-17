<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mantou/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="/mantou/jquery/jquery.js"></script>
<script src="/mantou/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<title>创建博客</title>

</head>
<body>

	<div style="margin:0 auto" >
		<textarea id="text-input" oninput="this.editor.update()" rows="6"
			cols="60">Type **Markdown** here.</textarea>
	</div>
	<div id="preview" style="display: inline-block" ></div>

	<script src="/mantou/markdown/markdown.js"></script>
	<script>
		function Editor(input, preview) {
			this.update = function() {
				preview.innerHTML = markdown.toHTML(input.value);
			};
			input.editor = this;
			this.update();
		}
		var $ = function(id) {
			return document.getElementById(id);
		};
		new Editor($("text-input"), $("preview"));
	</script>

</body>
</html>