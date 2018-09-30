package croncon.operation;



import java.util.List;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import croncon.bean.CommentBean;
import croncon.db.Dbconnection;

public class Comment {
	 
	 public static int addComment(CommentBean com) {
		    int i=0;
		   Session session=Dbconnection.getSessionFactory().openSession();
		   Transaction tx=null;
		   try {
			  tx=session.beginTransaction();
			  session.save(com);
			  i=1;
			  tx.commit();
		   }catch(HibernateException e) {
			   if(tx!=null)
				   tx.rollback();
		   }finally {
			   session.close();
		   }
		   return i;
	   }
	   
	@SuppressWarnings("unchecked")
	public List<CommentBean> displaycomment(int feed_id){
		    Session session=Dbconnection.getSessionFactory().openSession();
		    Transaction tx=null;
		    List<CommentBean> result=null;
		   try {
			   tx=session.beginTransaction();
			   String hql="From CommentBean c where c.feed_id=:feed_id";
			   Query query=session.createQuery(hql);
			   query.setParameter("feed_id", feed_id);
			   result=query.getResultList();		   
			   tx.commit();
		   }catch(HibernateException e) {
			   if(tx!=null)
				   tx.rollback();
			   e.printStackTrace();   
		   }finally {
			   session.close();
		   }
		   return result;
	   }
}
