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
					
				  <section class="content">
				  
				  <div class="row">
				  
					<div class="form-group col-md-4">
						<button class="btn btn-success btn-sm" data-toggle="modal"
							data-target="#myModal">
							<i class="fa fa-plus"></i> New
						</button>
					</div>
					
					<div class="form-group  col-md-3">
						<input class="form-control" placeholder="search...">
					</div>
					<div class="col-md-2"></div>
					<div class="form-group form-inline col-md-3">
						<label>Status:</label> 
						<select class="form-control">
							<option value="all">All</option>
							<option value="pending">Pending</option>
							<option value="accepted">Accepted</option>
							<option value="rejected">Rejected</option>
						</select> 
						<img src="https://png.icons8.com/ios/50/000000/menu-2-filled.png"
							height=30px  data-toggle="dropdown">

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
					<div class="modal-dialog modal-lg">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header bg-warning">
								<h4 class="modal-title">New Claim</h4>
							</div>
							<div class="modal-body">
								<div class="card card-info">
									<div class="card-header">
									<span class="card-title"><i class="fa fa-info-circle"></i>
												Description</span><br>
									</div>	
									<div class="card-body">
										<div class="row">
										<div class="col-md-6">
											<div class="form-group">
											<label>Title</label> <input type="text"
												name="claim_title" class="form-control">
											</div>									
										</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Category</label> <select
												name="claim_category" class="form-control">
												<option>Select an Option &#10004;</option>
												<option value="utilities">Utilities</option>
												<option value="insurance">Insurance</option>
												<option value="fees">Fees</option>
												<option value="wages">Wages</option>
												<option value="taxes">Taxes</option>
												<option value="interest">Interest</option>
												<option value="supplies">Supplies</option>
												<option value="maintenance">Maintenance</option>
												<option value="travel">Travel</option>
												<option value="means and entertainment">Means and Entertainment</option>
												<option value="training">Training</option>
											</select>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Description</label>
											<textarea rows="3" cols="3" class="form-control"></textarea>
										</div>
									</div>
								</div>
									</div>							
								</div>
								<div class="card card-danger">
								   <div class="card-header">
									<span class="card-title"><i class="fa fa-usd"></i>
												Expense Details</span><br>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Amount</label>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">&#8377;</span>
													</div>
													<input type="text" name="claim_amount" class="form-control">
												</div>
											</div>
											<div class="form-group">
											 <label>Receipt</label>
											 <input class="form-control" name="claim_receipt" type="file">
											</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Bill Date</label>
												 	<input name="bill_date" class="form-control" type="date">
											</div>
											<div class="form-group">
											 <label>Payment Method</label>
											 <input class="form-control" name="payment_method" type="text">
											</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Merchant</label>
													<input type="text" class="form-control" name="merchant">
												</div>
											</div>
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
		$("#claims").addClass("active");
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