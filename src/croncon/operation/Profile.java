package croncon.operation;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import croncon.bean.ProfileBean;
import croncon.db.Dbconnection;

public class Profile {
  public List<ProfileBean> displayProfile(String emp_id){
	  Session session=Dbconnection.getSessionFactory().openSession();
	  Transaction tx=null;
	  List<ProfileBean> result=null;
	  try {
		  tx=session.beginTransaction();
		  Query hql=session.createQuery("From ProfileBean where emp_id=:emp_id");
		  hql.setParameter("emp_id", emp_id);
		  result=hql.getResultList();
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
  public static int updateProfile(ProfileBean profile) {
	  int i=0;
	  Session session=Dbconnection.getSessionFactory().openSession();
	  Transaction tx=null;
	  try {
		  tx=session.beginTransaction();
		  session.update(profile);
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
  public static int removeFile(String column,String emp_id) {
	  int i=0;
	  Session session=Dbconnection.getSessionFactory().openSession();
	  Transaction tx=null;
	  try {
		  tx=session.beginTransaction();
		  String query="UPDATE ProfileBean set "+column+"=:value where emp_id=:emp_id";
		  Query hql=session.createQuery(query);
		  hql.setParameter("value", null);
		  hql.setParameter("emp_id", emp_id);
		  i=hql.executeUpdate();
		  tx.commit();
	  }catch(HibernateException e) {
		  if(tx!=null)
			  tx.rollback();
		  e.printStackTrace();
	  }finally {
		  session.close();
	  }
	  return i;
  }
}
