package io.uicp.tincat.mantou.page.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import io.uicp.tincat.mantou.basedao.BaseDao;
import io.uicp.tincat.mantou.subm.entity.Subm;
import io.uicp.tincat.mantou.threads.entity.Threads;
import io.uicp.tincat.mantou.user.entity.User;
import io.uicp.tincat.mantou.util.HibernateUtil;

@Repository("pageDao")
@SuppressWarnings("all")

public class PageDaoImpl implements PageDao {

	@Resource
	private BaseDao<Threads> baseDaoT;

	@Resource
	private BaseDao<Subm> baseDaoS;

	// 过滤掉已被删除的串的内容
	private List<Threads> threadsFilter(List<Threads> lt) {
		for (Threads t : lt) {
			t = threadsFilter(t);
		}
		return lt;
	}

	private Threads threadsFilter(Threads t) {
		if (t instanceof Threads) {
			if (t.getThreadStatus() == 1) {
				t.settImage(null);
				t.setText("【已被删除】");
			}
		}
		return t;
	}

	@Override
	public List<Threads> getPageThreads(int subm, int pageCode, int pageSize) {
		return threadsFilter(baseDaoT.find("from Threads where supertid=0 and sub_m=? order by updateTime desc", new Object[] { subm }, pageCode, pageSize));

	}

	@Override
	public String getSubTitle(int subm) {
		Subm submObject = baseDaoS.get("from Subm where sid=?", new Object[] { subm });
		return submObject.getSubTitle();
	}

	@Override
	public String getSubTips(int subm) {
		Subm submObject = baseDaoS.get("from Subm where sid=?", new Object[] { subm });
		return submObject.getSubTips();
	}

	@Override
	public int getTotalRecords() {

		return baseDaoT.count("select count(*) from Threads where supertid=0").intValue();
	}

	@Override
	public int getTotalRecords(int subm) {

		return baseDaoT.count("select count(*) from Threads where sub_m = ? and supertid=0", new Object[] { subm }).intValue();
	}

	@Override
	public Map<Threads, List<Threads>> getPageThreadsMap(int subm, int pageCode, int pageSize, int threadSize) {
		Map<Threads, List<Threads>> mt = new HashMap<Threads, List<Threads>>();
		List<Threads> lt = this.getPageThreads(subm, pageCode, pageSize);

		for (Threads t : lt) {
			mt.put(t, this.getReplies(t, threadSize));
		}
		return mt;
	}

	// 获取某一串的所有回复
	@Override
	public List<Threads> getReplies(Threads t) {
		return threadsFilter(baseDaoT.find("from Threads where supertid=?  order by updateTime", new Object[] { t.getTid() }));

	}

	// 获取某一串底下最后的threadSize个回复
	@Override
	public List<Threads> getReplies(Threads t, int threadSize) {
		List<Threads> lt = getReplies(t);
		if (lt.size() <= threadSize) {
			return lt;
		} else {
			return lt.subList(lt.size() - threadSize, lt.size());
		}
	}

	// 获取某一串底下的当前分页的回复
	@Override
	public List<Threads> getReplies(Threads t, int pageCode, int threadSize) {
		List<Threads> lt = getReplies(t);
		if (lt.size() <= threadSize) {
			return lt;
		} else {
			return lt.subList(pageCode * threadSize - threadSize, pageCode * threadSize > lt.size() ? lt.size() : pageCode * threadSize);
		}
	}

	@Override
	public int getRepliesCount(Threads t) {

		return baseDaoT.count("select count(*) from Threads where supertid=?", new Object[] { t.getTid() }).intValue();
	}

	@Override
	public int[] getRepliesCount(int subm, int pageCode, int pageSize) {
		List<Threads> lt = this.getPageThreads(subm, pageCode, pageSize);
		int[] rc;
		rc = new int[lt.size()];
		for (int i = 0; i < lt.size(); i++) {
			rc[i] = this.getRepliesCount(lt.get(i));
		}
		return rc;
	}

	@Override
	public int getSubmByTid(int tid) {
		return baseDaoT.executeHql("select subm from Threads where tid=?", new Object[] { tid });
	}

	@Override
	public Threads getThreads(int tid) {
		return threadsFilter(baseDaoT.get("from Threads where tid=?", new Object[] { tid }));
	}

	@Override
	public List<Subm> getAllSubms() {

		return baseDaoS.find("from Subm order by sid");
	}

	@Override
	public List<Subm> getAllValidSubms() {

		return baseDaoS.find("from Subm where sStatus = 2 order by sid");
	}

	// 找到根tid
	@Override
	public int getRootTid(int tid) {
		Threads t = getThreads(tid);
		if(t instanceof Threads){
			if (t.getSupertid() == 0) {
				return tid;
			} else {
				return t.getSupertid();
			}
		}else
			return tid;
		
	}

	@Override
	public int getHistoryCount(User user) {
		return baseDaoT.count("select count(*) from Threads where uid=?", new Object[] { user.getUid() }).intValue();
	}

	@Override
	public List<Threads> getHistory(User user) {
		return threadsFilter(baseDaoT.find("from Threads where uid = ? order by createTime desc", new Object[] { user.getUid() }));
	}

	@Override
	public List<Threads> getHistory(User user, int pageCode, int pageSize) {
		return threadsFilter(baseDaoT.find("from Threads where uid = ? order by createTime desc", new Object[] { user.getUid() }, pageCode, pageSize));
	}

	@Override
	public int getSearchCount(String content) {
		Map param = new HashMap();
		param.put("content", content);
		return baseDaoT.countLike("select count(*) from Threads where text like :content", param).intValue();
	}

	@Override
	public List<Threads> search(String content, int pageCode, int pageSize) {
		Map param = new HashMap();
		param.put("content", content);
		return threadsFilter(baseDaoT.findLike("from Threads where text like  :content order by createTime desc", param, pageCode, pageSize));
	}

}
