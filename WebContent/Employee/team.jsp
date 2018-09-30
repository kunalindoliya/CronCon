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
label,select,input{
margin:5px;
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
        		<div class="row mb-2">
        		</div>
     		 </div>
    	</div> 
  			
					<div class="container-fluid">
						<form class="form-inline">
							<div class="form-group">
								<label for="location">Location:</label> <select id="location"
									class="form-control">
									<option>All</option>
									<option>Head Office</option>
									<option>Remote</option>
								</select>
							</div>
							<div class="form-group">
								<label for="department">Department:</label> <select id="location"
									class="form-control">
									<option>All</option>
									<option>Head Office</option>
									<option>Remote</option>
								</select>
							</div>
							<div class="form-group">
								<label for="designation">Designation:</label> <select id="location"
									class="form-control">
									<option>All</option>
									<option>Head Office</option>
									<option>Remote</option>
								</select>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="search name">
							</div>
						</form>
					</div>
    </div>
    <jsp:include page="include/footer.jsp"></jsp:include>
 </div>
 <jsp:include page="include/js.jsp"></jsp:include>
<script>
$(function(){
	$("#team").addClass("active");
});
</script>
</body>
</html>