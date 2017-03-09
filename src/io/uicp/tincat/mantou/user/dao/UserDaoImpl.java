package io.uicp.tincat.mantou.user.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import io.uicp.tincat.mantou.basedao.BaseDao;
import io.uicp.tincat.mantou.basedao.BaseDaoImpl;
import io.uicp.tincat.mantou.user.entity.User;
import io.uicp.tincat.mantou.util.Const;

@Repository("userDao")
@SuppressWarnings("all")
public class UserDaoImpl implements UserDao {

	@Resource
	private BaseDao<User> baseDao;

	@Override
	public void saveUser(User user) {
		baseDao.save(user);

	}

	@Override
	public void updateUser(User user) {
		baseDao.update(user);

	}

	@Override
	public User findUserByCookie(String cookie) {
		return baseDao.get("from User u where u.cookie=?", new Object[] { cookie });

	}

	@Override
	public User findUserById(Integer id) {
		return baseDao.get(User.class, id);

	}

	@Override
	public User findUserByName(String name) {
		return baseDao.get("from User u where u.userName=?", new Object[] { name });
	}

	@Override
	public void deleteUser(User user) {
		baseDao.delete(user);

	}

	@Override
	public List<User> findAllList() {
		return baseDao.find("from User");
	}

	@Override
	public User findUserByNameAndPassword(User user) {
		return baseDao.get("from User u where u.userName=? and u.passWord=?", new Object[] { user.getUserName(), user.getPassWord() });
	}

	@Override
	public boolean isUserExistByName(String userName) {
		long userCount = baseDao.count("select count(*) from User u where u.userName=?", new Object[] { userName });
		if (0 < userCount) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isUserExistByEmail(String email) {
		long userCount = baseDao.count("select count(*) from User u where u.email=?", new Object[] { email });
		if (0 < userCount) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean banUserByUid(Integer uid) {
		User user = this.findUserById(uid);
		if (user instanceof User && user.getUserStatus() == Const.USER_STATUS_ACTIVE) {
			user.setUserStatus(Const.USER_STATUS_BANNED);
			this.updateUser(user);
			return true;
		}
		return false;
	}

	@Override
	public boolean isQualified(Integer uid) {
		if (uid == Const.ANONYMOUS_USER_ID) {//匿名用户
			return true;
		}
		User user = this.findUserById(uid);
		if (user instanceof User && (user.getUserStatus() == Const.USER_STATUS_ADMIN || user.getUserStatus() == Const.USER_STATUS_ACTIVE)) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public List<User> searchUsers(String no, String name, String id) {
		String hql = "from User u where 1=1 ";
		List<Object> list = new ArrayList<Object>();

		if (no != "") {
			hql = hql + "and u.uid = ? ";
			list.add(Integer.parseInt(no));
		}
		if (name != "") {
			hql = hql + "and u.userName like ?";
			list.add("%" + name + "%");
		}
		if (id != "") {
			hql = hql + "and u.cookie like ?";
			list.add("%" + id + "%");
		}
		return baseDao.find(hql, list);
	}

	@Override
	public User switchUserStatus(User user) {
		if(user.getUserStatus()==Const.USER_STATUS_BANNED){
			user.setUserStatus(Const.USER_STATUS_ACTIVE);
			this.updateUser(user);
			return user;
		}else if(user.getUserStatus()==Const.USER_STATUS_ACTIVE){
			user.setUserStatus(Const.USER_STATUS_BANNED);
			this.updateUser(user);
			return user;
		}else{
			return null;
		}
		
	}

}