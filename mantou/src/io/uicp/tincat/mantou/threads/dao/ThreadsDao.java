package io.uicp.tincat.mantou.threads.dao;

import io.uicp.tincat.mantou.threads.entity.Threads;

public interface ThreadsDao {
	public void saveThreads(Threads threads);
	public void updateThreadsTime(Threads threads);
	public Threads getThreadsByTid(Integer tid);
	public boolean deleteThreadsByTid(Integer tid);
	public boolean deleteEntireThreadsByTid(Integer tid);
}
