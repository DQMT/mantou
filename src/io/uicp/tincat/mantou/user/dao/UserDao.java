package io.uicp.tincat.mantou.user.dao;

import java.util.List;

import io.uicp.tincat.mantou.user.entity.User;

public interface UserDao {
	public void saveUser(User user);

	public void updateUser(User user);

	public User findUserByCookie(String cookie);

	public User findUserById(Integer id);

	public User findUserByName(String name);

	public void deleteUser(User user);

	public List<User> findAllList();

	public User findUserByNameAndPassword(User user);

	// public boolean isUserExistByName(User user);

	public boolean isUserExistByName(String userName);

	public boolean isUserExistByEmail(String email);

	public boolean banUserByUid(Integer uid);

	public boolean isQualified(Integer uid);

	public List<User> searchUsers(String no, String name, String id);
	
	public User switchUserStatus(User user);
}
