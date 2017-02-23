<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<title>history</title>
<link href="/mantou/jsps/css/main.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/mantou/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/page/main.js"></script>
<script type="text/javascript">
	var maxcode = "${currentPage.getTotalPages()}";
	var url = "${currentPage.url}";
</script>
</head>
<body>

	<div id="m_menu">
		<jsp:include page="/jsps/left.jsp"></jsp:include>
	</div>
	
	<div id="m_content">
	<a name="anchor_top"> </a>
	<h1>回复历史</h1>
	
			<c:forEach items="${currentPage.threadsList }" var="threads"
				varStatus="st">
				<div class="m_threads_main">
					<hr class="line" />
					<c:if test="${threads.tImage != null && threads.tImage != '' }">
						<div class="m_threads_imagebox">
							<img class="m_threads_image" alt="${threads.tImage}"
								src="/mantou/images/${threads.tImage}">
						</div>
					</c:if>

					<div class="m_threads_info">

						<span class="m_threads_info_title"><c:if
								test="${empty  threads.title }">无标题</c:if>${threads.title }</span> <span
							class="m_threads_info_time">${threads.createTime}</span> <span
							class="m_threads_info_uid">ID:${threads.uCookie }</span> <span
							class="m_threads_info_report"><a
							href="/mantou/manage_reports.action?tid=${threads.tid }">举报</a></span> <span
							class="m_threads_info_threadid">No.${threads.tid }</span> <span
							class="m_threads_info_reply"><a
							href="/mantou/page_reply.action?rid=${threads.tid}">回应</a></span>
					</div>
					<div class="m_threads_content">
						<c:if test="${threads.reftid !=0}">
							<span class="m_threads_content_ref">&gt;&gt;No.${threads.reftid }&lt;&lt;</span>
							<div class="ref_threads">
								<div class="ref_threads_imagebox">
									<img class="ref_threads_image" alt="" src="">
								</div>
								<div class="ref_threads_info">
									<span class="ref_threads_info_title">无标题</span> <span
										class="ref_threads_info_time">1900-11-11 20:20:20</span> <span
										class="ref_threads_info_uid">ID:</span> <span
										class="ref_threads_info_report"><a
										href="/mantou/manage_reports.action?tid=${threads.reftid }">举报</a></span>
									<span class="ref_threads_info_threadid">No.1111</span> <span
										class="ref_threads_info_reply"><a
										href="/mantou/page_reply.action?rid=${threads.reftid}">回应</a></span>
								</div>


								<div class="ref_threads_content">
									<span class="ref_threads_content_ref"></span> <span
										class="ref_threads_content_text"></span>
								</div>
								<div style="clear: both;"></div>

							</div>
						</c:if>
						<br />${threads.text }<br />
					</div>

				</div>

			</c:forEach>

	
	
	
		<c:choose>
			<c:when test="${currentPage.getTotalPages() < 15 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="${currentPage.getTotalPages() }" />
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${currentPage.pageCode - 7 }" />
				<c:set var="end" value="${currentPage.pageCode + 7 }" />
				<c:if test="${begin < 1 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="15" />
				</c:if>
				<c:if test="${end > currentPage.getTotalPages() }">
					<c:set var="begin" value="${currentPage.getTotalPages()-14 }" />
					<c:set var="end" value="${currentPage.getTotalPages()}" />
				</c:if>
			</c:otherwise>
		</c:choose>


		<div id="m_page">
			<ul>
				<li class="m_page_code"><a
					href="${currentPage.url }?pageCode=1">首页</a></li>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${i eq currentPage.pageCode }">
							<li class="m_page_code"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li class="m_page_code"><a
								href="${currentPage.url }?pageCode=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage.pageCode < currentPage.getTotalPages() }">
					<li class="m_page_code"><a
						href="${currentPage.url }?pageCode=${ currentPage.pageCode+1}">下一页</a></li>
				</c:if>

			</ul>
			<div class="m_page_jump">
				本版共 ${currentPage.getTotalPages()} 页 &nbsp; 到 第<input type="text"
					id="gotoPageCode" value="${currentPage.pageCode}" />页 <a
					href="javascript:jump();">确定</a>
					<a name="anchor_bottom"> </a>
			</div>
		</div>
		
	</div>
		
	<jsp:include page="/jsps/bottom.jsp"></jsp:include>
	
</body>
</html>