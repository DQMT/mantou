package io.uicp.tincat.mantou.user.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import io.uicp.tincat.mantou.user.dao.UserDao;
import io.uicp.tincat.mantou.user.entity.User;
import io.uicp.tincat.mantou.util.Email;
import io.uicp.tincat.mantou.util.EmailUtil;
import io.uicp.tincat.mantou.util.StringUtil;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	@Override
	public User login(User user) {
		return userDao.findUserByNameAndPassword(user);
	}

	@Override
	public boolean ajaxUserName(String userName) {
		return userDao.isUserExistByName(userName);
	}

	@Override
	public boolean ajaxEmail(String email) {
		return userDao.isUserExistByEmail(email);
	}

	@Override
	public void regist(User user) throws MessagingException {
		String cookie = StringUtil.getRandomString(16);
		user.setCookie(cookie);
		user.setUserStatus(1);
		userDao.saveUser(user);

		Properties props = new Properties();
		try {
			// props.load(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"));
			// 会导致utf-8中文乱码
			props.load(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"), "UTF-8"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		props.setProperty("receiver", user.getEmail());
		props.setProperty("content", props.getProperty("content").replace("[cookie]", user.getCookie()).replace("[name]", user.getUserName()));

		Email email = new Email(props);

		EmailUtil.sendEmail(email);

	}

	@Override
	public User validateRegist(String cookie) {
		User currentUser = userDao.findUserByCookie(cookie);
		if (currentUser != null && currentUser.getUserStatus() == 1) {
			currentUser.setUserStatus(2);
			userDao.updateUser(currentUser);
			return currentUser;
		} else {
			return null;
		}
	}

	@Override
	public User changePassword(User currentUser, User user) {
		currentUser.setPassWord(user.getPassWord());
		userDao.updateUser(currentUser);
		return currentUser;
	}

	@Override
	public String ajaxSwitchUserStatus(String uid) {
		Integer id = Integer.parseInt(uid);
		User user = userDao.findUserById(id);
		if (user instanceof User) {
			user = userDao.switchUserStatus(user);
			if (user instanceof User) {
				return user.getUserStatus() == 2 ? "状态修改成功，当前状态：普通用户" : "状态修改成功，当前状态：被封禁用户";
			} else {
				return "你无权限修改该用户状态！";
			}
		} else {
			return "该用户不存在！";
		}
	}

	@Override
	public void ajaxRegist(User user) {
		String cookie = StringUtil.getRandomString(16);
		user.setCookie(cookie);
		user.setEmail(user.getUserName() + "@mantou.com");
		userDao.saveUser(user);

	}

}
