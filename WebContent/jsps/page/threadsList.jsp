<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<link href="/mantou/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<%-- <script src="http://code.jquery.com/jquery.js"></script> --%>
<script src="/mantou/jquery/jquery.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/page/main.js"></script>




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
				<span class="m_threads_content_ref">&gt;&gt;No.${threads.reftid
					}&lt;&lt;</span>
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

