package io.uicp.tincat.mantou.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_user")
public class User {

	private Integer uid;
	private String userName;
	private String passWord;
	private String email;
	private Integer userStatus;
	private String cookie;

	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "uid", length = 16, unique = true, nullable = false)
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	@Column(name = "userName", length = 20)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "passWord", length = 20)
	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "userStatus", length = 1)
	public Integer getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}

	/*
	 * public boolean isInvalid(){ return this.getUserStatus()==1; }
	 * 
	 * public boolean isAdmin(){ return this.getUserStatus()==0; }
	 * 
	 * public void setUserValid(){ this.userStatus = 2; }
	 */

	@Column(name = "cookie", length = 16)
	public String getCookie() {
		return cookie;
	}

	public void setCookie(String cookie) {
		this.cookie = cookie;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", userName=" + userName + ", passWord=" + passWord + ", email=" + email + ", userStatus=" + userStatus + ", cookie=" + cookie + "]";
	}

	@Override
	public boolean equals(Object u) {
		if (u instanceof User) {
			User user = (User)u;
			return (uid.equals(user.uid) && userName.equals(user.userName) && passWord.equals(user.passWord) && email.equals(user.email) && userStatus.equals(user.userStatus) && cookie.equals(user.cookie));
		} else {
			return false;
		}
	}
}
