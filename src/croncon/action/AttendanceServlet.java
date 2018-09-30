package croncon.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import croncon.bean.AttendanceBean;
import croncon.operation.Attendance;

public class AttendanceServlet extends HttpServlet {
  public void doGet(HttpServletRequest req, HttpServletResponse res){
	  doPost(req,res);
  }
  public void doPost(HttpServletRequest req,HttpServletResponse res) {
	  try {
		  AttendanceBean attendance=new AttendanceBean();
		  if(req.getParameter("status").equals("1"))
		  {
			  attendance.setEmp_id(req.getParameter("emp_id"));
			  attendance.setDate(new Date(Calendar.getInstance().getTimeInMillis()));
			  SimpleDateFormat formatter=new SimpleDateFormat("hh:mm a");
			  String time=formatter.format(new java.util.Date());
			  attendance.setClock_out_time(time);
			  URL url_name = new URL("http://bot.whatismyipaddress.com");			 
		      BufferedReader sc = new BufferedReader(new InputStreamReader(url_name.openStream()));
		      attendance.setClock_out_ip(sc.readLine().trim());
		      attendance.setStatus("0");
		      int i=Attendance.updateAttendance(attendance);
		      if(i>0)
		      {
		    	  
		    	  res.sendRedirect("dashboard.jsp");
		      }
			  
		  }
		  else if(req.getParameter("status").equals("0")) {
		  attendance.setEmp_id(req.getParameter("emp_id"));
		  attendance.setName(req.getParameter("emp_name"));
		  attendance.setDate(new Date(Calendar.getInstance().getTimeInMillis()));
		  System.out.println(attendance.getDate());
		  SimpleDateFormat formatter=new SimpleDateFormat("hh:mm a");
		  String time=formatter.format(new java.util.Date());
		  System.out.println(time);
		  attendance.setClock_in_time(time);
		  System.out.println(attendance.getClock_in_time());
		  URL url_name = new URL("http://bot.whatismyipaddress.com");			 
	      BufferedReader sc = new BufferedReader(new InputStreamReader(url_name.openStream()));
	      attendance.setClock_in_ip(sc.readLine().trim());
	      attendance.setStatus("1");
	      System.out.println(attendance.getClock_in_ip());
	      int i=Attendance.addAttendance(attendance);
	      if(i>0)
	      {
	    	  
	    	  res.sendRedirect("dashboard.jsp");
	      }
		 }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
  }
}
