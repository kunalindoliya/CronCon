package croncon.operation;

import java.sql.Date;

import java.util.Calendar;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import croncon.bean.AttendanceBean;
import croncon.bean.FeedBean;
import croncon.bean.ProfileBean;
import croncon.db.Dbconnection;

public class MyFunction {

	public List<AttendanceBean> checkAttendanceStatus(String emp_id) {
		Date date = new Date(Calendar.getInstance().getTimeInMillis());
		Session session = Dbconnection.getSessionFactory().openSession();
		Transaction tx = null;
		List<AttendanceBean> result = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("From AttendanceBean a where a.emp_id=:emp_id and a.date=:date");
			query.setParameter("emp_id", emp_id);
			query.setParameter("date", date);
			result = query.getResultList();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	public List listEmployees(){
		Session session=Dbconnection.getSessionFactory().openSession();
		Transaction tx=null;
		List result=null;
		try {
			tx=session.beginTransaction();
			Query query=session.createQuery("From ProfileBean");
			result=query.getResultList();
			tx.commit();
		}catch(HibernateException e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
}
