package croncon.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import croncon.bean.UserBean;
import croncon.operation.User;

public class SignupServlet extends HttpServlet {
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		doPost(req,res);
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		try {
			int i=0;
			UserBean user=new UserBean();
			user.setFirst_name(req.getParameter("first_name"));
			user.setLast_name(req.getParameter("last_name"));
			user.setEmail(req.getParameter("email"));
			user.setUsername(req.getParameter("username"));
			user.setPassword(req.getParameter("password"));
			i=User.signup(user);
			if(i>0)
			{
				HttpSession session=req.getSession(true);
				session.setAttribute("message", "Registration Successful!");
				res.sendRedirect("index.jsp");
			}
			else
			{
				HttpSession session=req.getSession();
				session.setAttribute("message", "Registration Unsuccessful!");
				res.sendRedirect("index.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
