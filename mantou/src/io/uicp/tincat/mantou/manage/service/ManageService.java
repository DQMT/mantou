package io.uicp.tincat.mantou.manage.service;

import java.util.List;

import io.uicp.tincat.mantou.manage.entity.Report;
import io.uicp.tincat.mantou.manage.entity.ReportPage;
import io.uicp.tincat.mantou.user.entity.User;

public interface ManageService {
	public ReportPage reports(ReportPage rp);

	public boolean addReport(Report report);

	public boolean deal(int rid, int action);


	public List<User> searchUsers(String no,String name,String id);
}
