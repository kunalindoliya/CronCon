<%@page import="croncon.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
 UserBean user=(UserBean)session.getAttribute("currentsessionuser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=user.getFirst_name().toUpperCase()+" "+user.getLast_name().toUpperCase() %> | CronCon</title>
<jsp:include page="include/css.jsp"></jsp:include>
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
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
				</div>
			</div>
			<div class="container-fluid">
			<div class="row" style="margin-bottom:10px">
			  <div class="input-group col-md-3">
			   <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fa fa-calendar"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control float-right" id="reservation">
               </div>
               </div>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-12">
					<div class="info-box" style="background-color:#1e90ff">
						<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Days</span> <span
								class="info-box-number">41,410</span>
						</div> <!-- /.info-box-content -->						
					</div> <!-- /.info-box -->					
				</div><!-- /.col -->	
				<div class="col-md-3 col-sm-6 col-12">
					<div class="info-box" style="background-color: #27ae60">
						<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Total Office</span> <span
								class="info-box-number">41,410</span>
						</div> <!-- /.info-box-content -->						
					</div> <!-- /.info-box -->					
				</div><!-- /.col -->	
				<div class="col-md-3 col-sm-6 col-12">
					<div class="info-box" style="background-color:#e74c3c">
						<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Total Worked</span> <span
								class="info-box-number">41,410</span>
						</div> <!-- /.info-box-content -->						
					</div> <!-- /.info-box -->					
				</div><!-- /.col -->
				<div class="col-md-3 col-sm-6 col-12">
					<div class="info-box bg-warning">
						<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Late</span> <span
								class="info-box-number">41,410</span>
						</div> <!-- /.info-box-content -->						
					</div> <!-- /.info-box -->					
				</div><!-- /.col -->		
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-12">
					<div class="info-box" style="background-color: #e67e22">
						<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Absent</span> <span
								class="info-box-number">41,410</span>
						</div> <!-- /.info-box-content -->						
					</div> <!-- /.info-box -->					
				</div><!-- /.col -->
				<div class="col-md-3 col-sm-6 col-12">
					<div class="info-box" style="background-color:#16a085">
						<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Half Days</span> <span
								class="info-box-number">41,410</span>
						</div> <!-- /.info-box-content -->						
					</div> <!-- /.info-box -->					
				</div><!-- /.col -->			
			</div>
			<div class="table-responsive">
			<table class="table">
          	<thead>
          	   <tr>
          		<th>Date</th>
          		<th>Status</th>
          		<th>Clock In</th>
          		<th>Clock Out</th>
          		<th>Clocked Time</th>
          		<th>Other Details</th>
          		</tr>
          	</thead>
          	<tbody>
          	</tbody>
          </table>
          </div>
          </div>
		</div>
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="include/js.jsp"></jsp:include>
<script>
  $(function () {

    //Date range picker
    $('#reservation').daterangepicker({
    	
    	ranges   : {
            'Today'       : [moment(), moment()],
            'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month'  : [moment().startOf('month'), moment().endOf('month')],
            'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
    })
  
  })
</script>
<script>
	$(function() {
		$("#attendance").addClass("active");
	});
</script>
</body>
</html>