package croncon.action;

import java.io.File;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import croncon.bean.FeedBean;
import croncon.bean.ProfileBean;
import croncon.bean.UserBean;
import croncon.operation.Feed;
import croncon.operation.Profile;



public class FeedServlet extends HttpServlet{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletFileUpload uploader = null;
   public  void doGet(HttpServletRequest req,HttpServletResponse res) {
	   doPost(req,res);
   }
   public void doPost(HttpServletRequest req,HttpServletResponse res) {
	   try {
		   int i=0;
		   HttpSession session=req.getSession(false);
		   UserBean user=(UserBean)session.getAttribute("currentsessionuser");
		   Profile profile=new Profile();
		   List<ProfileBean> list=profile.displayProfile(user.getEmp_id());
		   ProfileBean pro=list.get(0);
		   FeedBean feed=new FeedBean();
		   feed.setName(user.getFirst_name()+" "+user.getLast_name());
		   SimpleDateFormat format1=new SimpleDateFormat("HH:mm:ss");
		   String formatted=format1.format(new Date());	
		   SimpleDateFormat format2=new SimpleDateFormat("EEEE");
		   feed.setTime(Time.valueOf(formatted));
		   feed.setDay(format2.format(new Date()));
		   feed.setImage(pro.getImage());
		   DiskFileItemFactory factory=new DiskFileItemFactory();
		   String contextPath=req.getServletContext().getRealPath("");
		   String savePath=contextPath+File.separator+"feeds";
		   factory.setRepository(new File(savePath));
		   this.uploader=new ServletFileUpload(factory);
		
	        
	        
		   
		 /*  InputStream inputStream = null; // input stream of the upload file
		   
	         
	      // obtains the upload file part in this multipart request
	        Part filePart = req.getPart("photo");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
	        feed.setImage(inputStream);  */
		   if(!ServletFileUpload.isMultipartContent(req)){
				throw new ServletException("Content type is not multipart/form-data");
			}
		   try {
				List<FileItem> fileItemsList = uploader.parseRequest(req);
				Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
				while(fileItemsIterator.hasNext()){
					FileItem fileItem = fileItemsIterator.next();
					if(fileItem.isFormField())
					{
						feed.setStatus(fileItem.getString());
					}
					else if(!fileItem.getName().equals("")) {										
					File file = new File(savePath+File.separator+fileItem.getName());				
					fileItem.write(file);
					feed.setPhoto(fileItem.getName());
					}
					
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} 
		   i=Feed.feed(feed);
		   System.out.println(i);
		   if(i>0)
		   {
			  res.sendRedirect("dashboard.jsp");
		   }
		   
	    } catch(Exception e) {
	   e.printStackTrace();
	 }   
  }
}
