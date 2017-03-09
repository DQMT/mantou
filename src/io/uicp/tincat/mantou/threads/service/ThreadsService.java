package io.uicp.tincat.mantou.threads.service;

import io.uicp.tincat.mantou.threads.entity.Threads;

public interface ThreadsService {
	public void post(Threads threads);

	public void reply(Threads threads);
	
	
}
