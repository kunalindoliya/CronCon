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
<title>Applications | CronCon</title>
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
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<jsp:include page="include/header.jsp"></jsp:include>
		<jsp:include page="include/sidebar.jsp"></jsp:include>
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
						<button class="btn btn-success btn-sm" data-toggle="modal"
							data-target="#myModal">
							<i class="fa fa-plus"></i> Apply
						</button>
					</div>
					
					
					<div class="form-group form-inline pull-right">
						<label>Status:</label> 
						<select class="form-control">
							<option value="all">All</option>
							<option value="pending">Pending</option>
							<option value="accepted">Accepted</option>
							<option value="rejected">Rejected</option>
						</select> 
						<img src="https://png.icons8.com/ios/50/000000/menu-2-filled.png"
							height=30px data-toggle="dropdown">

						<div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
							<button  class="dropdown-item" onclick="hideclick()" id="hide-button"> <i
								class="fa fa-eye-slash mr-2"></i> Hide Details
							</button>
							<button  class="dropdown-item" style="display:none" onclick="showclick()" id="show-button"> <i
								class="fa fa-eye mr-2"></i> Show Details
							</button>
							<!--  <div class="dropdown-divider"></div> -->
							<button  class="dropdown-item"> <i
								class="fa fa-refresh mr-2"></i> Refresh
							</button>
							
						</div>
					</div>
					</div>
           	</section>
				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header bg-danger">
								<h4 class="modal-title">Apply Leave</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Start Date</label> <input type="date"
												name="start_date" class="form-control">
										</div>
										<div class="form-group">
											<label>Select Application Type</label> <select
												name="application_type" class="form-control">
												<option>Select an Option &#10004;</option>
												<option value="sick">Sick</option>
												<option value="casual">Casual</option>
												<option value="paid">Paid</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>End Date</label> <input type="date" name="end_date"
												class="form-control">
										</div>
										<div class="form-group">
											<label>Half Day</label><br> <input type="checkbox"
												name="half_day" data-toggle="toggle" data-on="Yes"
												data-off="No">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Reason</label>
											<textarea rows="4" cols="4" class="form-control"></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-info">Apply</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
							</div>
						</div>
					</div>
				</div> <!-- end-modal -->
				</div>
			   <div class="row">
						<section class="content col-md-8" id="table-section">
						<div class="container-fluid">
				<div class="table-responsive">
					<table class="table" id="table">
						<thead>
							<tr>
								<th>Leave Type</th>
								<th>Start Date</th>
								<th>Days</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				</div>
				</section>
				<section class="content col-md-4" id="info-section">
					<div class="container-fluid">
						<div class="card card-primary">
							<div class="card-header">
							 <span class="card-title"><i class="fa fa-info-circle"></i>
												Basic Info</span><br>
						     </div>
							<div class="card-body">
								<p>Select a row to view it's detail</p>
							</div>
						</div>
					</div>
				
				</section>
				</div>	
		</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
 <jsp:include page="include/js.jsp"></jsp:include>
 <script>
 $(function(){
		$("#applications").addClass("active");
		$("#leaves").addClass("menu-open");
		$("#leaves>a").addClass("active");
	});
 $(document).ready(function() {
	    $('#table').DataTable({
	        "ordering": false,
	        "info":     false,
	        "searching":false
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
 </script>
</body>
</html>