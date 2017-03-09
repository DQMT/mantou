package io.uicp.tincat.mantou.manage.dao;

import java.util.List;

import io.uicp.tincat.mantou.manage.entity.Report;

public interface ReportDao {
	public int getTotalRecords();
	public List<Report> getAllReports();
	public List<Report> getPageReports(int pageCode,int pageSize);
	public Report getReportByRid(int rid);
	public void saveReport(Report report);
	public void updateReport(Report report);
}
