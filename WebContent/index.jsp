<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.*"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page autoFlush="true" buffer="3000kb"%>
<%-- <%
	ActionContext ctx = ActionContext.getContext();
	Cookie cookies[] = request.getCookies();
	String rm=null;
	for (Cookie cookie : cookies) {
		if ("rm".equals(cookie.getName())) {
			rm = cookie.getValue();
		}
	}
	
	if (rm!=null) {
		response.sendRedirect("/mantou/jsps/success.jsp");
	} else {
		response.sendRedirect("/mantou/jsps/login.jsp");
	}
	
%>
 --%>

<jsp:forward page="/jsps/login.jsp" />
<%-- <script type="text/javascript">
$(function() {
	$("#anonymousUserLogin").click();
});
</script>
<body>
	<form action="/mantou/user_anonymousUserLogin.action" method="post">
		<input type="submit" id="anonymousUserLogin" value="登录" />
	</form>
</body> --%>
<%-- <jsp:forward page="/jsps/success.jsp" /> --%>

