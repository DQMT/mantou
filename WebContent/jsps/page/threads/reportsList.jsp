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
<script type="text/javascript" >
	function validateReportForm(){
		if (isNaN($("input[name='report.tid']").val())){
			alert("请输入正确串号");
			return false;
		}
		return true;
	}
</script>


<div id="sub_m_title">
	<ul class="breadcrumb">
		<li><a href="/mantou/jsps/success.jsp">馒头</a> <span class="divider"></span></li>
		<li><a href="${currentPage.url }">${currentPage.subTitle}</a> <span class="divider"></span></li>
		<li class="active"><span>第&nbsp;${currentPage.pageCode }&nbsp;
						页 </span></li>
	</ul>
</div>

<div class="row">
	<div class="col-md-4 column"></div>
	<div class="col-md-4 column col-center-block">
		<form class="form"  id="post_form"
			action="/mantou/manage_addReport.action"
			method="post" enctype="multipart/form-data">
			<div class="input-group">
				<span class="input-group-addon" >举报串号：</span>
				<input  type="text"  class="form-control" name="report.tid" size="28" value="${param.tid}"
					maxlength="100">
			</div>
			 <div class="input-group">
				<span class="input-group-addon" >举报理由：</span>
				<textarea  class="form-control" name="report.reason" id="post_content"></textarea>
			</div>
			<div class="input-group">
				<%-- <span class="input-group-addon">贴图:</span> --%>
				<input  type="text"  class="form-control" name="upFileName" size="28" disabled="disabled" value=""
					maxlength="100">
				<span class="input-group-btn"> <button class="btn btn-default" type="submit" onclick="return validateReportForm();" >送出</button> </span>	
			</div>
			<div class="m_post"></div> 

		</form>
	</div>
	<div class="col-md-4 column"></div>
	
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
		