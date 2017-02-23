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

<title>reply</title>
<link href="/mantou/jsps/css/main.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/mantou/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/page/main.js"></script>
<script type="text/javascript">
	var maxcode = "${currentPage.getTotalReplyPages()}";
	var url = "${currentPage.url}";
</script>
</head>
<body>
	<c:set var='thistid' value="${currentPage.threadsList.get(0).tid}"
		scope="page" />
	<c:set var='thistitle' value="${currentPage.threadsList.get(0).title}"
		scope="page" />
	<div id="m_menu">
		<jsp:include page="/jsps/left.jsp"></jsp:include>
	</div>


	<div id="m_content">
	<a name="anchor_top"> </a>
		<%-- <jsp:include page="content.jsp"></jsp:include> --%>
		<div id="sub_m_title">
			<ul>
				<li class="m_link_left"><a href="/mantou/jsps/success.jsp">馒头</a><span>
						/</span></li>
				<li class="m_link_left"><a
					href="/mantou/page_visit.action?subm=${currentPage.subm }">${currentPage.subTitle}</a><span>/</span></li>
				<li class="m_link_left"><a
					href="/mantou/page_reply.action?rid=${thistid}">No.${thistid}</a><span>
						/</span></li>
				<li class="m_link_left"><span>第&nbsp;${currentPage.pageCode }&nbsp;
						页 </span></li>
			</ul>

		</div>
		<h1>No.${thistid } - ${thistitle }</h1>

		<div id="m_thread_post">
			<form class="post active" id="post_form"
				action="/mantou/threads_reply.action?subm=${currentPage.subm }&tid=${thistid}"
				method="post" enctype="multipart/form-data">
				<div class="m_post">
					<div class="m_post_r">
						<div class="m_post_e">
							<div class="m_post_e_text">回复</div>
						</div>
						<div class="m_post_i">
							<span class="m_post_i_text" style="font-size: 18px;">&nbsp;&nbsp;No.${thistid}
							</span>
						</div>
					</div>
					<div class="m_post_r">
						<div class="m_post_e">
							<div class="m_post_e_text">标题</div>
						</div>
						<div class="m_post_i">
							<input type="text" name="threads.title" size="28" value=""
								maxlength="100">
						</div>
					</div>

					<div class="m_post_r">
						<div class="m_post_e">
							<div class="m_post_e_text">正文</div>
						</div>
						<div class="m_post_i">
							<c:choose>
								<c:when test="${currentPage.replyid != thistid}">

									<textarea name="threads.text" id="post_content">&gt;&gt;No.${currentPage.replyid}&lt;&lt;&#10</textarea>
								</c:when>
								<c:otherwise>
									<textarea name="threads.text" id="post_content"></textarea>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="m_post_r">
						<div class="m_post_e">
							<div class="m_post_e_text">贴图</div>
						</div>
						<div class="m_post_i">
							<div class="m_post_pic">
								<div class="m_post_pic_text" id="m_post_pic_text">选择图片</div>
								<input type="file" id="post_image" name="image" size="10"
									class="m_post_pic_hide" onmouseover="mover()"
									onmouseout="mout()">
							</div>
							<img id="tempimg" src="" style="display: none" /> <input
								type="submit" id="m_post_submit"
								onclick="return validatePostForm()" value="送出"
								onmouseover="this.style.backgroundColor='#aa9cff'"
								onmouseout="this.style.backgroundColor='#aa9cc2'">
						</div>

					</div>
					<div class="m_post_r">
						<font color="red"><s:fielderror /></font>
					</div>
				</div>

			</form>
		</div>
		<div id="sub_m_head">
			<p>${currentPage.subTips}</p>
		</div>


		<div id="m_threads_list">

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

						<span class="m_threads_info_title">${threads.title }</span> <span
							class="m_threads_info_time">${threads.createTime}</span> <span
							class="m_threads_info_uid">ID:${threads.uCookie }</span> <span
							class="m_threads_info_report"><a href="/mantou/manage_reports.action?tid=${threads.tid }">举报</a></span> <span
							class="m_threads_info_threadid">No.${threads.tid }</span> <span
							class="m_threads_info_reply"><a
							href="/mantou/page_reply.action?rid=${threads.tid}">回应</a></span>
					</div>
					<div class="m_threads_content">
						<c:if test="${threads.reftid != 0}">
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

					<div class="m_threads_tips" style="margin: 10px 0px 5px 0px;">
					</div>

					<div class="m_threads_replys">
						<c:set var='thisThread' value="${threads}" scope="page" />
						<c:forEach items="${currentPage.threadsMap[thisThread]}"
							var="reply">

							<div class="m_threads_reply">
								<div class="m_threads_reply_main">
									<c:if test="${reply.tImage != null && reply.tImage != '' }">
										<div class="m_threads_imagebox">
											<img class="m_threads_image" alt="${reply.tImage}"
												src="/mantou/images/${reply.tImage}">
										</div>
									</c:if>
									<div class="m_threads_info">
										<span class="m_threads_info_title">${reply.title}</span> <span
											class="m_threads_info_time">${reply.createTime}</span> <span
											class="m_threads_info_uid">ID:${reply.uCookie}</span> <span
											class="m_threads_info_report"><a href="/mantou/manage_reports.action?tid=${reply.tid }">举报</a></span> <span
											class="m_threads_info_threadid">No.${reply.tid}</span> <span
											class="m_threads_info_reply"><a
											href="/mantou/page_reply.action?rid=${reply.tid}">回应</a></span>
									</div>
									<div class="m_threads_content">
										<c:if test="${reply.reftid != 0}">
											<span class="m_threads_content_ref">&gt;&gt;No.${reply.reftid }&lt;&lt;</span>
											<div class="ref_threads">
												<div class="ref_threads_imagebox">
													<img class="ref_threads_image" alt="" src="">
												</div>
												<div class="ref_threads_info">
													<span class="ref_threads_info_title">无标题</span> <span
														class="ref_threads_info_time">1900-11-11 20:20:20</span> <span
														class="ref_threads_info_uid">ID:</span> <span
														class="ref_threads_info_report"><a
														href="/mantou/manage_reports.action?tid=${reply.reftid }">举报</a></span>
													<span class="ref_threads_info_threadid">No.1111</span> <span
														class="ref_threads_info_reply"><a
														href="/mantou/page_reply.action?rid=${reply.reftid}">回应</a></span>
												</div>

												<div class="ref_threads_content">
													<span class="ref_threads_content_ref"></span> <span
														class="ref_threads_content_text"></span>
												</div>
												<div style="clear: both;"></div>

											</div>
										</c:if>
										<br />${reply.text}<br />
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

				</div>

			</c:forEach>

		</div>

		<c:choose>
			<c:when test="${currentPage.getTotalReplyPages() < 15 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="${currentPage.getTotalReplyPages() }" />
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${currentPage.pageCode - 7 }" />
				<c:set var="end" value="${currentPage.pageCode + 7 }" />
				<c:if test="${begin < 1 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="15" />
				</c:if>
				<c:if test="${end > currentPage.getTotalReplyPages() }">
					<c:set var="begin" value="${currentPage.getTotalReplyPages()-14 }" />
					<c:set var="end" value="${currentPage.getTotalReplyPages()}" />
				</c:if>
			</c:otherwise>
		</c:choose>


		<div id="m_page">
			<ul>
				<li class="m_page_code"><a
					href="${currentPage.url }&pageCode=1">首页</a></li>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${i eq currentPage.pageCode }">
							<li class="m_page_code"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li class="m_page_code"><a
								href="${currentPage.url }&pageCode=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if
					test="${currentPage.pageCode < currentPage.getTotalReplyPages() }">
					<li class="m_page_code"><a
						href="${currentPage.url }&pageCode=${ currentPage.pageCode+1}">下一页</a></li>
				</c:if>

			</ul>
			<div class="m_page_jump">
				本串共 ${currentPage.getTotalReplyPages()} 页 &nbsp; 到 第<input
					type="text" id="gotoPageCode" value="${currentPage.pageCode}" />页
				<a href="javascript:jump();">确定</a>
				<a name="anchor_bottom"> </a>
			</div>
		</div>
	</div>


	<jsp:include page="/jsps/bottom.jsp"></jsp:include>

</body>
</html>