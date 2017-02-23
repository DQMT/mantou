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

<script type="text/javascript">
	var maxcode = "${currentPage.getTotalPages()}";
	var url = "${currentPage.url}";
	/* $("#input-zh").fileinput({
	    language: "zh", 
	    uploadUrl: "/file-upload-batch/2",
	    allowedFileExtensions: ["jpg", "png", "gif"]
	});  */
	
	
	function handleFile(){
		var filename = $("#post_image").val();
		filename = filename.replace("C:\\fakepath\\","");
		$("input[name='upFileName']").val(filename);
	}
	
	function inputfile(){
		$("#post_image").click();
	}
</script>

<c:set var='thistid' value="${currentPage.threadsList.get(0).tid}"
	scope="page" />
<c:set var='thistitle' value="${currentPage.threadsList.get(0).title}"
	scope="page" />
	
<div id="sub_m_title">
	<ul class="breadcrumb">
		<li><a href="/mantou/jsps/success.jsp">馒头</a> <span class="divider"></span></li>
		<li><a href="${currentPage.url }">${currentPage.subTitle}</a> <span class="divider"></span></li>
		<li class="active"><span>第&nbsp;${currentPage.pageCode }&nbsp;
						页 </span></li>
	</ul>
</div>
<c:if test="${currentPage.visitType eq 1}"> <!-- 回复模式 -->
	<c:if test="${empty thistitle }">
		<div class="h1 text-center">No.${thistid } - 无标题</div>
	</c:if>
	<c:if test="${not empty thistitle }">
		<div class="h1 text-center">No.${thistid } - ${thistitle}</div>
	</c:if>
</c:if>
<c:if test="${currentPage.visitType eq 0}"> <!-- 发串模式 -->
	<div class="h1 text-center">${currentPage.subTitle}</div>
</c:if>

<div class="row">
	<div class="col-md-4 column"></div>
	<div class="col-md-4 column col-center-block">
	<c:if test="${currentPage.visitType eq 1}"> <!-- 回复模式 -->
		<form class="form"  id="post_form"
			action="/mantou/threads_reply.action?subm=${currentPage.subm }&tid=${thistid}"
			method="post" enctype="multipart/form-data">
			<div class="input-group">
				<span class="input-group-addon" >回复</span>
				<span style="font-size: 18px;">&nbsp;&nbsp;No.${thistid}</span>
			</div>
			<div class="input-group">
				<span class="input-group-addon" >标题</span>
				<input  type="text"  class="form-control" name="threads.title" size="28" value=""
					maxlength="100">
			</div>
			 <div class="input-group">
				<span class="input-group-addon" >正文</span>
				<c:choose>
					<c:when test="${currentPage.replyid != thistid }">
						<textarea class="form-control" name="threads.text" id="post_content">&gt;&gt;No.${currentPage.replyid}&lt;&lt;&#10</textarea>
					</c:when>
					<c:otherwise>
						<textarea class="form-control" name="threads.text" id="post_content"></textarea>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="input-group">
				<span class="input-group-addon">贴图</span>
				<input  type="text"  class="form-control" name="upFileName" size="28" disabled="disabled" value=""
					maxlength="100">
				<span class="input-group-btn"> <button class="btn btn-default" type="button" onclick="inputfile();">选择文件</button> </span>
				<span class="input-group-btn"> <button class="btn btn-default" type="submit" onclick="return validatePostForm();" >送出</button> </span>	
			</div>
			<input  id="post_image" name="image" type="file" class="m_post_pic_hide" style="visibility: hidden;" onchange="handleFile();">	
			<div class="m_post"></div> 

		</form>		
	</c:if>
	<c:if test="${currentPage.visitType eq 0}"> <!-- 发串模式 -->
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
				<textarea class="form-control" name="threads.text" id="post_content"></textarea>
			</div>
			<div class="input-group">
				<span class="input-group-addon">贴图</span>
				<input  type="text"  class="form-control" name="upFileName" size="28" disabled="disabled" value=""
					maxlength="100">
				<span class="input-group-btn"> <button class="btn btn-default" type="button" onclick="inputfile();">选择文件</button> </span>
				<span class="input-group-btn"> <button class="btn btn-default" type="submit" onclick="return validatePostForm();" >送出</button> </span>	
			</div>
			<input  id="post_image" name="image" type="file" class="m_post_pic_hide" style="visibility: hidden;" onchange="handleFile();">		
			<div class="m_post"></div> 
		</form>
	</c:if>
			
		
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
					<!-- <hr class="line" /> -->
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

		