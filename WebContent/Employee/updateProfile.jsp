<%@page import="croncon.bean.ProfileBean"%>
<%@page import="java.util.List"%>
<%@page import="croncon.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%
 UserBean user=(UserBean)session.getAttribute("currentsessionuser");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=user.getFirst_name().toUpperCase()+" "+user.getLast_name().toUpperCase() %> | CronCon</title>
<jsp:include page="include/css.jsp"></jsp:include>
<link rel="stylesheet" href="../assets/dist/css/custom.css">
<style>
.content-wrapper{
margin-top:40px;
}
.dropdown-item:hover{
background-color:#007bff;
}
</style>
</head>
<jsp:useBean id="c1" class="croncon.operation.Profile"></jsp:useBean>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/sidebar.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="content-header">
     	 <div class="container-fluid">
        	<div class="row mb-2">
        </div>
      	</div>
   	  </div>
   	  <%
   	  try{
   	   List<ProfileBean> result=c1.displayProfile(user.getEmp_id());
   	    ProfileBean profile=(ProfileBean)result.get(0);
   	  %>
    <form action="updateprofile" method="post" enctype="multipart/form-data">
    <input  type="hidden" name="id" value="<%=profile.getId() %>">
    <input  type="hidden" name="emp_id" value="<%=user.getEmp_id()%>">
    <input type="hidden" name="status" value="<%=profile.getStatus()%>">
		<div class="row">
				<section class="content col-md-3">
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<ul class="nav nav-pills">
								<li class="nav-item" style="width: 100%"><a
									class="nav-link active li" href="#tab_1" data-toggle="tab"><i
										class="fa fa-info-circle"></i> Basic Info</a></li>
								<li class="nav-item" style="width: 100%"><a
									class="nav-link li" href="#tab_2" data-toggle="tab"><i
										class="fa fa-phone"></i> Contact Info</a></li>
								<li class="nav-item" style="width: 100%"><a
									class="nav-link li" href="#tab_3" data-toggle="tab"><i
										class="fa fa-book"></i> Documents</a></li>
								<li class="nav-item" style="width: 100%"><a
									class="nav-link li" href="#tab_4" data-toggle="tab"><i
										class="fa fa-money"></i> Bank Details</a></li>
								<li class="nav-item" style="width: 100%"><a
									class="nav-link li" href="#tab_5" data-toggle="tab"><i
										class="fa fa-graduation-cap"></i> Qualification</a></li>
								<li class="nav-item" style="width: 100%"><a
									class="nav-link li" href="#tab_6" data-toggle="tab"><i
										class="fa fa-briefcase"></i> Work Experience</a></li>
								<li class="nav-item" style="width: 100%"><a
									class="nav-link li" href="#tab_7" data-toggle="tab"><i
										class="fa fa-exchange"></i> Immigration</a></li>
								<li class="nav-item" style="width: 100%"><a
									class="nav-link li" href="#tab_8" data-toggle="tab"><i
										class="fa fa-globe"></i> Social Network</a></li>
								<li style="margin-top:10px;width:100%"><button type="submit"
									class="btn btn-success btn-block">Update</button></li>
							</ul>
						</div>
					</div>
				</div>
				</section>
				<section class="content col-md-9">
				   <div class="card">
						<div class="card-header">
							<a href="profile.jsp" class="btn btn-success"
								style="color: white"><i class="fa fa-caret-left"></i> Back</a>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane active" id="tab_1">
									<div class="row">
									<section class="content col-md-8" >
									<div class="card card-primary">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-info-circle"></i>
												Basic Info</span>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>First Name</label> <input type="text"
															name="first_name" class="form-control" value="<%=profile.getFirst_name()%>">
													</div>
													<div class="form-group">
														<label>Email</label> <input type="text" name="email"
															class="form-control" value="<%=profile.getEmail()%>">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Last Name</label> <input type="text"
															name="last_name" class="form-control" value="<%=profile.getLast_name()%>">
													</div>
													<div class="form-group">
														<label>Gender</label> <select  class="form-control"
															name="gender">
															<option value="">--Select an option--</option>
															<%
															  if(profile.getGender().equalsIgnoreCase("male")){ %>
															<option value="Male" selected>Male</option>
															<option Value="Female">Female</option>
															<%} else if(profile.getGender().equalsIgnoreCase("female")){ %>
															<option value="Male" >Male</option>
															<option Value="Female" selected>Female</option>
															<%} %>
															
														</select>
													</div>
												</div>
											</div>
											<div class="form-group" style="width: 100%">
												<label>Date of Birth</label> <input type="date" name="dob"
													class="form-control" value="<%=profile.getBirthday()%>">
											</div>
											<div class="form-group">
												<label>Martial Status</label><br>
												<input type="hidden" name="martial_status" value="Unmarried">
												<% 
												
												 if((profile.getMartial_status()!=null)&&profile.getMartial_status().equalsIgnoreCase("married")){ %>
												<input type="checkbox" name="martial_status" data-toggle="toggle" data-on="Married" data-off="Unmarried" checked >
												<%}  else{ %>
													<input type="checkbox" name="martial_status" data-toggle="toggle" data-on="Married" data-off="Unmarried">
													<%}
												        %>																						
											</div>
										</div>
										<!-- /card-body -->
									</div> <!-- /card -->
									</section>
									<section class="content col-md-4">
									<div class="card card-warning" >
										<div class="card-header">
											<span class="card-title"><i class="fa fa-camera"></i>
												Photo</span><br>
										</div>
										
										<input type="hidden" value="" name="croppedprofileimage" id="croppedprofileimage">
										<div class="card-body">	
										<%if(profile.getImage()!=null){ %>					
										<img class="img-responsive gambar" src="../profilepictures/<%=profile.getImage()%>" width="200px" height="200px" style="object-fit:cover;">
										<input type="hidden" value="<%=profile.getImage()%>" name="profile_picture">
										<%} else{ %>
										    <img class="img-responsive gambar" src="https://user.gadjian.com/static/images/personnel_boy.png" width="200px" height="200px" style="object-fit:cover;">
										    <%} %>
											<div class="upload-btn-wrapper">
  											<button class="upload-btn">Select File</button>
 											 <input type="file" class="item-img" />
											</div>
										</div>
										<!-- crop modal -->
													<div class="modal fade" id="cropImagePop" tabindex="-1"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h4 class="modal-title" id="myModalLabel">Crop
																		Image</h4>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div id="upload-demo" class="center-block"></div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">Close</button>
																	<button type="button" id="cropImageBtn"
																		class="btn btn-primary">Crop</button>
																</div>
															</div>
														</div>
													</div>
												</div>
									</section>
									</div> <!-- /row -->						
								</div><!-- /.tab-pane -->
																
								<div class="tab-pane" id="tab_2">
									<div class="card card-success">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-phone"></i>
												Contact Information</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Address</label> 
														<%if(profile.getAddress()!=null){ %>
														<input type="text"
															name="address" class="form-control" value="<%=profile.getAddress()%>">
													    <%} else{ %>
													    <input type="text"
															name="address" class="form-control" value="">
															<%} %>
													</div>
													<div class="form-group">
														<label>Emergency Contact Number</label>
														<%if(profile.getEmergency_contact()!= null){ %>
														 <input type="text" name="econtact"
															class="form-control" value="<%=profile.getEmergency_contact()%>">
														<%} else{ %>
														<input type="text" name="econtact"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Contact Number</label>
														<%if(profile.getMobile_phone()!=null){ %>
														 <input type="text"
															name="contact" class="form-control" value="<%=profile.getMobile_phone()%>">
														<%} else{ %>
														 <input type="text"
															name="contact" class="form-control" value="">
															<%} %>
													</div>
													<div class="form-group">
													<label>Emergency Contact Person</label>
													<%if(profile.getEmergency_person()!=null){ %>
														 <input type="text" name="eperson"
															class="form-control" value="<%=profile.getEmergency_person()%>">
														<%} else{ %>
														<input type="text" name="eperson"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.tab-pane -->
								
									<div class="tab-pane" id="tab_3">
									<div class="card card-info">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-book"></i>
												Document Numbers</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Driving License Number</label> 
														<%if(profile.getDriving_license_number()!=null){ %>
														<input type="text"
															name="drivinglicensenumber" class="form-control" value="<%=profile.getDriving_license_number()%>">
														<%} else { %>
														<input type="text"
															name="drivinglicensenumber" class="form-control" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Aadhar Number/SSN</label> 
														<%if(profile.getAadhar_number()!=null){ %>
														<input type="text" name="aadharnumber"
															class="form-control" value="<%=profile.getAadhar_number()%>">
														<%} else{ %>
														<input type="text" name="aadharnumber"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>PAN Number</label> 
														<%if(profile.getPan_number()!=null){ %>
														<input type="text"
															name="pannumber" class="form-control" value="<%=profile.getPan_number()%>">
														<%} else{ %>
														<input type="text"
															name="pannumber" class="form-control" value="">
															<%} %>
													</div>
													<div class="form-group">
														<label>Voter ID Number</label>
														<%if(profile.getVoter_id_number()!=null){ %>
														 <input type="text" name="voteridnumber"
															class="form-control" value="<%=profile.getVoter_id_number()%>">
														<%} else{ %>
														<input type="text" name="voteridnumber"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-danger">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-book"></i>
												Document Copies</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Driving License </label>
														<%if(profile.getDriving_license_file()!=null){ %>
														 <input type="file" name="drivinglicense" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getDriving_license_file()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getDriving_license_file()%>&column=driving_license_file" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="drivinglicense" value="<%=profile.getDriving_license_file()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="drivinglicense" class="form-control">
														  <%} %>
													</div>
													<div class="form-group">
														<label>Aadhar/SSN</label> 
														<%if(profile.getAadhar_file()!=null){ %>
														 <input type="file" name="aadhar" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getAadhar_file()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getAadhar_file()%>&column=aadhar_file" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="aadhar" value="<%=profile.getAadhar_file()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="aadhar" class="form-control">
														  <%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>PAN Card</label> 
														<%if(profile.getPan_file()!=null){ %>
														 <input type="file" name="pancard" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getPan_file()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getPan_file()%>&column=pan_file" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="pancard" value="<%=profile.getPan_file()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="pancard" class="form-control">
														  <%} %>
													</div>
													<div class="form-group">
														<label>Voter ID </label> 
														<%if(profile.getVoter_id_file()!=null){ %>
														 <input type="file" name="voterid" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getVoter_id_file()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getVoter_id_file()%>&column=voter_id_file" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="voterid" value="<%=profile.getVoter_id_file()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="voterid" class="form-control">
														  <%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-warning">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-book"></i>
												Company Documents</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Offer Letter </label> 
														<%if(profile.getOffer_letter()!=null){ %>
														 <input type="file" name="offerletter" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getOffer_letter()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getOffer_letter()%>&column=offer_letter" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="offerletter" value="<%=profile.getOffer_letter()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="offerletter" class="form-control">
														  <%} %>
													</div>
													<div class="form-group">
														<label>Contract</label> 
														<%if(profile.getContract()!=null){ %>
														 <input type="file" name="contract" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getContract()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getContract()%>&column=contract" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="contract" value="<%=profile.getContract()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="contract" class="form-control">
														  <%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Joining Letter</label> 
														<%if(profile.getJoining_letter()!=null){ %>
														 <input type="file" name="joiningletter" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getJoining_letter()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getJoining_letter()%>&column=joining_letter" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="joiningletter" value="<%=profile.getContract()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="joiningletter" class="form-control">
														  <%} %>
													</div>
													<div class="form-group">
														<label>Resume </label>
														<%if(profile.getResume()!=null){ %>
														 <input type="file" name="resume" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getResume()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getResume()%>&column=resume" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="resume" value="<%=profile.getResume()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="resume" class="form-control">
														  <%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.tab-pane -->	
								<div class="tab-pane" id="tab_4">
									<div class="card card-info">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-money"></i>
												Bank Details</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Primary Bank Account</label> 
														<select name="primary_account" class="form-control">
															<option value="">Select an option &#10004;</option>
															<%if(profile.getPrimary_bank_account()!=null&&profile.getPrimary_bank_account().equalsIgnoreCase("Account 1")){ %>
															<option value="Account 1" selected>Account 1</option>
															<option value="Account 2">Account 2</option>
															<%}else if(profile.getPrimary_bank_account()!=null&&profile.getPrimary_bank_account().equalsIgnoreCase("Account 2")){ %>
																	<option value="Account 1">Account 1</option>
																	<option value="Account 2" selected>Account 2</option>
															<%} else{ %>
															<option value="Account 1">Account 1</option>
															<option value="Account 2">Account 2</option>
															<%} %>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-danger">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-money"></i>
												Account 1</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Account Type </label> <select
															name="account_type_1" class="form-control">
															<option value="">Select an option &#10004;</option>
															<%if(profile.getAccount_type_1()!=null&&profile.getAccount_type_1().equalsIgnoreCase("salary")){ %>
															<option value="salary" selected>Salary</option>
															<option value="savings">Savings</option>
															<option value="current">Current</option>
															<option value="other">Other</option>
															<%} else if(profile.getAccount_type_1()!=null&&profile.getAccount_type_1().equalsIgnoreCase("savings")){ %>
															<option value="salary">Salary</option>
															<option value="savings" selected>Savings</option>
															<option value="current">Current</option>
															<option value="other">Other</option>
															<%} else if(profile.getAccount_type_1()!=null&&profile.getAccount_type_1().equalsIgnoreCase("current")){ %>
															<option value="salary">Salary</option>
															<option value="savings">Savings</option>
															<option value="current" selected>Current</option>
															<option value="other">Other</option>
															<%} else if(profile.getAccount_type_1()!=null&&profile.getAccount_type_1().equalsIgnoreCase("other")){ %>
															<option value="salary">Salary</option>
															<option value="savings">Savings</option>
															<option value="current">Current</option>
															<option value="other" selected>Other</option>
															<%} else{ %>
															<option value="salary">Salary</option>
															<option value="savings">Savings</option>
															<option value="current">Current</option>
															<option value="other">Other</option>
															<%} %>
															</select>
													</div>
													<div class="form-group">
														<label>Account Number</label> 
														<%if(profile.getAccount_number_1()!=null){ %>
														<input type="text" name="account_number_1"
															class="form-control" value="<%=profile.getAccount_number_1()%>">
														<%} else{ %>
														<input type="text" name="account_number_1"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Account Holder Name</label> 
														<%if(profile.getAccount_holder_1()!=null){ %>
														<input type="text"
															name="account_holder_name_1" class="form-control" value="<%=profile.getAccount_holder_1()%>">
														<%} else{ %>
														<input type="text"
															name="account_holder_name_1" class="form-control" value="">
															<%} %>
													</div>
													<div class="form-group">
														<label>IFSC Code </label> 
														<%if(profile.getIfsc_1()!=null){ %>
														<input type="text" name="ifsc_code_1"
															class="form-control" value="<%=profile.getIfsc_1()%>">
														<%} else{ %>
														<input type="text" name="ifsc_code_1"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-warning">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-money"></i>
												Account 2</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Account Type </label> <select
															name="account_type_2" class="form-control">
															<option value="">Select an option &#10004;</option>
															<%if(profile.getAccount_type_2()!=null&& profile.getAccount_type_2().equalsIgnoreCase("salary")){ %>
															<option value="salary" selected>Salary</option>
															<option value="savings">Savings</option>
															<option value="current">Current</option>
															<option value="other">Other</option>
															<%} else if(profile.getAccount_type_2()!=null&&profile.getAccount_type_2().equalsIgnoreCase("savings")){ %>
															<option value="salary">Salary</option>
															<option value="savings" selected>Savings</option>
															<option value="current">Current</option>
															<option value="other">Other</option>
															<%} else if(profile.getAccount_type_2()!=null&&profile.getAccount_type_2().equalsIgnoreCase("current")){ %>
															<option value="salary">Salary</option>
															<option value="savings">Savings</option>
															<option value="current" selected>Current</option>
															<option value="other">Other</option>
															<%} else if(profile.getAccount_type_2()!=null&&profile.getAccount_type_2().equalsIgnoreCase("other")){ %>
															<option value="salary">Salary</option>
															<option value="savings">Savings</option>
															<option value="current">Current</option>
															<option value="other" selected>Other</option>
															<%} else{ %>
															<option value="salary">Salary</option>
															<option value="savings">Savings</option>
															<option value="current">Current</option>
															<option value="other">Other</option>
															<%} %>
															</select>
													</div>
													<div class="form-group">
														<label>Account Number</label> 
														<%if(profile.getAccount_number_2()!=null){ %>
														<input type="text" name="account_number_2"
															class="form-control" value="<%=profile.getAccount_number_2()%>">
														<%}else{ %>
														<input type="text" name="account_number_2"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Account Holder Name</label> 
														<%if(profile.getAccount_holder_2()!=null){ %>
														<input type="text"
															name="account_holder_name_2" class="form-control" value="<%=profile.getAccount_holder_2()%>">
														<%} else{ %>
														<input type="text"
															name="account_holder_name_2" class="form-control" value="">
															<%} %>
													</div>
													<div class="form-group">
														<label>IFSC Code </label>
														<%if(profile.getIfsc_2()!=null){ %>
														 <input type="text" name="ifsc_code_2"
															class="form-control" value="<%=profile.getIfsc_2()%>">
														<%} else{ %>
														<input type="text" name="ifsc_code_2"
															class="form-control" value="">
															<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.tab-pane -->	
								<div class="tab-pane" id="tab_5">
									<div class="card card-info">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-graduation-cap"></i>
												Graduation</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>School/University</label> 
														<%if(profile.getGraduation_school()!=null){ %>
														<input class="form-control" type="text" name="university_ug" value="<%=profile.getGraduation_school()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="university_ug" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>End Date</label> 
														<%if(profile.getGraduation_end_date()!=null){ %>
														<input class="form-control" type="date" name="end_date_ug" value="<%=profile.getGraduation_end_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="end_date_ug" value="">
														<%} %>
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Start Date</label>
														<%if(profile.getGraduation_start_date()!=null){ %>
														<input class="form-control" type="date" name="start_date_ug" value="<%=profile.getGraduation_start_date()%>">
														<%} else {%>
														<input class="form-control" type="date" name="start_date_ug" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Details</label>
														<%if(profile.getGraduation_detail()!=null){ %>
														<textarea class="form-control" rows="2" cols="3" name="details_ug" ><%=profile.getGraduation_detail() %></textarea>
														<%} else { %>
														<textarea class="form-control" rows="2" cols="3" name="details_ug" ></textarea>
														<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-danger">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-graduation-cap"></i>
												Post Graduation</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>School/University</label> 
														<%if(profile.getPg_school()!=null){ %>
														<input class="form-control" type="text" name="university_pg" value="<%=profile.getPg_school()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="university_pg" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>End Date</label> 
														<%if(profile.getPg_end_date()!=null){ %>
														<input class="form-control" type="date" name="end_date_pg" value="<%=profile.getPg_end_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="end_date_pg" value="">
														<%} %>
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Start Date</label>
														<%if(profile.getPg_start_date()!=null){ %>
														<input class="form-control" type="date" name="start_date_pg" value="<%=profile.getPg_start_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="start_date_pg" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Details</label>
														<%if(profile.getPg_detail()!=null){ %>
														<textarea class="form-control" rows="2" cols="3" name="details_pg"><%=profile.getPg_detail() %></textarea>
														<%} else{ %>
														<textarea class="form-control" rows="2" cols="3" name="details_pg"></textarea>
														<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-warning">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-graduation-cap"></i>
												Doctorate</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>School/University</label>
														<%if(profile.getDoctorate_school()!=null){ %> 
														<input class="form-control" type="text" name="university_doctorate" value="<%=profile.getDoctorate_school()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="university_doctorate" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>End Date</label> 
														<%if(profile.getDoctorate_end_date()!=null){ %>
														<input class="form-control" type="date" name="end_date_doctorate" value="<%=profile.getDoctorate_end_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="end_date_doctorate" value="">
														<%} %>
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Start Date</label>
														<%if(profile.getDoctorate_start_date()!=null){ %>
														<input class="form-control" type="date" name="start_date_doctorate" value="<%=profile.getDoctorate_start_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="start_date_doctorate" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Details</label>
														<%if(profile.getDoctorate_detail()!=null){ %>
														<textarea class="form-control" rows="2" cols="3" name="details_doctorate"><%=profile.getDoctorate_detail() %></textarea>
														<%} else{ %>
														<textarea class="form-control" rows="2" cols="3" name="details_doctorate"></textarea>
														<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-success">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-graduation-cap"></i>
												Certification/Courses</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Details</label>	
														<%if(profile.getCertification()!=null){ %>	
														<textarea class="form-control" rows="3" cols="3" name="details_certification"><%=profile.getCertification() %></textarea>	
														<%} else{ %>
														<textarea class="form-control" rows="3" cols="3" name="details_certification"></textarea>
														<%} %>										
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.tab-pane -->		
								<div class="tab-pane" id="tab_6">
									<div class="card card-info">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-briefcase"></i>
												Work Experience 1</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Company Name</label> 
														<%if(profile.getCompany_work_1()!=null){ %>
														<input class="form-control" type="text" name="company_work_1" value="<%=profile.getCompany_work_1()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="company_work_1" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>From</label>
														<%if(profile.getFrom_work_1()!=null){ %>
														<input class="form-control" type="date" name="from_work_1" value="<%=profile.getFrom_work_1()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="from_work_1" value="">
														<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Designation</label> 
														<%if(profile.getDesignation_work_1()!=null){ %>
														<input class="form-control" type="text" name="designation_work_1" value="<%=profile.getDesignation_work_1()%>">
														<%}else{ %>
														<input class="form-control" type="text" name="designation_work_1" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>To</label> 
														<%if(profile.getTo_work_1()!=null){ %>
														<input class="form-control" type="date" name="to_work_1" value="<%=profile.getTo_work_1()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="to_work_1" value="">
														<%} %>
													</div>													
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Details</label>
														<%if(profile.getDetail_work_1()!=null){ %>
														<textarea class="form-control" rows="4" cols="4" name="details_work_1"><%=profile.getDetail_work_1() %></textarea>
														<%} else{ %>
														<textarea class="form-control" rows="4" cols="4" name="details_work_1"></textarea>
														<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card card-danger">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-graduation-cap"></i>
												Work Experience 2</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Company Name</label> 
														<%if(profile.getCompany_work_2()!=null){ %>
														<input class="form-control" type="text" name="company_work_2" value="<%=profile.getCompany_work_2()%>">
														<%}else{ %>
														<input class="form-control" type="text" name="company_work_2" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>From</label>
														<%if(profile.getFrom_work_2()!=null){ %>
														<input class="form-control" type="date" name="from_work_2" value="<%=profile.getFrom_work_2()%>">
														<%}else{ %>
														<input class="form-control" type="date" name="from_work_2" value="">
														<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Designation</label> 
														<%if(profile.getDesignation_work_2()!=null){ %>
														<input class="form-control" type="text" name="designation_work_2" value="<%=profile.getDesignation_work_2()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="designation_work_2" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>To</label> 
														<%if(profile.getTo_work_2()!=null){ %>
														<input class="form-control" type="date" name="to_work_2" value="<%=profile.getTo_work_2()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="to_work_2" value="">
														<%} %>
													</div>													
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Details</label>
														<%if(profile.getDetail_work_2()!=null){ %>
														<textarea class="form-control" rows="4" cols="4" name="details_work_2"><%=profile.getDetail_work_2() %></textarea>
														<%} else{ %>
														<textarea class="form-control" rows="4" cols="4" name="details_work_2"></textarea>
														<%} %>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="card card-success">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-graduation-cap"></i>
												Other Work Experiences</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Details</label>
														<%if(profile.getOther_work()!=null){ %>		
														<textarea class="form-control" rows="4" cols="4" name="details_other_work"><%=profile.getOther_work() %></textarea>	
														<%} else{ %>
														<textarea class="form-control" rows="4" cols="4" name="details_other_work"></textarea>
														<%} %>										
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.tab-pane -->	
								<div class="tab-pane" id="tab_7">
									<div class="card card-info">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-exchange"></i>
												Passport</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Number</label> 
														<%if(profile.getPassport_number()!=null){ %>
														<input class="form-control" type="text" name="passport_number" value="<%=profile.getPassport_number()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="passport_number" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Expiry Date</label>
														<%if(profile.getPassport_expiry_date()!=null){ %>
														<input class="form-control" type="date" name="passport_expiry" value="<%=profile.getPassport_expiry_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="passport_expiry" value="">
														<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Issue Date</label> 
														<%if(profile.getPassport_issue_date()!=null){ %>
														<input class="form-control" type="date" name="passport_issue" value="<%=profile.getPassport_issue_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="passport_issue" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Scan Copy</label> 
														<%if(profile.getPassport_file()!=null){ %>
														 <input type="file" name="passport_copy" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getPassport_file()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getPassport_file()%>&column=passport_file" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="passport_copy" value="<%=profile.getPassport_file()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="passport_copy" class="form-control">
														  <%} %>
													</div>													
												</div>
											</div>
										</div>
									</div>	
									<div class="card card-danger">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-exchange"></i>
												Visa</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Number</label> 
														<%if(profile.getVisa_number()!=null){ %>
														<input class="form-control" type="text" name="Visa_number" value="<%=profile.getVisa_number()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="Visa_number" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Expiry Date</label>
														<%if(profile.getVisa_expiry_date()!=null){ %>
														<input class="form-control" type="date" name="Visa_expiry" value="<%=profile.getVisa_expiry_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="Visa_expiry" value="">
														<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Issue Date</label>
														<%if(profile.getVisa_issue_date()!=null){ %> 
														<input class="form-control" type="date" name="Visa_issue" value="<%=profile.getVisa_issue_date()%>">
														<%} else{ %>
														<input class="form-control" type="date" name="Visa_issue" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label>Scan Copy</label> 
														<%if(profile.getVisa_file()!=null){ %>
														 <input type="file" name="visa_copy" class="form-control" disabled>
														 <span><a href="../documents/<%=profile.getVisa_file()%>" download class="btn btn-primary btn-sm">Download</a></span>
														 <span><a href="removefile?file_name=<%=profile.getVisa_file()%>&column=visa_file" class="btn btn-danger btn-sm">Remove</a></span>
														 <input type="hidden" name="visa_copy" value="<%=profile.getVisa_file()%>" class="form-control">
														 <%} else{ %>
														  <input type="file" name="visa_copy" class="form-control">
														  <% } %>
													</div>													
												</div>
											</div>
										</div>
									</div>																											
								</div>
								<!-- /.tab-pane -->	
									<div class="tab-pane" id="tab_8">
									<div class="card card-info">
										<div class="card-header">
											<span class="card-title"><i class="fa fa-globe"></i>
												Social Details</span><br>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><i class="fa fa-linkedin-square"></i> LinkedIn Username</label> 
														<%if(profile.getLinkedin_username()!=null){ %>
														<input class="form-control" type="text" name="linkedin_username" value="<%=profile.getLinkedin_username()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="linkedin_username" value="">
														<%} %>
													</div>
													<div class="form-group">
														<label><i class="fa fa-facebook-square"></i> Facebook Username</label>
														<%if(profile.getFacebook_username()!=null){ %>
														<input class="form-control" type="text" name="facebook_username" value="<%=profile.getFacebook_username()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="facebook_username" value="">
														<%} %>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><i class="fa fa-twitter-square"></i> Twitter Username</label> 
														<%if(profile.getTwitter_username()!=null){ %>
														<input class="form-control" type="text" name="twitter_username" value="<%=profile.getTwitter_username()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="twitter_username" value="">
														<%} %>
														
													</div>
													<div class="form-group">
														<label><i class="fa fa-instagram"></i> Instagram Username</label>
														<%if(profile.getInstagram_username()!=null){ %> 
														<input class="form-control" type="text" name="instagram_username" value="<%=profile.getInstagram_username()%>">
														<%} else{ %>
														<input class="form-control" type="text" name="instagram_username" value="">
														<%} %>
													</div>													
												</div>
											</div>
										</div>
									</div>																																				
								</div>
								<!-- /.tab-pane -->																															
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- /.card-body -->
					</div>
					<!-- ./card -->
					<%}catch(Exception e){
					  e.printStackTrace();
					}				
					%>
				</section>
			</div> <!-- End row -->
		</form> <!-- End of form -->
	</div> <!-- End content wrapper -->
	<jsp:include page="include/footer.jsp"></jsp:include>
</div>

<jsp:include page="include/js.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$("#profile").addClass("active");
});

var $uploadCrop,
tempFilename,
rawImg,
imageId;
function readFile(input) {
		if (input.files && input.files[0]) {
      var reader = new FileReader();
        reader.onload = function (e) {
			$('.upload-demo').addClass('ready');
			$('#cropImagePop').modal('show');
            rawImg = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    }
    else {
        swal("Sorry - you're browser doesn't support the FileReader API");
    }
}

$uploadCrop = $('#upload-demo').croppie({
	viewport: {
		width: 300,
		height: 300,
	},
	showZoomer: true,
	enforceBoundary: true,
	 boundary: { width: 400, height: 400 },
	enableExif: true
});
$('#cropImagePop').on('shown.bs.modal', function(){
	// alert('Shown pop');
	$uploadCrop.croppie('bind', {
		url: rawImg
	}).then(function(){
		console.log('jQuery bind complete');
	});
});

$('.item-img').on('change', function () { imageId = $(this).data('id'); tempFilename = $(this).val();
																				 $('#cancelCropBtn').data('id', imageId); readFile(this); });
$('#cropImageBtn').on('click', function (ev) {
	$uploadCrop.croppie('result', {
		type: 'base64',
		format: 'png',
		size: {width: 300, height: 300}
	}).then(function (resp) {
		$('.gambar').attr('src', resp);
		$("#croppedprofileimage").attr('value',resp);
		$('#cropImagePop').modal('hide');
	});
});
// End upload preview image
</script>
</body>
</html>