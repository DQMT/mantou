package io.uicp.tincat.mantou.threads.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_threads")
public class Threads {
	private Integer tid;
	private String title;
	private String text;
	private Integer uid;
	private String uCookie;
	private Integer threadStatus;
	private String createTime;
	private String updateTime;
	private Integer supertid;
	private Integer reftid;
	private Integer subm;
	private String tImage;

	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "tid", length = 16, unique = true, nullable = false)
	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	@Column(name = "title", length = 64)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "text", length = 1024)
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Column(name = "uid", length = 16)
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	@Column(name = "uCookie", length = 16)
	public String getuCookie() {
		return uCookie;
	}

	public void setuCookie(String uCookie) {
		this.uCookie = uCookie;
	}

	@Column(name = "threadStatus", length = 1)
	public Integer getThreadStatus() {
		return threadStatus;
	}

	public void setThreadStatus(Integer threadStatus) {
		this.threadStatus = threadStatus;
	}

	@Column(name = "createTime")
	public String getCreateTime() {
		return createTime.substring(0, 19);// 处理掉末尾的.0(毫秒数)
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Column(name = "updateTime")
	public String getUpdateTime() {
		return updateTime.substring(0, 19);// 处理掉末尾的.0(毫秒数);
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "supertid", length = 16)
	public Integer getSupertid() {
		return supertid;
	}

	public void setSupertid(Integer supertid) {
		this.supertid = supertid;
	}

	@Column(name = "reftid", length = 16)
	public Integer getReftid() {
		return reftid;
	}

	public void setReftid(Integer reftid) {
		this.reftid = reftid;
	}

	@Column(name = "sub_m", length = 3)
	public Integer getSubm() {
		return subm;
	}

	public void setSubm(Integer subm) {
		this.subm = subm;
	}

	@Column(name = "tImage", length = 32)
	public String gettImage() {
		return tImage;
	}

	public void settImage(String tImage) {
		this.tImage = tImage;
	}

}
