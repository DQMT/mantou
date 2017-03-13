package io.uicp.tincat.mantou.subm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_sub_m")
public class Subm {
	private Integer sid;
	private String subTitle;
	private Integer sStatus;
	private String subTips;
	
	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "sid", length = 3, unique = true, nullable = false)
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	
	@Column(name = "subTitle", length = 32)
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	
	@Column(name = "sStatus", length = 1)
	public Integer getsStatus() {
		return sStatus;
	}
	public void setsStatus(Integer sStatus) {
		this.sStatus = sStatus;
	}
	
	@Column(name = "subTips", length = 256)
	public String getSubTips() {
		return subTips;
	}
	public void setSubTips(String subTips) {
		this.subTips = subTips;
	}
	
	
}
