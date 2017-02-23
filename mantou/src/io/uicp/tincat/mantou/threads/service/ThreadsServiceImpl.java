package io.uicp.tincat.mantou.threads.service;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import io.uicp.tincat.mantou.threads.dao.ThreadsDao;
import io.uicp.tincat.mantou.threads.entity.Threads;
import io.uicp.tincat.mantou.user.dao.UserDao;

@Service("threadsService")
public class ThreadsServiceImpl implements ThreadsService {

	@Resource
	private ThreadsDao threadsDao;

	@Resource
	private UserDao userDao;

	@Override
	@Transactional
	public void post(Threads threads) {
		if (userDao.isQualified(threads.getUid())) {
			threadsDao.saveThreads(threads);
		}
	}

	@Override
	@Transactional
	public void reply(Threads threads) {
		if (userDao.isQualified(threads.getUid())) {
			threadsDao.saveThreads(threads);
			threadsDao.updateThreadsTime(threads);
		}

	}

}
