package io.uicp.tincat.mantou.manage.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import io.uicp.tincat.mantou.manage.entity.Report;
import io.uicp.tincat.mantou.manage.entity.ReportPage;
import io.uicp.tincat.mantou.manage.service.ManageService;
import io.uicp.tincat.mantou.user.entity.User;

@Controller
public class ManageAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;

	@Resource
	private ManageService manageService;

	private Report report;
	private String error;
	
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public String reports() {

		HttpSession session = request.getSession();
		System.out.println("进入reports.ManageAction");
		String tid = request.getParameter("tid");
		if (tid == null) {
			tid = "0";
		}
		String pageCode = request.getParameter("pageCode");
		if (pageCode == null) {
			pageCode = "1";
		}

		ReportPage rp = new ReportPage();
		rp.setTid(Integer.parseInt(tid));
		rp.setPageCode(Integer.parseInt(pageCode));

		ReportPage currentReportPage = manageService.reports(rp);
		session.setAttribute("currentReportPage", currentReportPage);
		return "reports";

	}

	public String addReport() {
		HttpSession session = request.getSession();
		System.out.println("进入addReport.ManageAction");
		User currentUser = (User) session.getAttribute("currentUser");
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(date);
		report.setCreateTime(now);
		report.setUpdateTime(now);
		report.setFromUid(currentUser.getUid());
		String reason = report.getReason().replace("\r\n", "<br/>").replace(" ", "&nbsp;");
		report.setReason(reason);
		if (manageService.addReport(report)) {
			return "success";
		} else {
			return "threadsnotfound";
		}

	}

	public String deal() {
		int rid = Integer.parseInt(request.getParameter("rid"));
		int action = Integer.parseInt(request.getParameter("action"));
		if (manageService.deal(rid, action)) {
			return "success";
		} else {
			return "manage_fail";
		}
	}

	public String users() {
		return "users";
	}

	public String userSearch() {
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		if (no == "" && name == "" && id == "") {
			return "users";
		} else {
			List<User> users = manageService.searchUsers(no, name, id);
			// HttpSession session = request.getSession();
			// session.setAttribute("users", users);
			request.setAttribute("no", no);
			request.setAttribute("name", name);
			request.setAttribute("id", id);
			request.setAttribute("users", users);
			return "users";
		}

	}

	public String userSetStatus(){
		String no = request.getParameter("no");
		if(no==""){
			error = "请输入用户编号！";
			return "users";
		}
		return "users";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

}
