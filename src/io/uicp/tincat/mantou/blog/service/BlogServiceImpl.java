package io.uicp.tincat.mantou.blog.service;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import io.uicp.tincat.mantou.blog.dao.BlogDao;
import io.uicp.tincat.mantou.blog.entity.Blog;

@Service("blogService")
public class BlogServiceImpl implements BlogService{

	@Resource
	private BlogDao blogDao;
	
	@Override
	@Transactional
	public void saveBlog(Blog blog) {
		blogDao.saveBlog(blog);
	}

}
