package croncon.action;

import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import croncon.bean.CompanyBean;
import croncon.bean.FeedBean;
import croncon.bean.UserBean;
import croncon.operation.Company;


/**
 * Servlet implementation class CompanyServlet
 */
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try
		{  
			   int i=0;
			   HttpSession session= req.getSession(false);
			   UserBean user=(UserBean)session.getAttribute("currentsessionuser");
			   FeedBean feed=new FeedBean();
			   CompanyBean company=new CompanyBean();
			   company.setName(req.getParameter("name"));
			   company.setContact(req.getParameter("contact"));
			   company.setWebsite(req.getParameter("website"));
			   feed.setName(user.getName());
			   SimpleDateFormat format1=new SimpleDateFormat("HH:mm:ss");
			   String formatted=format1.format(new Date());	
			   SimpleDateFormat format2=new SimpleDateFormat("EEEE");
			   feed.setTime(Time.valueOf(formatted));
			   feed.setDay(format2.format(new Date()));
			   feed.setStatus(feed.getName()+" added "+company.getName()+" to the companies");
			   i=Company.addCompany(company,feed);
			   if (i>0) {
				   
				   session.setAttribute("Notification", "Success! Company added");
				   res.sendRedirect("companies.jsp");
			   }
			   
}
		   catch(Exception e) {
			   e.printStackTrace();
			   e.getMessage();
		   }
	   }
}

