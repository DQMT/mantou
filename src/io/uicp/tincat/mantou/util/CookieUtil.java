package io.uicp.tincat.mantou.util;

import io.uicp.tincat.mantou.user.entity.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	public static Cookie[] getCookies(HttpServletRequest request){
		return request.getCookies();
	}
	
	public static Cookie getUserCookie(HttpServletRequest request){
		Cookie[] cookies = getCookies(request);
		for (Cookie cookie : cookies) {
			if ("usercookie".equals(cookie.getName())) {
				return cookie;
			}
		}
		return null;
	}
	
	//生成新的匿名用户
	public static User getNewAnonymousUser(){
		User user = new User();
		user.setUid(Const.ANONYMOUS_USER_ID);
		user.setEmail("");
		user.setPassWord("");
		user.setUserName(Const.ANONYMOUS_USER_NAME);
		user.setUserStatus(Const.USER_STATUS_ACTIVE);
		String cookieString = StringUtil.getRandomString(36);
		user.setCookie(cookieString);
		return user;
	}
	
	public static User getNewAnonymousUser(Cookie cookie){
		User user = new User();
		user.setUid(Const.ANONYMOUS_USER_ID);
		user.setEmail("");
		user.setPassWord("");
		user.setUserName(Const.ANONYMOUS_USER_NAME);
		user.setUserStatus(Const.USER_STATUS_ACTIVE);
		user.setCookie(cookie.getValue());
		return user;
	}
}
