package croncon.operation;



import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import croncon.bean.FeedBean;
import croncon.db.Dbconnection;

public class Feed {
	 public static int feed(FeedBean feed){
		   int i=0;
		   Session session=Dbconnection.getSessionFactory().openSession();
		   Transaction tx=null;
		   try {
			   tx=session.beginTransaction();
			   session.save(feed);
			   tx.commit();
			   i=1;
		   }catch(HibernateException e) {
			  if(tx!=null)
				  tx.rollback();
			  e.printStackTrace();
		   }finally {
			   session.close();
		   }
		   return i;
	   }
	   
	   public List<FeedBean> displayfeed() {
		   Session session=Dbconnection.getSessionFactory().openSession();
		   Transaction tx=null;
		   List<FeedBean> result=null;
		   try {
			  tx=session.beginTransaction();
			 result =session.createQuery("FROM FeedBean f ORDER BY f.id DESC").getResultList();
			  tx.commit();
		   }catch(HibernateException e) {
			   if(tx!=null)
				   tx.rollback();
		   }finally {
			   session.close();
		   }
		   return result;
	   }
}
