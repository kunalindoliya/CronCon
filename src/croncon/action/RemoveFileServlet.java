package croncon.action;

import java.io.File;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import croncon.bean.UserBean;
import croncon.operation.Profile;

public class RemoveFileServlet extends HttpServlet {
	private ServletFileUpload uploader = null;
 public void doGet(HttpServletRequest req,HttpServletResponse res) {
	 doPost(req,res);
 }
 public void doPost(HttpServletRequest req,HttpServletResponse res) {
	 try {
		
		 HttpSession session=req.getSession(false);
		 UserBean user=(UserBean)session.getAttribute("currentsessionuser");
		 String emp_id=user.getEmp_id();
		 String file_name=req.getParameter("file_name");
		 String column=req.getParameter("column");
		 DiskFileItemFactory factory=new DiskFileItemFactory();
		   String contextPath=req.getServletContext().getRealPath("");
		   String documents=contextPath+File.separator+"documents";
		   factory.setRepository(new File(documents));
		   this.uploader=new ServletFileUpload(factory);
		   File file=new File(documents+File.separator+file_name);
		   boolean flag=file.delete();
		   
		    if(flag) {
		    	int i=Profile.removeFile(column, emp_id);
		    	if(i>0) {
		    		session.setAttribute("message", user);
		    		res.sendRedirect("profile.jsp");
		    	}
		    }
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
 }
}
