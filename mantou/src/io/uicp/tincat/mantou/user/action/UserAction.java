package io.uicp.tincat.mantou.user.action;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import io.uicp.tincat.mantou.user.entity.User;
import io.uicp.tincat.mantou.user.service.UserService;
import io.uicp.tincat.mantou.util.Const;
import io.uicp.tincat.mantou.util.CookieUtil;
import io.uicp.tincat.mantou.util.Email;
import io.uicp.tincat.mantou.util.EmailUtil;
import io.uicp.tincat.mantou.util.StringUtil;

@Controller
public class UserAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;

	@Resource
	private UserService userService;

	private User user;
	private String error;
	private String newpw;

	public String getNewpw() {
		return newpw;
	}

	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String anonymousUserLogin(){
		HttpSession session = request.getSession();
		Cookie userCookie = CookieUtil.getUserCookie(request);
		User currentUser = (User) session.getAttribute("currentUser");
		
		if(userCookie==null){
			//新用户
			User anonymousUser = CookieUtil.getNewAnonymousUser();
			session.setAttribute("currentUser", anonymousUser);
			Cookie cookie = new Cookie("usercookie", anonymousUser.getCookie());
			cookie.setMaxAge(60 * 60 * 24 * 7);// 保存一周
			cookie.setPath("/");
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addCookie(cookie);
		}else{
			if(currentUser==null || currentUser.getUid()!=48){
				User anonymousUser = CookieUtil.getNewAnonymousUser(userCookie);
				session.setAttribute("currentUser", anonymousUser);
			}
		}
		return SUCCESS;
	}
	
	
	public String login() throws Exception {
		HttpSession session = request.getSession();
		User currentUser = userService.login(user);
		if (currentUser == null) {
			error = "用户名或密码错误！";
			return ERROR;

		} else {
			if (currentUser.getUserStatus() != Const.USER_STATUS_ACTIVE && currentUser.getUserStatus() != Const.USER_STATUS_ADMIN) {
				error = "您的账号现在无法登陆！";
				return ERROR;
			} else {
				session.setAttribute("currentUser", currentUser);
				Cookie cookie = new Cookie("usercookie", currentUser.getCookie());
				cookie.setMaxAge(60 * 60 * 24 * 7);// 保存一周
				ServletActionContext.getResponse().addCookie(cookie);
				cookie = new Cookie("m_trace", "1");// 记住我
				cookie.setMaxAge(60 * 60 * 24 * 7);// 保存一周
				ServletActionContext.getResponse().addCookie(cookie);
				cookie = new Cookie("rm", "1");// 记住我
				cookie.setMaxAge(60 * 60 * 24 * 7);// 保存一周
				ServletActionContext.getResponse().addCookie(cookie);
				return SUCCESS;
			}
		}
	}

	public String exit() {
		HttpSession session = request.getSession();
		Cookie cookie = new Cookie("rm", null);
		cookie.setMaxAge(0);
		ServletActionContext.getResponse().addCookie(cookie);
		session.invalidate();

		return "index";

	}

	public String regist() {

		try {
			userService.regist(user);
		} catch (MessagingException e) {
			return "regist_fail";
		}

		return "regist_success";

	}

	public void ajaxRegist() throws IOException {
		String userName = request.getParameter("name");
		String passWord = request.getParameter("password");
		String userStatus = request.getParameter("status");
		User user = new User();
		user.setUserName(userName);
		user.setPassWord(passWord);
		user.setUserStatus(Integer.parseInt(userStatus));
		userService.ajaxRegist(user);
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer = response.getWriter();
		writer.print("success");
		writer.flush();
		writer.close();
	}

	public String password() {

		return "password";

	}

	public String changePassword() {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		user.setUserName(currentUser.getUserName());
		if (currentUser.equals(userService.login(user))) {
			user.setPassWord(newpw);
			currentUser = userService.changePassword(currentUser, user);
			session.setAttribute("currentUser", currentUser);
			return "changepassword_success";
		} else {
			error = "当前密码错误!";
			return "changepassword_fail";
		}

	}

	public void ajaxUserName() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName = request.getParameter("userName");
		String isExist = String.valueOf(userService.ajaxUserName(userName));
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer = response.getWriter();
		writer.print(isExist);
		writer.flush();
		writer.close();
	}

	public void ajaxEmail() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String email = request.getParameter("email");
		String isExist = String.valueOf(userService.ajaxEmail(email));
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer = response.getWriter();
		writer.print(isExist);
		writer.flush();
		writer.close();

	}

	public String validateRegist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String usercookie = request.getParameter("usercookie");
		User currentUser = userService.validateRegist(usercookie);
		if (currentUser != null) {
			return "validation_success";
		} else {
			return "outofdate";
		}
	}

	public void ajaxSwitchUserStatus() throws IOException {
		String uid = request.getParameter("uid");
		String result;
		if (uid == "") {
			result = "请输入用户编号！";
		} else {
			result = userService.ajaxSwitchUserStatus(uid);
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(result);
		writer.flush();
		writer.close();
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

}
