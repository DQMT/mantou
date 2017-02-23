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

<title>main</title>
<link href="/mantou/jsps/css/main.css" type="text/css" rel="stylesheet" />
<link href="/mantou/jsps/css/manage.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src="/mantou/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/mantou/jsps/js/page/main.js"></script>
<script type="text/javascript">
$(function() {
	$("option").each(function(index,domEle){ 
		var x = $(domEle).parent().attr("deal");
		if($(domEle).attr("value")==x){
			$(domEle).attr("selected",true);
			$(domEle).css("background","wheat");
		}
		
	})
});
</script>
</head>
<body>

	<div id="m_menu">
		<jsp:include page="/jsps/left.jsp"></jsp:include>
	</div>
	<!-- 	<iframe id ="m_content" src="/mantou/jsps/page/content.jsp">
		
		</iframe> -->
	<div id="m_content">
		<a name="anchor_top"> </a>
		<%-- <jsp:include page="content.jsp"></jsp:include> --%>
		<div id="sub_m_title">
			<ul>
				<li class="m_link_left"><a href="/mantou/jsps/success.jsp">馒头</a><span>/</span></li>
				<li class="m_link_left"><a href="">值班室</a><span>/</span></li>
				<li class="m_link_left"><span>第&nbsp;${currentReportPage.pageCode }&nbsp;
						页 </span></li>
			</ul>

		</div>
		<h1>值班室</h1>

		<div id="m_thread_post">
			<form class="post active" id="post_form"
				action="/mantou/manage_addReport.action" method="post">
				<div class="m_post">
					<div class="m_post_r">
						<div class="m_post_e">
							<div class="m_post_e_text">举报：</div>
						</div>
						<div class="m_post_i">
							<input type="text" name="report.tid" size="28"
								value="${param.tid}" maxlength="100">
						</div>
					</div>

					<div class="m_post_r">
						<div class="m_post_e">
							<div class="m_post_e_text">理由：</div>
						</div>
						<div class="m_post_i">
							<textarea name="report.reason" id="post_content"></textarea>
						</div>
					</div>
					<div class="m_post_r">
						<div class="m_post_e" style="visibility: hidden;">
							<div class="m_post_e_text"></div>
						</div>
						<div class="m_post_i">
							<div class="m_post_pic" style="visibility: hidden;">
								<div class="m_post_pic_text" id="m_post_pic_text"></div>
								<input type="file" id="post_image" name="image" size="10"
									class="m_post_pic_hide" onmouseover="mover()"
									onmouseout="mout()">
							</div>
							<img id="tempimg" src="" style="display: none" /> <input
								type="submit" id="m_post_submit" value="确定"
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
			<p>维护环境靠大家</p>
		</div>


		<div id="m_threads_list">
			<div class="report_main">
				<table class="report_table">
					<tr>
						<th>编号</th>
						<th>串号</th>
						<th>作者</th>
						<th>举报人</th>
						<th>举报原因</th>
						<th>举报时间</th>
						<th>处理时间</th>
						<th>处理结果</th>
					</tr>
					<c:forEach items="${currentReportPage.reportList }" var="report"
						varStatus="st">

						<tr>
							<td>No.${report.rid }</td>

							<td style="text-align: left;">
								<div>
									<c:choose>
										<c:when test="${report.status==1 }">
											<a href="/mantou/page_reply.action?rid=${report.tid}"
												class="m_threads_content_ref">No.${report.tid }</a>
											<div class="ref_threads">
												<div class="ref_threads_imagebox">
													<img class="ref_threads_image" alt="" src="">
												</div>
												<div class="ref_threads_info">
													<span class="ref_threads_info_title">无标题</span> <span
														class="ref_threads_info_time">1900-11-11 20:20:20</span> <span
														class="ref_threads_info_uid">ID:</span> <span
														class="ref_threads_info_report"><a href="">举报</a></span> <span
														class="ref_threads_info_threadid">No.1111</span> <span
														class="ref_threads_info_reply"><a
														href="/mantou/page_reply.action?rid=${report.tid}">回应</a></span>
												</div>


												<div class="ref_threads_content">
													<span class="ref_threads_content_ref"></span> <span
														class="ref_threads_content_text"></span>
												</div>
												<div style="clear: both;"></div>

											</div>

										</c:when>
										<c:otherwise>
											<span class="m_threads_content_ref">No.${report.tid }</span>
										</c:otherwise>
									</c:choose>

								</div>
							</td>

							<td>${report.toUid }</td>
							<td>${report.fromUid }</td>
							<td>${report.reason }</td>
							<td>${report.createTime }</td>
							<td>${report.updateTime }</td>
							<c:choose>
								<c:when test="${currentUser.getUserStatus()=='0' }">
									<td>
										<form class="manage_deal"
											action="/mantou/manage_deal.action?rid=${report.rid}"
											method="post">
											<select name="action" class="sel"
												deal=${report.status }>
												<option value="1">不处理</option>
												<option value="2">删除回复</option>
												<option value="3">删除整串</option>
												<option value="4">封号</option>
												<option value="5">删除回复+封号</option>
												<option value="6">删除整串+封号</option>
											</select> 
											<input type="submit" value="保存">
										</form>
									</td>
								</c:when>
								<c:otherwise>
									<td>${report.result }</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<c:choose>
			<c:when test="${currentReportPage.getTotalPages() < 15 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="${currentReportPage.getTotalPages() }" />
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${currentReportPage.pageCode - 7 }" />
				<c:set var="end" value="${currentReportPage.pageCode + 7 }" />
				<c:if test="${begin < 1 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="15" />
				</c:if>
				<c:if test="${end > currentReportPage.getTotalPages() }">
					<c:set var="begin" value="${currentReportPage.getTotalPages()-14 }" />
					<c:set var="end" value="${currentReportPage.getTotalPages()}" />
				</c:if>
			</c:otherwise>
		</c:choose>


		<div id="m_page">
			<ul>
				<li class="m_page_code"><a
					href="/mantou/manage_reports.action?pageCode=1">首页</a></li>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${i eq currentReportPage.pageCode }">
							<li class="m_page_code"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li class="m_page_code"><a
								href="/mantou/manage_reports.action?pageCode=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if
					test="${currentReportPage.pageCode < currentReportPage.getTotalPages() }">
					<li class="m_page_code"><a
						href="/mantou/manage_reports.action?pageCode=${ currentReportPage.pageCode+1}">下一页</a></li>
				</c:if>

			</ul>
			<div class="m_page_jump">
				本版共 ${currentReportPage.getTotalPages()} 页 &nbsp; 到 第<input
					type="text" id="gotoPageCode" value="${currentReportPage.pageCode}" />页
				<a href="javascript:jump();">确定</a>
				<a name="anchor_bottom"> </a>
			</div>
		</div>
	</div>


	<jsp:include page="/jsps/bottom.jsp"></jsp:include>

</body>
</html>