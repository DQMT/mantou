package io.uicp.tincat.mantou.manage.entity;

import java.util.List;

public class ReportPage {
	private int tid;

	private int pageCode;// 当前页码

	private List<Report> reportList;

	private int totalRecords;// 总记录数

	private int pageSize; // 每页记录数

	public int getPageCode() {
		return pageCode;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	// 计算总页数
	public int getTotalPages() {
		if (totalRecords == 0)
			return 1;
		int tp = totalRecords / pageSize;
		return totalRecords % pageSize == 0 ? tp : tp + 1;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public List<Report> getReportList() {
		return reportList;
	}

	public void setReportList(List<Report> reportList) {
		this.reportList = reportList;
	}

}
