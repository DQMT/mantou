package io.uicp.tincat.mantou.page.dao;

import java.util.List;
import java.util.Map;

import io.uicp.tincat.mantou.subm.entity.Subm;
import io.uicp.tincat.mantou.threads.entity.Threads;
import io.uicp.tincat.mantou.user.entity.User;

public interface PageDao {
	public List<Threads>  getPageThreads(int subm,int pageCode,int pageSize);
	
	public String getSubTitle(int subm);
	
	public String getSubTips(int subm);
	
	public List<Subm> getAllSubms();
	
	public List<Subm> getAllValidSubms();
	
	public int getTotalRecords();
	
	public int getTotalRecords(int subm);

	public Map<Threads, List<Threads>> getPageThreadsMap(int subm,int pageCode,int pageSize ,int threadSize);
	
	public List<Threads> getReplies(Threads t);
	
	public List<Threads> getReplies(Threads t ,int threadSize);

	public List<Threads> getReplies(Threads t, int pageCode,int pageSize);
	
	public int getRepliesCount(Threads t);
	
	public int[] getRepliesCount(int subm, int pageCode, int pageSize);
	
	public int getSubmByTid(int tid);
	
	public Threads getThreads(int tid);
	
	public int getRootTid(int tid);
	
	public int getHistoryCount(User user);
	
	public List<Threads> getHistory(User user);
	
	public List<Threads> getHistory(User user,int pageCode,int pageSize);
	
	public int getSearchCount(String content);
	
	public List<Threads> search(String content,int pageCode,int pageSize);
}
