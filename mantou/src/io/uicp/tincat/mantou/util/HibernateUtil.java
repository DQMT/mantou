package io.uicp.tincat.mantou.util;

import org.hibernate.SessionFactory;

public class HibernateUtil {
	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public static void evict(Object object){
		sessionFactory.getCurrentSession().evict(object);
	}
}
