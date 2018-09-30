package croncon.action;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import croncon.bean.CommentBean;
import croncon.bean.ProfileBean;
import croncon.bean.UserBean;
import croncon.operation.Comment;
import croncon.operation.Profile;


public class CommentServlet extends HttpServlet {
   public void doGet(HttpServletRequest req,HttpServletResponse res)
   {
	   doPost(req,res);
   }
   public void doPost(HttpServletRequest req, HttpServletResponse res) {
	   try {
		   int i=0;
		   HttpSession session=req.getSession(false);
		   UserBean user=(UserBean)session.getAttribute("currentsessionuser");
		   CommentBean comment=new CommentBean();
		   Profile profile=new Profile();
		   List<ProfileBean> list=profile.displayProfile(user.getEmp_id());
		   ProfileBean pro=list.get(0);
		   comment.setFeed_id(Integer.parseInt(req.getParameter("feed_id")));
		   comment.setName(user.getFirst_name()+" "+user.getLast_name());
		   comment.setComment(req.getParameter("comment"));
		   SimpleDateFormat format1=new SimpleDateFormat("HH:mm:ss");
		   String formatted=format1.format(new Date());
		   comment.setTime(Time.valueOf(formatted));
		   SimpleDateFormat format2=new SimpleDateFormat("EEEE");		   
		   comment.setDay(format2.format(new Date()));
		   comment.setImage(pro.getImage());
		   i=Comment.addComment(comment);
		   if(i>0)
		   res.sendRedirect("dashboard.jsp");
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
   }
}
