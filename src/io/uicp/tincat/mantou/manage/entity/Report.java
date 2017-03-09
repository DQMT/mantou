package io.uicp.tincat.mantou.manage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_reports")
public class Report {
	private Integer rid;
	private Integer tid;
	private Integer fromUid;
	private Integer toUid;
	private String createTime;
	private String updateTime;
	private String reason;
	private String result;
	private Integer status;

	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "rid", length = 16, unique = true, nullable = false)
	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	@Column(name = "tid", length = 16)
	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	@Column(name = "from_uid", length = 16)
	public Integer getFromUid() {
		return fromUid;
	}

	public void setFromUid(Integer fromUid) {
		this.fromUid = fromUid;
	}

	@Column(name = "to_uid", length = 16)
	public Integer getToUid() {
		return toUid;
	}

	public void setToUid(Integer toUid) {
		this.toUid = toUid;
	}

	@Column(name = "reason", length = 128)
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Column(name = "result", length = 128)
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Column(name = "status", length = 1)
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreateTime() {
		return createTime.substring(0, 19);// 处理掉末尾的.0(毫秒数);
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime.substring(0, 19);// 处理掉末尾的.0(毫秒数);
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public void updateResult() {
		switch (this.status.intValue()) {
		case 1:
			this.setResult("不处理");
			break;
		case 2:
			this.setResult("已删除回复");
			break;
		case 3:
			this.setResult("已删串");
			break;
		case 4:
			this.setResult("已封号");
			break;
		case 5:
			this.setResult("已删除回复+封号");
			break;
		case 6:
			this.setResult("已删串+封号");
			break;
		default:
			this.setResult("尚未处理");
		}
	}

}
