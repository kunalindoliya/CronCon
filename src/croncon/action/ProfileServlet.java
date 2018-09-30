package croncon.action;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import croncon.bean.ProfileBean;
import croncon.bean.UserBean;
import croncon.operation.Profile;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ProfileServlet extends HttpServlet {
	private ServletFileUpload uploader = null;
 public void doGet(HttpServletRequest req,HttpServletResponse res) {
	 doPost(req,res);
 }
 public void doPost(HttpServletRequest req,HttpServletResponse res) {
	 try {
		 int i=0;
		 ProfileBean profile=new ProfileBean();
		 DiskFileItemFactory factory=new DiskFileItemFactory();
		
		   String contextPath=req.getServletContext().getRealPath("");
		   String profilepicture=contextPath+File.separator+"profilepictures";
		   String documents=contextPath+File.separator+"documents";
		   factory.setRepository(new File(profilepicture));
		   factory.setRepository(new File(documents));
		   this.uploader=new ServletFileUpload(factory);
		  
		   if(!ServletFileUpload.isMultipartContent(req)){
				throw new ServletException("Content type is not multipart/form-data");
			}
		   try {
			   List<FileItem> fileItemsList = uploader.parseRequest(req);
				Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
				while(fileItemsIterator.hasNext())
				{
					FileItem fileItem = fileItemsIterator.next();
					if(fileItem.isFormField())
					{
						if(fileItem.getFieldName().equalsIgnoreCase("id"))
							profile.setId(Integer.parseInt(fileItem.getString()));
						if(fileItem.getFieldName().equalsIgnoreCase("emp_id"))
							profile.setEmp_id(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("status"))
							profile.setStatus(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("first_name"))
							profile.setFirst_name(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("last_name"))
							profile.setLast_name(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("email"))
							profile.setEmail(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("dob"))
						profile.setBirthday(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("gender"))
							profile.setGender(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("martial_status"))
						{
							
							if(fileItem.getString().equalsIgnoreCase("on"))
								profile.setMartial_status("Married"); 
							else
								profile.setMartial_status("Unmarried");
						}
						if(fileItem.getFieldName().equalsIgnoreCase("croppedprofileimage")) {
							if(!fileItem.getString().equals("")) {
							String img=fileItem.getString().split(",")[1];
							BufferedImage image = null;
							byte[] imageByte;
							BASE64Decoder decoder = new BASE64Decoder();
							imageByte = decoder.decodeBuffer(img);
							File file=new File(profilepicture+File.separator+profile.getFirst_name()+profile.getEmp_id()+".png");
							ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
						    image=ImageIO.read(bis);
							ImageIO.write(image, "png", file);
							profile.setImage(profile.getFirst_name()+profile.getEmp_id()+".png");
							}
						}
						if(fileItem.getFieldName().equalsIgnoreCase("profile_picture"))
							profile.setImage(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("address"))
							profile.setAddress(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("econtact")) 
							profile.setEmergency_contact(fileItem.getString());					
						if(fileItem.getFieldName().equalsIgnoreCase("eperson")) 
							profile.setEmergency_person(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("contact"))
							profile.setMobile_phone(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("drivinglicensenumber"))
							profile.setDriving_license_number(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("aadharnumber"))
							profile.setAadhar_number(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("pannumber"))
							profile.setPan_number(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("voteridnumber"))
							profile.setVoter_id_number(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("primary_account")) 
							profile.setPrimary_bank_account(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("account_type_1")) 
							profile.setAccount_type_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("account_holder_name_1"))
							profile.setAccount_holder_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("account_number_1"))
							profile.setAccount_number_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("ifsc_code_1"))
							profile.setIfsc_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("account_type_2"))
							profile.setAccount_type_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("account_holder_name_2"))
							profile.setAccount_holder_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("account_number_2"))
							profile.setAccount_number_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("ifsc_code_2"))
							profile.setIfsc_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("university_ug"))
							profile.setGraduation_school(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("start_date_ug"))
							profile.setGraduation_start_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("end_date_ug"))
							profile.setGraduation_end_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("details_ug"))
							profile.setGraduation_detail(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("university_pg"))
							profile.setPg_school(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("start_date_pg"))
							profile.setPg_start_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("end_date_pg"))
							profile.setPg_end_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("details_pg"))
							profile.setPg_detail(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("university_doctorate"))
							profile.setDoctorate_school(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("start_date_doctorate"))
							profile.setDoctorate_start_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("end_date_doctorate"))
							profile.setDoctorate_end_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("details_doctorate"))
							profile.setDoctorate_detail(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("details_certification"))
							profile.setCertification(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("company_work_1"))
							profile.setCompany_work_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("from_work_1"))
							profile.setFrom_work_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("designation_work_1"))
							profile.setDesignation_work_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("to_work_1"))
							profile.setTo_work_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("details_work_1"))
							profile.setDetail_work_1(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("company_work_2"))
							profile.setCompany_work_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("from_work_2"))
							profile.setFrom_work_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("designation_work_2"))
							profile.setDesignation_work_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("to_work_2"))
							profile.setTo_work_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("details_work_2"))
							profile.setDetail_work_2(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("details_other_work"))
							profile.setOther_work(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("passport_number"))
							profile.setPassport_number(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("passport_issue"))
							profile.setPassport_issue_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("passport_expiry"))
							profile.setPassport_expiry_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("visa_number"))
							profile.setVisa_number(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("visa_issue"))
							profile.setVisa_issue_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("visa_expiry"))
							profile.setVisa_expiry_date(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("linkedin_username"))
							profile.setLinkedin_username(fileItem.getString());						
						if(fileItem.getFieldName().equalsIgnoreCase("twitter_username"))
							profile.setTwitter_username(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("facebook_username"))
							profile.setFacebook_username(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("instagram_username"))
							profile.setInstagram_username(fileItem.getString());
						//Documents Fields 
						if(fileItem.getFieldName().equals("drivinglicense"))
							profile.setDriving_license_file(fileItem.getString());
						if(fileItem.getFieldName().equals("aadhar"))
							profile.setAadhar_file(fileItem.getString());
						if(fileItem.getFieldName().equals("pancard"))
							profile.setPan_file(fileItem.getString());
						if(fileItem.getFieldName().equals("voterid"))
							profile.setVoter_id_file(fileItem.getString());
						if(fileItem.getFieldName().equals("offerletter"))
							profile.setOffer_letter(fileItem.getString());
						if(fileItem.getFieldName().equalsIgnoreCase("contract"))
							profile.setContract(fileItem.getString());
						if(fileItem.getFieldName().equals("joiningletter"))
							profile.setJoining_letter(fileItem.getString());
						if(fileItem.getFieldName().equals("resume"))
							profile.setResume(fileItem.getString());
						if(fileItem.getFieldName().equals("passport_copy"))
							profile.setPassport_file(fileItem.getString());
						if(fileItem.getFieldName().equals("visa_copy"))
							profile.setVisa_file(fileItem.getString());						
					}
					else if(!fileItem.getName().equals(""))
					{
						
						if(fileItem.getFieldName().equalsIgnoreCase("drivinglicense")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setDriving_license_file(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("aadhar")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setAadhar_file(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("pancard")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setPan_file(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("voterid")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setVoter_id_file(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("offerletter")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setOffer_letter(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("contract")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setContract(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("joiningletter")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setJoining_letter(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("resume")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setResume(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("passport_copy")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setPassport_file(fileItem.getName());
						}
						if(fileItem.getFieldName().equalsIgnoreCase("visa_copy")) {
							File file=new File(documents+File.separator+fileItem.getName());
							fileItem.write(file);
							profile.setVisa_file(fileItem.getName());
						}
					}
				}
				i=Profile.updateProfile(profile);
				if(i>0) {
					HttpSession session=req.getSession(false);
					session.setAttribute("message", profile);
					res.sendRedirect("profile.jsp?emp_id="+profile.getEmp_id());
				}
						
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
 }
}
