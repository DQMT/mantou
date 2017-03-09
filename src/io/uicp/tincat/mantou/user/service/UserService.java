package io.uicp.tincat.mantou.user.service;

import javax.mail.MessagingException;

import io.uicp.tincat.mantou.user.entity.User;

public interface UserService {
	public User login(User user);

	public boolean ajaxUserName(String userName);

	public boolean ajaxEmail(String email);

	public void regist(User user) throws MessagingException;

	public void ajaxRegist(User user);
	
	public User validateRegist(String cookie);

	public User changePassword(User currentUser, User user);
	
	public String ajaxSwitchUserStatus(String uid);

}
