package io.uicp.tincat.mantou.blog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_blog")
public class Blog {
	private Integer bid;
	private Integer status;
	private String title;
	private String content;
	private Integer uid;
	private String createTime;
	private String updateTime;
	private Integer hits;

	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "bid", length = 16, unique = true, nullable = false)
	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	@Column(name = "status", length = 1)
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "title", length = 255)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 1023)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "uid", length = 16)
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
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

	@Column(name = "hits", length = 11)
	public Integer getHits() {
		return hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

}
