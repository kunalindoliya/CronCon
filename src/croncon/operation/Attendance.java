package croncon.operation;



import java.sql.Date;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import croncon.bean.AttendanceBean;
import croncon.db.Dbconnection;

public class Attendance {
	
    public static int addAttendance(AttendanceBean attendance) {
    	int i=0;
    	Session session=Dbconnection.getSessionFactory().openSession();
    	Transaction tx=null;
    	try {
    		tx=session.beginTransaction();
    		session.save(attendance);
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
    
    public static int updateAttendance(AttendanceBean attendance){
    	int i=0;
    	String emp_id=attendance.getEmp_id();
    	Date date=attendance.getDate();
    	String clock_out_time=attendance.getClock_out_time();
    	String clock_out_ip=attendance.getClock_out_ip();
    	String status=attendance.getStatus();
    	Session session=Dbconnection.getSessionFactory().openSession();
    	Transaction tx=null;
    	try {
    		tx=session.beginTransaction();
    		Query query=session.createQuery("UPDATE AttendanceBean set clock_out_time=:clock_out_time,clock_out_ip=:clock_out_ip, status=:status where "+
    		"emp_id=:emp_id and date=:date");
    		query.setParameter("clock_out_time", clock_out_time);
    		query.setParameter("clock_out_ip", clock_out_ip);
    		query.setParameter("status", status);
    		query.setParameter("emp_id", emp_id);
    		query.setParameter("date", date);
    		i=query.executeUpdate();
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
