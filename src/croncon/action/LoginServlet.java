package croncon.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import croncon.bean.UserBean;
import croncon.operation.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	{
		doPost(req,res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		try {
		UserBean user=new UserBean();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user=User.login(user);
		 URL whatismyip = new URL("http://bot.whatismyipaddress.com");
	     BufferedReader in = new BufferedReader(new InputStreamReader(whatismyip.openStream()));
	     String ip = in.readLine().trim();       
	        
		if(user.getStatus().equals("1")&& user.getUser_type().equalsIgnoreCase("Manager")) {
			HttpSession session=req.getSession(true);
			session.setAttribute("currentsessionuser", user);
			session.setAttribute("ip", ip);
		    String id=session.getId();
			res.sendRedirect("Manager/dashboard.jsp?id="+id);
			
		}
		else if(user.getStatus().equals("1") && user.getUser_type().equalsIgnoreCase("Employee")) {
			HttpSession session=req.getSession(true);
			session.setAttribute("currentsessionuser", user);
			session.setAttribute("ip", ip);
			String id=session.getId();
			res.sendRedirect("Employee/dashboard.jsp?id="+id);
		}
		else {
			HttpSession session=req.getSession(true);
			session.setAttribute("message", "You are not registered user!");
			res.sendRedirect("index.jsp");
		    
		}
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
