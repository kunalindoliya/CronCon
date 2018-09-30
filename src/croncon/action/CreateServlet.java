package croncon.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import croncon.bean.ProfileBean;
import croncon.bean.UserBean;
import croncon.operation.User;

public class CreateServlet extends HttpServlet {

	public void doGet(HttpServletRequest req,HttpServletResponse res)
	{
		doPost(req,res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	{
		try {
			
			UserBean user=new UserBean();
			ProfileBean profile=new ProfileBean();
			user.setFirst_name(req.getParameter("first_name"));
			user.setLast_name(req.getParameter("last_name"));
			user.setEmail(req.getParameter("email"));
			user.setEmp_id(req.getParameter("emp_id"));
			user.setUsername(req.getParameter("email"));
			user.setPassword(req.getParameter("password"));
			if(req.getParameter("allow_login").equalsIgnoreCase("on"))
				user.setStatus("1");
			else
				user.setStatus("0");
			user.setUser_type("Employee");
			profile.setFirst_name(req.getParameter("first_name"));
			profile.setLast_name(req.getParameter("last_name"));
			profile.setBirthday(req.getParameter("dob"));
			profile.setGender(req.getParameter("gender"));
			profile.setEmp_id(req.getParameter("emp_id"));
			profile.setEmail(req.getParameter("email"));
			profile.setStatus("1");
			user.setProfile(profile);
			int i=User.createEmployee(user);
			if(i>0)
			{
				
				res.sendRedirect("profile.jsp?emp_id="+req.getParameter("emp_id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
