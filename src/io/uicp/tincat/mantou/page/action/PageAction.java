package io.uicp.tincat.mantou.page.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import io.uicp.tincat.mantou.page.entity.Page;
import io.uicp.tincat.mantou.page.service.PageService;
import io.uicp.tincat.mantou.user.entity.User;
import io.uicp.tincat.mantou.util.Const;
import io.uicp.tincat.mantou.util.HibernateUtil;
import io.uicp.tincat.mantou.util.StringUtil;

@Controller
public class PageAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;

	@Resource
	private PageService pageService;

	public String visit() {
		HttpSession session = request.getSession();
		System.out.println("进入visit.PageAction");
		int subm = Integer.parseInt(request.getParameter("subm"));
		String pageCodeS = request.getParameter("pageCode");
		if (pageCodeS == null) {
			pageCodeS = "1";
		}
		int pageCode = Integer.parseInt(pageCodeS);
		String url = request.getRequestURI() + "?" + request.getQueryString();
		System.out.println(url);
		int index = url.lastIndexOf("&pageCode=");
		if (index != -1) {
			url = url.substring(0, index);
		}

		System.out.println(subm);
		System.out.println(pageCode);

		Page page = new Page();
		page.setSubm(subm);
		page.setPageCode(pageCode);
		page.setUrl(url);
		page.setVisitType(Const.VISIT_TYPE_MAIN);
		Page currentPage = pageService.visit(page);
		session.setAttribute("currentPage", currentPage);
		return "main";
	}

	public String reply() {
		HttpSession session = request.getSession();
		System.out.println("进入reply.PageAction");
		int rid = Integer.parseInt(request.getParameter("rid"));

		String pageCodeS = request.getParameter("pageCode");
		if (pageCodeS == null) {
			pageCodeS = "1";
		}
		int pageCode = Integer.parseInt(pageCodeS);
		String url = request.getRequestURI() + "?" + request.getQueryString();
		System.out.println(url);
		int index = url.lastIndexOf("&pageCode=");
		if (index != -1) {
			url = url.substring(0, index);
		}

		System.out.println(pageCode);

		Page page = new Page();

		page.setPageCode(pageCode);
		page.setUrl(url);
		page.setReplyid(rid);
		page.setVisitType(Const.VISIT_TYPE_REPLY);
		Page currentPage = pageService.reply(page);
		session.setAttribute("currentPage", currentPage);
		return "main";
	}

	public void getSubmMenu() {
		HttpSession session = request.getSession();
		System.out.println("进入getSubmMenu.PageAction");

		Map<Integer, String> ms = new LinkedHashMap<Integer, String>();
		ms = pageService.getValidSubmsMenu();
		session.setAttribute("submsMenu", ms);

	}

	public String history() {
		HttpSession session = request.getSession();
		String pageCodeS = request.getParameter("pageCode");
		if (pageCodeS == null) {
			pageCodeS = "1";
		}
		int pageCode = Integer.parseInt(pageCodeS);
		String url = request.getRequestURI();
		System.out.println(url);
		User currentUser = (User) session.getAttribute("currentUser");
		
		Page page = new Page();
		page.setUrl(StringUtil.getActionUrl(url)+"?user="+currentUser.getUserName());
		page.setPageCode(pageCode);
		
		Page currentPage = pageService.history(currentUser, page);
		session.setAttribute("currentPage", currentPage);
		return "history";

	}
	
	public String search() {
		HttpSession session = request.getSession();
		String pageCodeS = request.getParameter("pageCode");
		String content = request.getParameter("content");
		if (pageCodeS == null) {
			pageCodeS = "1";
		}
		int pageCode = Integer.parseInt(pageCodeS);
		String url = request.getRequestURI();
		System.out.println(url);
		
		Page page = new Page();
		page.setUrl(StringUtil.getActionUrl(url)+"?content="+content);
		page.setPageCode(pageCode);
		
		Page currentPage = pageService.search(content, page);
		session.setAttribute("currentPage", currentPage);
		return "history";

	}
	
	

	public void ajaxThreadsReference() throws IOException {
		System.out.println("进入ajaxThreadsReference.PageAction");
		String tid = request.getParameter("tid");
		String json = pageService.ajaxThreadsReference(tid);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(json);
		writer.flush();
		writer.close();
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

}
