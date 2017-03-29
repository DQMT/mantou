package io.uicp.tincat.mantou.blog.action;

import io.uicp.tincat.mantou.blog.entity.Blog;
import io.uicp.tincat.mantou.blog.service.BlogService;
import io.uicp.tincat.mantou.user.entity.User;
import io.uicp.tincat.mantou.util.StringUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
public class BlogAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;

	@Resource
	private BlogService blogService;

	private Blog blog;

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public String saveBlog() {

		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		// blog.setUid(currentUser.getUid());
		String now = StringUtil.getTimeString();
		blog.setCreateTime(now);
		blog.setHits(0);
		blog.setStatus(0);
		blog.setUpdateTime(now);
		
		blogService.saveBlog(blog);
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
