package io.uicp.tincat.mantou.user.common.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import io.uicp.tincat.mantou.user.dao.UserDao;
import io.uicp.tincat.mantou.user.entity.User;



public class AuthorityInterceptor extends MethodFilterInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private UserDao userDao;
	
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		System.out.println("AuthorityInterceptor : 在"+invocation.getProxy().getMethod()+"  action执行之前");
		
		String result = null;
		/*Cookie[] cookies = ServletActionContext.getRequest().getCookies();
		
		String usercookie = null;
		for (Cookie cookie : cookies) {
			if ("usercookie".equals(cookie.getName())) {
				usercookie = cookie.getValue();
			}
		}
		
		if (usercookie != null) {
			result = invocation.invoke();
		} else {
			ServletActionContext.getRequest().setAttribute("error", "请先登录！");
			result = "noauthority";
		}*/
		User user = (User)ActionContext.getContext().getSession().get("currentUser");
		if(user != null){
			result = invocation.invoke();
		}else{
			//result = "noauthority";
			result = invocation.invoke();
		}
		System.out.println("AuthorityInterceptor : 在"+invocation.getProxy().getMethod()+" 执行之后");
		return result;
	}

}
