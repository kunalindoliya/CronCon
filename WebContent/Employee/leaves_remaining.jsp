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
			<div class="container-fluid">
				<div class="form-group form-inline col-md-3">
				<label>year:</label>
				<select name="year" class="form-control">
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018" selected>2018</option>
					<option value="2019">2019</option>
				</select>
			   </div>
				<div class="table-responsive">
					<table class="table" id="table">
						<thead>
							<tr>
								<th>Leave Type</th>
								<th>Leaves Remaining</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Sick</td>
								<td></td>
							</tr>
							<tr>
								<td>Casual</td>
								<td></td>
							</tr>
							<tr>
								<td>Paid</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
 <jsp:include page="include/js.jsp"></jsp:include>
 <script>
 $(function(){
		$("#leavesremaining").addClass("active");
		$("#leaves").addClass("menu-open");
		$("#leaves>a").addClass("active");
	});
 $(document).ready(function() {
	    $('#table').DataTable({
	    	"paging":   false,
	        "ordering": false,
	        "info":     false,
	        "searching":false
	    });
	} );
 </script>
</body>
</html>