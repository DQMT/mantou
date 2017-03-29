package io.uicp.tincat.mantou.blog.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import io.uicp.tincat.mantou.basedao.BaseDao;
import io.uicp.tincat.mantou.blog.entity.Blog;
import io.uicp.tincat.mantou.threads.entity.Threads;

@Repository("BlogDao")
@SuppressWarnings("all")
public class BlogDaoImpl implements BlogDao {

	@Resource
	private BaseDao<Blog> baseDao;

	@Override
	public void saveBlog(Blog blog) {
		baseDao.save(blog);

	}

}
