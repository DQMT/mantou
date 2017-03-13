package io.uicp.tincat.mantou.manage.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import io.uicp.tincat.mantou.exception.ThreadException;
import io.uicp.tincat.mantou.manage.dao.ReportDao;
import io.uicp.tincat.mantou.manage.entity.Report;
import io.uicp.tincat.mantou.manage.entity.ReportPage;
import io.uicp.tincat.mantou.threads.dao.ThreadsDao;
import io.uicp.tincat.mantou.threads.entity.Threads;
import io.uicp.tincat.mantou.user.dao.UserDao;
import io.uicp.tincat.mantou.user.entity.User;

@Service("manageService")
public class ManageServiceImpl implements ManageService{

	
	@Resource
	private ReportDao reportDao;

	@Resource
	private ThreadsDao threadsDao;
	
	@Resource
	private UserDao userDao;
	
	@Override
	@Transactional
	public ReportPage reports(ReportPage rp) {
		System.out.println("进入reports.ManageService");
		
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
		rp.setPageSize(pageSize);
		int totalRecords = reportDao.getTotalRecords();
		rp.setTotalRecords(totalRecords);
		List<Report> rl = reportDao.getPageReports(rp.getPageCode(),rp.getPageSize());
		rp.setReportList(rl);
		
		return rp;
	}


	@Override
	@Transactional
	public void addReport(Report report) throws ThreadException {
		try{
			Threads t = threadsDao.getThreadsByTid(report.getTid());
			report.setToUid(t.getUid());
			report.setStatus(1);
			report.setResult("尚未处理");
			reportDao.saveReport(report);
		}catch (Exception e){
			throw new ThreadException();
		}
	}


	@Override
	@Transactional
	public boolean deal(int rid, int action) {
		Report report = reportDao.getReportByRid(rid);
		report.setStatus(action);
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(date);
		report.setUpdateTime(now);
		report.updateResult();
		reportDao.updateReport(report);
		return doDeal(report, action);
	}
	
	@Transactional
	private boolean doDeal(Report report,int action){
		switch (action) {
		case 1:
			return true;
		case 2:
			return threadsDao.deleteThreadsByTid(report.getTid());
		case 3:
			return threadsDao.deleteEntireThreadsByTid(report.getTid());
		case 4:
			return userDao.banUserByUid(report.getToUid());
		case 5:
			return (threadsDao.deleteThreadsByTid(report.getTid()) && userDao.banUserByUid(report.getToUid()));
		case 6:
			return (threadsDao.deleteEntireThreadsByTid(report.getTid()) && userDao.banUserByUid(report.getToUid()));
		default:
			return false;
		}
	}


	@Override
	@Transactional
	public List<User> searchUsers(String no,String name,String id) {
		return userDao.searchUsers(no,name,id);
	}

}
