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
	<jsp:include page="/jsps/page/base/navbar.jsp"></jsp:include>
	<br>
	<br>
	<br>



	<div class="container-fluid">
		<div class="row ">
			<div class="col-md-1 column col-sm-1">
				<div id="page_menu">
					<jsp:include page="/jsps/left.jsp"></jsp:include>
				</div>
			</div>

			<div class="col-md-4 col-lg-4 column">
				<form action="/mantou/blog_saveBlog.action" method="post">
					<div class="input-group">
						<span class="input-group-addon">标题</span> <input type="text"
							name="blog.title" class="form-control" placeholder="title">
					</div>
					<div class="input-group">
						<div style="margin: 0 auto">
							<textarea id="text-input" oninput="this.editor.update()"
								name="blog.content" rows="40" cols="85">Type **Markdown** here.</textarea>
						</div>
					</div>
						<input type="hidden" name="blog.uid" value="${currentUser.uid}">
						<button type="submit" class="btn btn-warning ">清空</button>
						<button type="submit" class="btn btn-primary pull-right">提交</button>
				</form>
			</div>
			<div class="col-md-5 col-lg-5 column">
				<div id="preview" style="display: inline-block"></div>
			</div>

			<div class="col-md-2 col-lg-2 column">
				<div id="preview" style="display: inline-block"></div>
			</div>
		</div>

	</div>

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