<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<br />
<br />
<h1>用户管理</h1>


<div id="sub_m_head">
	<p>管理员可以在此页面进行用户的管理</p>
</div>
<br />
<br />
<br />
<div class="tabbable" id="tabs-710970">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#panel-436075" data-toggle="tab">查询用户</a>
		</li>
		<li><a href="#panel-557564" data-toggle="tab">封禁/解封</a></li>
		<li><a href="#panel-557566" data-toggle="tab">新建账户</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="panel-436075">
			<div class="sub_m_users_content" id="user_query_content">
				<div class="user_query">
					<form action="/mantou/manage_userSearch.action">
						<span>用户编号</span> <input type="text" value="${no}" name="no">
						<span>用户名</span> <input type="text" value="${name}" name="name">
						<span>用户ID</span> <input type="text" value="${id}" name="id">
						<input type="submit" value="查询">
					</form>
				</div>
				<div class="user_result">
					<div class="user_info_title">查询结果：</div>
					<div class="user_info_div">
						<c:if test="${users != null && empty users }">
							<span class="no_results">查无此人！</span>
						</c:if>
						<c:if test="${not empty users}">
							<table class="user_info_table">
								<tr>
									<th><span>用户编号</span></th>
									<th><span>用户名</span></th>
									<th><span>ID</span></th>
									<th><span>用户状态</span></th>
								</tr>
								<c:forEach items="${users }" var="user">
									<tr>
										<td><span>${user.uid }</span></td>
										<td><span>${user.userName }</span></td>
										<td><span>${user.cookie }</span></td>
										<td><c:choose>
												<c:when test="${user.userStatus == 2 }">
													<span>普通用户</span>
												</c:when>
												<c:when test="${user.userStatus == 0 }">
													<span>管理员</span>
												</c:when>
												<c:when test="${user.userStatus == 1 }">
													<span>未激活用户</span>
												</c:when>
												<c:when test="${user.userStatus == 3 }">
													<span>被封禁用户</span>
												</c:when>
												<c:otherwise>
													<span>非正常用户</span>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="panel-557564">
			<div class="sub_m_users_content" id="user_ban_content">
					<span class="user_info_title">请输入用户编号</span> <input type="text"
						value="${no}" name="no" id="userNum"> <input type="submit"
						id="user_ban_btn" onclick="javascript:userBan();" value="封禁/解封">
					<span id="user_ban_error"></span>
				</div>
		</div>
		<div class="tab-pane" id="panel-557566">
			<span class="user_reg_title">用户名：</span> <input type="text"
						name="user.userName" class="inputClass" id="loginName"> <span
						class="user_reg_title error" id="loginNameError"><font
						color="red"></font></span> <span class="user_reg_title">密码：</span> <input
						type="password" name="user.passWord" class="inputClass"
						id="passWord"> <span class="user_reg_title error"
						id="passWordError"><font color="red"></font></span>
					<div>
						<span>管理员身份</span> <input type="checkbox" id="user_status"
							name="adm" value="1"> <input type="submit"
							id="user_register_btn" onclick="javascript:ajaxRegist();"
							value="新建">
					</div>
					<span class="user_reg_title"><font id="user_reg_result"
						color="red"> </font></span>
		</div>
	</div>
</div>

