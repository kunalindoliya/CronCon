package croncon.db;

import org.hibernate.*;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class Dbconnection  {
	private static final SessionFactory sessionFactory;
	static {
		final StandardServiceRegistry registry= new StandardServiceRegistryBuilder().configure().build();
		try {
			sessionFactory= new MetadataSources( registry ).buildMetadata().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			StandardServiceRegistryBuilder.destroy( registry );
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static synchronized SessionFactory getSessionFactory() throws HibernateException {
		return sessionFactory;
	}
	
}

