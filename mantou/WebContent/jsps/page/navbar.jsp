<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar  navbar-inverse  navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
	                data-target="#mantou-navbar-collapse">
	            <span class="sr-only">切换导航</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	        </button>
			<a class="navbar-brand " href="/mantou/jsps/success.jsp">馒头！</a>
		</div>
		<div class="collapse navbar-collapse" id="mantou-navbar-collapse">
			<ul class="nav navbar-nav  navbar-right ">
				<li class="active"><a href="#">${currentUser.userName }</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 关于 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="https://github.com/DQMT/mantou" target="_blank"><img
								alt="(´・ω・`)图片加载失败了" height="26px" width="36px"
								src="/mantou/images/github.jpg">&nbsp; &nbsp;源代码 </a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 选项 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="/mantou/page_history.action">回复历史</a></li>
						<c:if test="${currentUser.uid ne 48}">
						<li><a href="/mantou/user_password.action">修改密码</a></li>
						</c:if>
						<li class="divider"></li>
						<li><a href="#">分离的链接</a></li>
						<li class="divider"></li>
						<li><a href="#">另一个分离的链接</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>