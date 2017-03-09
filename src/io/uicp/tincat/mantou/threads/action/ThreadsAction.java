package io.uicp.tincat.mantou.threads.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.jmx.snmp.Timestamp;
import io.uicp.tincat.mantou.threads.entity.Threads;
import io.uicp.tincat.mantou.threads.service.ThreadsService;
import io.uicp.tincat.mantou.user.entity.User;
import io.uicp.tincat.mantou.util.CookieUtil;
import io.uicp.tincat.mantou.util.StringUtil;

@Controller
public class ThreadsAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;

	@Resource
	private ThreadsService threadsService;

	private Threads threads;

	private String subm;

	private int thistid;

	private File image;

	private String imageContentType;

	private String imageFileName;

	public int getThistid() {
		return thistid;
	}

	public void setThistid(int thistid) {
		this.thistid = thistid;
	}

	public Threads getThreads() {
		return threads;
	}

	public void setThreads(Threads threads) {
		this.threads = threads;
	}

	public String getSubm() {
		return subm;
	}

	public void setSubm(String subm) {
		this.subm = subm;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String post() {

		String realpath = ServletActionContext.getServletContext().getRealPath("/images/uploads");
		File dir = new File(realpath);

		if (!dir.exists()) {

			dir.mkdir();

		}
		System.out.println("realpath: " + realpath);
		if (image != null) {
			imageContentType = imageContentType.replace("image/", ".");
			String filename = "image" + new Timestamp().getDateTime() + imageContentType;
			try {
				FileUtils.copyFile(image, new File(dir, filename));
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("IOException!!!!");
				return "error";
			}
			System.out.println("file found!");
			threads.settImage("uploads/" + filename);
		} else {
			System.out.println("file not  found!");
		}
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		
		threads.setUid(currentUser.getUid());
		threads.setuCookie(StringUtil.getMD5(currentUser.getCookie()).substring(16));
		threads.setThreadStatus(new Integer(2));
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(date);
		threads.setCreateTime(now);
		threads.setUpdateTime(now);
		threads.setSupertid(new Integer(0));
		subm = request.getParameter("subm");
		threads.setSubm(new Integer(subm));
		String text = threads.getText().replace("\r\n", "<br/>").replace(" ", "&nbsp;");
		Pattern p = Pattern.compile("^>>No.[0-9]*<<");
		Matcher m = p.matcher(text);
		int reftid = 0;
		if (m.find()) {
			reftid = Integer.parseInt(m.group().replace(">>No.", "").replace("<<", ""));
			text = text.replaceAll("^>>No.[0-9]*<<", "");
		}
		threads.setReftid(reftid);
		threads.setText(text);
		threadsService.post(threads);
		return "post_success";
	}

	public String reply() {
		String realpath = ServletActionContext.getServletContext().getRealPath("/images/uploads");
		File dir = new File(realpath);

		if (!dir.exists()) {

			dir.mkdir();

		}
		System.out.println("realpath: " + realpath);
		if (image != null) {
			imageContentType = imageContentType.replace("image/", ".");
			String filename = "image" + new Timestamp().getDateTime() + imageContentType;
			try {
				FileUtils.copyFile(image, new File(dir, filename));
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("IOException!!!!");
				return "error";
			}
			System.out.println("file found!");
			threads.settImage("uploads/" + filename);
		} else {
			System.out.println("file not  found!");
		}
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		threads.setUid(currentUser.getUid());
		threads.setuCookie(StringUtil.getMD5(currentUser.getCookie()).substring(16));
		threads.setThreadStatus(new Integer(2));
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(date);
		threads.setCreateTime(now);
		threads.setUpdateTime(now);
		int tid = Integer.parseInt(request.getParameter("tid"));
		threads.setSupertid(tid);
		subm = request.getParameter("subm");
		threads.setSubm(new Integer(subm));

		String text = threads.getText().replace("\r\n", "<br/>").replace(" ", "&nbsp;");
		text = text.replaceFirst("<br/>", "");
		Pattern p = Pattern.compile("^>>No.[0-9]*<<");
		Matcher m = p.matcher(text);
		int reftid = 0;
		if (m.find()) {
			reftid = Integer.parseInt(m.group().replace(">>No.", "").replace("<<", ""));
			text = text.replaceAll("^>>No.[0-9]*<<", "");
		}
		threads.setReftid(reftid);
		threads.setText(text);
		threadsService.reply(threads);
		thistid = tid;
		return "reply_success";
	}

	

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
