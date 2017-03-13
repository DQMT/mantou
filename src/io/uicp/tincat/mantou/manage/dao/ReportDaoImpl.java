package io.uicp.tincat.mantou.manage.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import io.uicp.tincat.mantou.basedao.BaseDao;
import io.uicp.tincat.mantou.manage.entity.Report;
import io.uicp.tincat.mantou.threads.entity.Threads;

@Repository("reportDao")
@SuppressWarnings("all")
public class ReportDaoImpl implements ReportDao{

	
	@Resource
	private BaseDao<Report> baseDao;
	
	@Override
	public int getTotalRecords() {
		return baseDao.count("select count(*) from Report ").intValue();
	}

	@Override
	public List<Report> getAllReports() {
		
		return baseDao.find("from Report order by rid desc");
	}

	@Override
	public List<Report> getPageReports(int pageCode,int pageSize) {
		return baseDao.find("from Report order by rid desc",pageCode, pageSize);
	}

	@Override
	public void saveReport(Report report) {
		baseDao.save(report);
		
	}

	@Override
	public void updateReport(Report report) {
		baseDao.update(report);
	}

	@Override
	public Report getReportByRid(int rid) {
		
		return baseDao.get("from Report where rid=?", new Object[]{rid});
	}

}
