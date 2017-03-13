package io.uicp.tincat.mantou.page.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import io.uicp.tincat.mantou.page.dao.PageDao;
import io.uicp.tincat.mantou.page.entity.Page;
import io.uicp.tincat.mantou.subm.entity.Subm;
import io.uicp.tincat.mantou.threads.entity.Threads;
import io.uicp.tincat.mantou.user.entity.User;
import net.sf.json.JSONArray;

@Service("pageService")
public class PageServiceImpl implements PageService {

	@Resource
	private PageDao pageDao;

	@Override
	@Transactional
	public Page visit(Page page) {
		System.out.println("进入visit.pageService");
		String subTitle = pageDao.getSubTitle(page.getSubm());
		String subTips = pageDao.getSubTips(page.getSubm());
		int totalRecords = pageDao.getTotalRecords(page.getSubm());
		Properties props = new Properties();
		try {
			// props.load(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"));
			// 会导致utf-8中文乱码
			props.load(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"),
					"UTF-8"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int pageSize = Integer.parseInt(props.getProperty("pagesize"));
		int threadSize = Integer.parseInt(props.getProperty("threadsize"));
		List<Threads> tl = pageDao.getPageThreads(page.getSubm(), page.getPageCode(), pageSize);
		int[] repliesCount = pageDao.getRepliesCount(page.getSubm(), page.getPageCode(), pageSize);
		Map<Threads, List<Threads>> tm = pageDao.getPageThreadsMap(page.getSubm(), page.getPageCode(), pageSize,
				threadSize);
		page.setThreadsList(tl);
		page.setRepliesCount(repliesCount);
		page.setThreadsMap(tm);
		page.setSubTitle(subTitle);
		page.setSubTips(subTips);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setThreadSize(threadSize);
		return page;
	}

	@Override
	@Transactional
	public Page reply(Page page) {
		System.out.println("进入reply.pageService");
		
		int	tid = pageDao.getRootTid(page.getReplyid());
		
		Threads threads= pageDao.getThreads(tid);
		page.setSubm(threads.getSubm());
		String subTitle = pageDao.getSubTitle(page.getSubm());
		String subTips = pageDao.getSubTips(page.getSubm());
		int totalRecords = pageDao.getRepliesCount(threads);
		Properties props = new Properties();
		try {
			// props.load(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"));
			// 会导致utf-8中文乱码
			props.load(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"),
					"UTF-8"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int pageSize = 1;
		int threadSize = Integer.parseInt(props.getProperty("replysize"));
		List<Threads> tl = new ArrayList<Threads>();
		tl.add(threads);
		int[] repliesCount = {totalRecords};
		List<Threads> replies = pageDao.getReplies(threads,page.getPageCode(),threadSize);
		
		Map<Threads, List<Threads>> tm = new HashMap<Threads, List<Threads>>();
		tm.put(threads, replies);
		page.setThreadsList(tl);
		page.setRepliesCount(repliesCount);
		page.setThreadsMap(tm);
		page.setSubTitle(subTitle);
		page.setSubTips(subTips);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setThreadSize(threadSize);
		return page;
	}

	
	@Override
	@Transactional
	public String ajaxThreadsReference(String tid) {
		Threads t = pageDao.getThreads(Integer.valueOf(tid));
		List<String> list = new ArrayList<String>();
		list.add(t.getTitle());
		list.add(t.getCreateTime());
		list.add(t.getuCookie().toString());
		list.add(t.getTid().toString());
		list.add(t.getReftid().toString());
		list.add(t.getText());
		list.add(t.gettImage());
		JSONArray jsonArray = JSONArray.fromObject( list );
		return jsonArray.toString();
		
	}
	
	
	@Override
	@Transactional
	public Map<Integer,String> getValidSubmsMenu() {
		List<Subm> ls = pageDao.getAllValidSubms();
		Map<Integer,String> ms = new LinkedHashMap<Integer,String>();
		for (Subm s:ls){
			ms.put(s.getSid(), s.getSubTitle());
		}
		
		return ms;
	}

	@Override
	@Transactional
	public Page history(User user,Page page) {
		Properties props = new Properties();
		try {
			// props.load(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"));
			// 会导致utf-8中文乱码
			props.load(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"),
					"UTF-8"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int pageSize = Integer.parseInt(props.getProperty("pagesize"));
		page.setPageSize(pageSize);
		page.setTotalRecords(pageDao.getHistoryCount(user));
		List<Threads> threadsList = pageDao.getHistory(user,page.getPageCode(),pageSize);
		page.setThreadsList(threadsList);
		return page;
	}
	
	@Override
	@Transactional
	public Page search(String content,Page page) {
		Properties props = new Properties();
		try {
			// props.load(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"));
			// 会导致utf-8中文乱码
			props.load(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream("mantou.properties"),
					"UTF-8"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int pageSize = Integer.parseInt(props.getProperty("pagesize"));
		page.setPageSize(pageSize);
		page.setTotalRecords(pageDao.getSearchCount(content));
		List<Threads> threadsList = pageDao.search(content,page.getPageCode(),pageSize);
		page.setThreadsList(threadsList);
		return page;
	}

}
