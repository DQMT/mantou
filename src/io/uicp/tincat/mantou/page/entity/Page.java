package io.uicp.tincat.mantou.page.entity;

import java.util.List;
import java.util.Map;

import io.uicp.tincat.mantou.threads.entity.Threads;

public class Page {

	private int subm;  //当前版块号
	private String subTitle; //当前版块名称
	private String subTips;  //当前版块介绍
	private int replyid; //回复模式下回复的串号
	private int pageCode;// 当前页码
	private int visitType;//0=main 1=reply
	
	private int totalRecords;// 总记录数

	private int pageSize; // 每页记录数

	private int threadSize; // 每串显示最大回复数

	private String url; // 请求路径和参数

	private List<Threads> threadsList;

	private Map<Threads, List<Threads>> threadsMap;

	private int[] repliesCount;


	public int getVisitType() {
		return visitType;
	}

	public void setVisitType(int visitType) {
		this.visitType = visitType;
	}

	public int getSubm() {
		return subm;
	}

	public void setSubm(int subm) {
		this.subm = subm;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getSubTips() {
		return subTips;
	}

	public void setSubTips(String subTips) {
		this.subTips = subTips;
	}

	public int getReplyid() {
		return replyid;
	}

	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}

	// 计算总页数
	public int getTotalPages() {
		if (totalRecords == 0)
			return 1;
		int tp = totalRecords / pageSize;
		return totalRecords % pageSize == 0 ? tp : tp + 1;
	}

	// 计算回复页面的总页数
	public int getTotalReplyPages() {
		if (totalRecords == 0)
			return 1;
		int tp = totalRecords / threadSize;
		return totalRecords % threadSize == 0 ? tp : tp + 1;
	}

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

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getThreadSize() {
		return threadSize;
	}

	public void setThreadSize(int threadSize) {
		this.threadSize = threadSize;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Threads> getThreadsList() {
		return threadsList;
	}

	public void setThreadsList(List<Threads> threadsList) {
		this.threadsList = threadsList;
	}

	public Map<Threads, List<Threads>> getThreadsMap() {
		return threadsMap;
	}

	public void setThreadsMap(Map<Threads, List<Threads>> threadsMap) {
		this.threadsMap = threadsMap;
	}

	public int[] getRepliesCount() {
		return repliesCount;
	}

	public void setRepliesCount(int[] repliesCount) {
		this.repliesCount = repliesCount;
	}

}
