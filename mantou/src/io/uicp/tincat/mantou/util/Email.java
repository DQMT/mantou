package io.uicp.tincat.mantou.util;

import java.util.Properties;

public class Email {

	String host;
	String username;
	String password;
	String receiver;
	String subject;
	String content;

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Email() {

	}

	public Email(Properties props) {
		this.host = props.getProperty("host");
		this.username = props.getProperty("username");
		this.password = props.getProperty("password");
		this.receiver = props.getProperty("receiver");
		this.subject = props.getProperty("subject");
		this.content = props.getProperty("content");

	}

}
