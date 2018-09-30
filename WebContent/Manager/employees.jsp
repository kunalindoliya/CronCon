<%@page import="java.util.Iterator"%>
<%@page import="croncon.bean.ProfileBean"%>
<%@page import="java.util.List"%>
<%@page import="croncon.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
  <%
 UserBean user=(UserBean)session.getAttribute("currentsessionuser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employees | CronCon</title>
<jsp:include page="include/css.jsp"></jsp:include>
<link rel="stylesheet" href="../assets/dist/css/custom.css">
<style>
.content-wrapper{
margin-top:40px;
}
.dropdown-item:hover{
background-color:#007bff;
}
td,th{
text-align:center;
}
</style>
</head>
<jsp:useBean id="c1" class="croncon.operation.MyFunction"></jsp:useBean>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<jsp:include page="include/header.jsp"></jsp:include>
		<jsp:include page="include/sidebar.jsp"></jsp:include>
		<form action="deleteemployees" method="post" id="form">
		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
				</div>
			</div>
			<div class="row">		
				  <section class="content col-md-12">
				  <div class="container-fluid">
					<div class="form-group form-inline pull-left">
						<button type="button" class="btn btn-success btn-sm" data-toggle="modal"
							data-target="#myModal">
							<i class="fa fa-envelope"></i> Invite
						</button>
						<a href="create.jsp" style="margin-left:10px" class="btn btn-info btn-sm">
							<i class="fa fa-plus"></i> Create
						</a>
						<a href="create.jsp" style="margin-left:10px;display:none" class="btn btn-warning btn-sm" id="btn_edit">
							<i class="fa fa-pencil"></i> Edit
						</a>
						<button type="submit" style="margin-left:10px;display:none" class="btn btn-danger btn-sm" id="btn_delete" onclick="return delete_emp()" >
							<i class="fa fa-times"></i> Delete
						</button>
					</div>
					
					
					<div class="form-group form-inline pull-right">
						<label>Status:</label> 
						<select class="form-control">
							<option value="all">All</option>
							<option value="active">Active</option>
							<option value="accepted">Inactive</option>
						</select> 
						<img src="https://png.icons8.com/ios/50/000000/menu-2-filled.png"
							height=30px data-toggle="dropdown">

						<div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
							<button type="button"  class="dropdown-item" onclick="hideclick()" id="hide-button"> <i
								class="fa fa-eye-slash mr-2"></i> Hide Details
							</button>
							<button type="button" class="dropdown-item" style="display:none" onclick="showclick()" id="show-button"> <i
								class="fa fa-eye mr-2"></i> Show Details
							</button>
							<!--  <div class="dropdown-divider"></div> -->
							<a href="employees.jsp" class="dropdown-item"> <i
								class="fa fa-refresh mr-2"></i> Refresh
							</a>
							
						</div>
					</div>
					</div>
           	</section>			
				</div>
				
			   <div class="row">
			   <%try{ %>
						<section class="content col-md-8" id="table-section">
						<div class="container-fluid">
				<div class="table-responsive">
					<table id="table" class="table">
						<thead style="background-color: #2980b9">
							<tr>
								<th><input type="checkbox" class="form-control" id="maincheck" onclick="main_check()"></th>
								<th>Employee ID</th>
								<th>Name</th>
								<th>Department</th>
							</tr>
						</thead>					
						<tbody>
						<% List result=c1.listEmployees(); 
						  for(Iterator iterator=result.iterator();iterator.hasNext();){
							  ProfileBean employee=(ProfileBean)iterator.next();		  
						%>
						 <tr>
						 	<td><input type="checkbox" class="form-control check" name="employee_check" onclick="emp_check()" value="<%=employee.getEmp_id()%>"></td>
						 	<td><%=employee.getEmp_id() %></td>
						 	<%if(employee.getImage()!=null){ %>
						 	<td style="display:flex;justify-content:center"><span class="user-panel  d-flex"><span class="image"><img src="../profilepictures/<%=employee.getImage()%>" class="img-circle elevation-2"><span style="margin-left:10px;"><a href="profile.jsp?emp_id=<%=employee.getEmp_id()%>"><%=employee.getFirst_name()+" "+employee.getLast_name()%></a></span></span></span></td>
						 	<%}else{ %>
						 	<td style="display:flex;justify-content:center"><span class="user-panel  d-flex"><span class="image"><img src="../assets/dist/img/avatar5.png" class="img-circle elevation-2"><span style="margin-left:10px;"><a href="profile.jsp?emp_id=<%=employee.getEmp_id()%>"><%=employee.getFirst_name()+" "+employee.getLast_name()%></a></span></span></span></td>
						 	<%} %>
						 	<%if(employee.getDepartment()!=null){ %>
						 	<td><%=employee.getDepartment() %></td>
						 	<%} else{ %>
						 	<td>-</td>
						 	<%} %>
						 </tr>
						 <%} %>
						</tbody>
					</table>
					<%}catch(Exception e){
						e.printStackTrace();
					}%>
				</div>
				</div>
				</section>
				
				<section class="content col-md-4" id="info-section">
					<div class="container-fluid">
						<div class="card card-primary">
							<div class="card-header">
											<span class="card-title"><i class="fa fa-info-circle"></i>
												Details</span><br>
										</div>
							<div class="card-body">
								<p style="text-align:center">Select a row to view it's detail</p>
							</div>
						</div>
					</div>
				
				</section>
				</div>	
		</div>
		</form>
		<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog modal-lg">
						<form action="" method="post">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header bg-info">
								<h4 class="modal-title">Invite Employees</h4>
							</div>
							
							<div class="modal-body">
							<p>Enter employee names and emails to Send Invite. Employees will receive an email to login and update their profile through the self-service portal.</p>
								<div class="row" id="fields">														  
											<div class="col-md-3 form-group">
											  <input type="text" name="first_name" class="form-control field" onkeypress="addfield()"  placeholder="First Name">											
											</div>
											<div class="col-md-3 form-group">												
													 <input type="text"
														name="last_name" class="form-control" placeholder="Last Name">												
											</div>
											<div class="col-md-3 form-group">				
													 <input class="form-control"
														type="email" name="email" placeholder="Email">											
											</div>
											<div class="col-md-1 form-group">									    
									         <button type="button" style="display:"  class="btn btn-danger closebtn" onclick="removefield()"><i class="fa fa-times"></i></button>					
										</div>
									
								</div>							
							<div class="modal-footer">
								<button type="button" class="btn btn-info">Send Invite</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
							</div>
							</div>
							</div>
							</form>					
						</div>
				</div> <!-- end-modal -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
 <jsp:include page="include/js.jsp"></jsp:include>
 <script>
 $(function(){
		$("#employees").addClass("active");
		
	});
 $(document).ready(function() {
	    $('#table').DataTable({
	    	"ordering":false,
	    	"lengthChange": false,
	    });
	});
 </script>
 <script>
 function hideclick(){
	 $("#info-section").hide("fast",function(){
		 $("#table-section").addClass("col-md-12");
	 });
	 $("#hide-button").hide("fast",function(){
		$("#show-button").show(); 
	 });	
 }
 function showclick(){
	 $("#table-section").removeClass("col-md-12",function(){
		 $("#info-section").show();
	 });
	 $("#show-button").hide("fast",function(){
		$("#hide-button").show(); 
	 });
 }
 function addfield() {
	 $(".closebtn").show();
	 $(".field").removeAttr("onkeypress");
	 $("<div class='col-md-11'><div class='row'><div class='col-md-4 form-group'><input type='text'name='first_name' class='form-control field'"+
		"onkeypress='addfield()' placeholder='First Name'></div><div class='col-md-4 form-group'><input type='text'name='last_name' class='form-control' placeholder='Last Name'></div>"+
		"<div class='col-md-4 form-group'> <input class='form-control' type='email' name='email' placeholder='Email'></div></div></div>"+
"<div class='col-md-1'><button type='button' style='display:none' onclick='removefield()' class='btn btn-danger closebtn'><i class='fa fa-times'></i></button></div>").appendTo("#fields");
 }
 function removefield()
 {
	 $(".col-md-1 +.col-md-11").remove();
	 $(this).remove();
 }
 function main_check()
 {
	 var x=$("#maincheck").prop("checked");
	 if(x==true)
		 {
		 $(".check").attr("checked","checked");
		 $("#btn_delete").show();
		 }
	 else
		 {
		 	$(".check").removeAttr("checked");
		    $("#btn_delete").hide();
		 }
	
 }
 function emp_check()
 {
	 var x=$(".check").prop("checked");
	 if(x==true){
		 $("#btn_delete").show();
	 }
	 else{
		 $("#btn_delete").hide();
	 }
 }
 function delete_emp()
 {
	 bootbox.confirm({ 
		  message: "<img class='img-responsive' style=' display:block;margin-left:auto;margin-right:auto;' src='../assets/dist/img/alert.png' width='70px' height='70px'><p style='text-align:center'>Delete?<br>Are you sure, you want to delete selected employee(s)<p>", 
		  closeButton: false,
		  buttons:{
		        confirm: {
		            label: '<i class="fa fa-check"></i> Delete',
		            className: 'btn-success'
		        },
		        cancel: {
		            label: '<i class="fa fa-times"></i> Cancel',
		            className: 'btn-danger'
		        }
		    },
		  callback: function(result){ 
			 if(result){
				 $("#form").submit();
			 }
		  }	    
    	 });
	  return false;
 }
 </script>
</body>
</html>