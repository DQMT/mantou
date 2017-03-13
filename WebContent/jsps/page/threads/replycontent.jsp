<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<link href="/mantou/jsps/css/main.css" type="text/css" rel="stylesheet" />
<link href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var maxcode = "${currentPage.getTotalPages()}";
	var url = "${currentPage.url}";
</script>
<c:set var='thistid' value="${currentPage.threadsList.get(0).tid}"
	scope="page" />
<c:set var='thistitle' value="${currentPage.threadsList.get(0).title}"
	scope="page" />
	
<%@ include file="/jsps/page/base/submtitle.jsp"%>	

<div class="h1 text-center">No.${thistid } - ${thistitle }</div>
<div class="row">
	<div class="col-md-4 column"></div>
	<div class="col-md-4 column col-center-block">
		<form class="form"  id="post_form"
			action="/mantou/threads_post.action?subm=${currentPage.subm }"
			method="post" enctype="multipart/form-data">
			<div class="input-group">
				<span class="input-group-addon" >标题</span>
				<input  type="text"  class="form-control" name="threads.title" size="28" value=""
					maxlength="100">
			</div>
			 <div class="input-group">
				<span class="input-group-addon" >正文</span>
				<textarea  class="form-control" name="threads.text" id="post_content"></textarea>
			</div>
			<div class="input-group">
				<span class="input-group-addon">贴图</span>
				<div style="display:inline-block; margin-left:30px"><span>选择图片</span></div>
				 <input style="display:inline-block; float:right"
					type="submit" id="m_post_submit"
					onclick="return validatePostForm()" value="送出"
					onmouseover="this.style.backgroundColor='#aa9cff'"
					onmouseout="this.style.backgroundColor='#aa9cc2'">
				<%-- <div class="m_post_r">
					<font color="red"><s:fielderror /></font>
				</div> --%>
			</div>
			<div class="m_post"></div> 

		</form>
	</div>
	<div class="col-md-4 column"></div>
	
</div>
<div class="row">
	<div class="col-md-4 column"></div>
	<div class="col-md-4 column">
		<div class="sub_m_head text-center">
			<p>${currentPage.subTips}</p>
		</div>
	</div>
	<div class="col-md-4 column"></div>
	
</div>


<div class="row">
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

					<div class="m_threads_tips" style="margin: 10px 0px 5px 0px;">
						<c:set var='listIndex' value="${st.index}" scope="page" />
						<c:set var='hideReplies'
							value="${currentPage.repliesCount[listIndex] -currentPage.threadSize}"
							scope="page" />
						<c:if test="${hideReplies > 0 }">
							<i class="m_threads_replys_hideTips" style="color: gray;">
								回应有 ${hideReplies} 篇被省略。要阅读所有回应请按下回应链接。</i>
						</c:if>
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
										<span class="m_threads_info_title"><c:if
												test="${empty  reply.title }">无标题</c:if>${reply.title}</span> <span
											class="m_threads_info_time">${reply.createTime}</span> <span
											class="m_threads_info_uid">ID:${reply.uCookie}</span> <span
											class="m_threads_info_report"><a
											href="/mantou/manage_reports.action?tid=${reply.tid }">举报</a></span>
										<span class="m_threads_info_threadid">No.${reply.tid}</span> <span
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
</div>

		