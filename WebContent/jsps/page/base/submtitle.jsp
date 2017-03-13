<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<div id="sub_m_title">
	<ul class="breadcrumb">
		<li><a href="/mantou/jsps/success.jsp">馒头</a> <span class="divider"></span></li>
		<li><a href="${currentPage.url }">${currentPage.subTitle}</a> <span class="divider"></span></li>
		<li><a href="/mantou/page_reply.action?rid=${thistid}">No.${thistid}</a><span></span></li>
		<li class="active"><span>第&nbsp;${currentPage.pageCode }&nbsp;
						页 </span></li>
	</ul>
</div>

</html>