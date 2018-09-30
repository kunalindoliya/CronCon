package croncon.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteEmployeeServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	{
		try {
			String emp_ids[]=req.getParameterValues("employee_check");
			for(String s:emp_ids)
				System.out.println(s);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
