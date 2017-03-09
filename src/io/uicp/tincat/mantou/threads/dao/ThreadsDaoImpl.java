package io.uicp.tincat.mantou.threads.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import io.uicp.tincat.mantou.basedao.BaseDao;
import io.uicp.tincat.mantou.threads.entity.Threads;

@Repository("threadsDao")
@SuppressWarnings("all")
public class ThreadsDaoImpl implements ThreadsDao {

	@Resource
	private BaseDao<Threads> baseDao;

	@Override
	public void saveThreads(Threads threads) {
		baseDao.save(threads);
	}

	// 根据回复的创建时间，更新主串的最近活跃时间
	@Override
	public void updateThreadsTime(Threads threads) {
		if (threads.getSupertid() != 0) {
			baseDao.executeHql("update Threads t set t.updateTime=? where t.tid=?",
					new Object[] { threads.getCreateTime(), threads.getSupertid() });
		}

	}

	@Override
	public Threads getThreadsByTid(Integer tid) {
		return baseDao.get("from Threads where tid=?", new Object[] { tid });
	}

	@Override
	public boolean deleteThreadsByTid(Integer tid) {
		return (0<baseDao.executeHql("update Threads set threadStatus=1 where tid=? ", new Object[] { tid }));
	}

	@Override
	public boolean deleteEntireThreadsByTid(Integer tid) {
		tid = getRootTid(tid);
		return (0<baseDao.executeHql("update Threads set threadStatus=1 where tid=? or supertid=?", new Object[]{tid,tid}));
	}
	
	private Integer getRootTid(Integer tid){
		Threads t = getThreadsByTid(tid);
		if (t.getSupertid() == 0) {
			return tid;
		} else {
			return t.getSupertid();
		}
	}
}
