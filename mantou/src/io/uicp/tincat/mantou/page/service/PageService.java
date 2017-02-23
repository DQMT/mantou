package io.uicp.tincat.mantou.page.service;

import java.util.Map;

import io.uicp.tincat.mantou.page.entity.Page;
import io.uicp.tincat.mantou.user.entity.User;



public interface PageService {

	public Page visit(Page page);
	public Page reply(Page page);
	public Map<Integer,String> getValidSubmsMenu();
	public Page history(User user,Page page);
	public String ajaxThreadsReference(String tid);
}
