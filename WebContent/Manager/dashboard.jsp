<%@page import="croncon.operation.Comment"%>
<%@page import="croncon.bean.ProfileBean"%>
<%@page import="croncon.bean.CommentBean"%>
<%@page import="croncon.bean.FeedBean"%>
<%@page import="java.util.List"%>
<%@page import="croncon.bean.AttendanceBean"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="croncon.bean.UserBean"%>
<%@page import="croncon.bean.UserBean" 
  import="java.sql.*"
  import="java.util.*"
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%
 UserBean user=(UserBean)session.getAttribute("currentsessionuser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard | CronCon</title>
<jsp:include page="include/css.jsp"></jsp:include>

<style>
.content-wrapper{
margin-top:40px;
}
.dropdown-item:hover{
background-color:#007bff;
}
.li{
text-align: center
}
</style>
</head>
<jsp:useBean id="c1" class="croncon.operation.Feed"></jsp:useBean>
<jsp:useBean id="c2" class="croncon.operation.Comment"></jsp:useBean>
<jsp:useBean id="c3" class="croncon.operation.MyFunction"></jsp:useBean>
<jsp:useBean id="c4" class="croncon.operation.Profile"></jsp:useBean>
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

    <!-- Main content -->

			<section class="content">
			<div class="container-fluid">
			 	<div class="row">
			 		<div class="col-md-3 col-sm-6 col-12">
					<div class="info-box bg-danger" >
						<span class="info-box-icon"><i class="fa fa-group"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Active Employees</span> <span
								class="info-box-number">41,410</span>
						</div> <!-- /.info-box-content -->						
					</div> <!-- /.info-box -->					
				</div><!-- /.col -->
			 	</div>
			 	<div class="row">
			 		<div class="col-md-6">
			 	 <div class="card card-info">
              <div class="card-header" style="background-color:#3867d6">
              <span class="card-title"><i class="fa fa-bell"></i>
												Pending Approvals</span>
              </div><!-- /.card-header -->
              <div class="card-body">
              		<ul class="nav nav-pills">
                  <li class="nav-item col-md-6"><a  class="nav-link active li" href="#tab1" data-toggle="tab"><i class="fa fa-rocket"></i> LEAVES</a></li>
                  <li class="nav-item col-md-6"><a  class="nav-link li" href="#tab2" data-toggle="tab"><i class="fa fa-credit-card"></i> EXPENSES</a></li>               
                </ul>
                 <div class="card-body">
                 	  <div class="tab-content">
                   <div class="tab-pane active " id="tab1" style="height:350px">
					  <p>Hi</p>
                   </div>  <!-- /.tab-pane -->
                    <div class="tab-pane" id="tab2" style="height:350px">
                   <p> Hello </p>
                  </div>
                  <!-- /.tab-pane -->
              </div> <!-- /.tab-content --> 
                 </div>
                        
            </div> <!-- /.card-body -->                  
            </div><!-- ./card -->
			 		</div>
			 		<div class="col-md-6">
			 	 <div class="card card-info">
              <div class="card-header" style="background-color:#3867d6">
              <span class="card-title"><i class="fa fa-clock-o"></i>
												Today's Attendance</span>
              </div><!-- /.card-header -->
              <div class="card-body">
              		<ul class="nav nav-pills">
                  <li class="nav-item col-md-4"  ><a  class="nav-link active li" href="#tab3" data-toggle="tab">NOT MARKED ( )</a></li>
                  <li class="nav-item col-md-4"  ><a  class="nav-link li" href="#tab4" data-toggle="tab">PRESENT ( )</a></li> 
                   <li class="nav-item col-md-4" ><a  class="nav-link li" href="#tab5" data-toggle="tab">ABSENT ( )</a></li>              
                </ul>
                 <div class="card-body">
                 	  <div class="tab-content">
                   <div class="tab-pane active " id="tab3" style="height:350px">
					  <p>Hi</p>
                   </div>  <!-- /.tab-pane -->
                    <div class="tab-pane" id="tab4" style="height:350px">
                   <p> Hello </p>
                  </div>
                   <div class="tab-pane" id="tab5" style="height:350px">
                   <p> There </p>
                  </div>
                  <!-- /.tab-pane -->
              </div> <!-- /.tab-content --> 
                 </div>
                        
            </div> <!-- /.card-body -->                  
            </div><!-- ./card -->
			 		</div>
			 	</div>
			</div>
			<!-- /.container-fluid --> 
			</section>



		</div> <!-- end of content-wrapper -->
	<jsp:include page="include/footer.jsp"></jsp:include>
</div>

<jsp:include page="include/js.jsp"></jsp:include>
<script>
$(function() {
	$("#dashboard").addClass("active");
});
</script>
</body>
</html>