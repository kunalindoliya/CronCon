package croncon.operation;



import java.util.Iterator;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import croncon.bean.UserBean;
import croncon.db.Dbconnection;

public class User {
	 
	@SuppressWarnings(value = "rawtypes")
	   public static UserBean login(UserBean user){
		   String username=user.getUsername();
		   String password=user.getPassword();
		   Session session=Dbconnection.getSessionFactory().openSession();
		   Transaction tx=null;
		   try {
			   tx=session.beginTransaction();
			   String hql="FROM UserBean u where u.username=:username and u.password=:password ";
			   Query query=session.createQuery(hql);
			   query.setParameter("username", username);
			   query.setParameter("password", password);
			   List result=query.getResultList();
			   for(Iterator iterator=result.iterator();iterator.hasNext();) {
				   user=(UserBean)iterator.next();
			   }
			   tx.commit();
			  
		   }catch(HibernateException e) {
			    if (tx!=null)
				   tx.rollback();
		         e.printStackTrace();
		   }finally {
			   session.close();
		   }
		   return user;
	   }
	   public static int signup(UserBean user){
		   int i=0;
		   String first_name=user.getFirst_name();
		   String last_name=user.getLast_name();
		   String email=user.getEmail();
		   String username=user.getUsername();
		   String password=user.getPassword();
		 /*  try {
			   con=Dbconnection.getCon();
			   stmt=con.prepareStatement("insert into user(first_name,last_name,email,username,password,status) values(?,?,?,?,?,?)");
			   stmt.setString(1, first_name);
			   stmt.setString(2, last_name);
			   stmt.setString(3,email);
			   stmt.setString(4, username);
			   stmt.setString(5, password);
			   stmt.setString(6, "1");
			   i=stmt.executeUpdate();
			   
		   }catch(Exception e) {
			   e.printStackTrace();
			   con.close();
		   }*/
		   return i;
	   }
	   public static int createEmployee(UserBean user)
	   {
		   int i=0;
		   Session session=Dbconnection.getSessionFactory().openSession();
		   Transaction tx=null;
		   try {
			   tx=session.beginTransaction();
			   session.save(user);
			   tx.commit();
			   i=1;
		   }catch(HibernateException e)
		   {
			   if(tx!=null)
			    tx.rollback();
			   e.printStackTrace();
		   }finally {
			   session.close();
		   }
		   return i;
	   }
}
