package croncon.action;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import croncon.operation.Company;

public class RemoveCompanyServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		doPost(req,res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		try {
			String str[]=req.getParameterValues("company");
			if(str.length==0)
				throw new Exception();
			int i=Company.removeCompany(str);
			if(i>0)
			{
				HttpSession session=req.getSession(false);
				session.setAttribute("removecompany", "Deletion Successful");
				res.sendRedirect("companies.jsp");
			}
			else
			{
				HttpSession session=req.getSession(false);
				session.setAttribute("removecompany", "Deletion Unsuccessful");
				res.sendRedirect("companies.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
			e.getMessage();
			HttpSession session=req.getSession(false);
			session.setAttribute("removecompany", "Please select atleast one company");
			res.sendRedirect("companies.jsp");
		}
	}

}
