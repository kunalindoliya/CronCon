<%@page import="croncon.bean.ProfileBean"%>
<%@page import="java.util.List"%>
<%@page import="croncon.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<style>
.content-wrapper{
margin-top:40px;
}
.dropdown-item:hover{
background-color:#007bff;
}
.borderless td, .borderless th {
    border: none;    
}
td{
font-size: 14px;
}
.li{
text-align: center
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
		<div class="row">
		<%List<ProfileBean> result=c1.displayProfile(user.getEmp_id()); 
					   ProfileBean profile=(ProfileBean)result.get(0);
					  %>
			<section class="content col-md-4">
				<div class="container-fluid">			 
					  <div class="card">
					   <div class="card-body">
					   <%if(profile.getImage()!=null){ %>
						<img src="../profilepictures/<%=profile.getImage()%>" class="img-responsive" style="object-fit:cover"  height="300px">
						<%} else{ %>
						<img src="../../assets/dist/img/avatar5.png" class="img-responsive" style="object-fit:cover" width="100%" height="250px">
						<%} %>
						<a href="updateprofile.jsp" class="btn btn-success btn-block" style="margin-top:5px;"><i class="fa fa-pencil"></i> Edit</a>
					  </div>
					  
					  	<div class="card-body">
					  	  <span class="card-title"><strong>Contact</strong></span><br>
					  	  <table class="table borderless">
					  	  	<tbody>
					  	  		<tr>
					  	  		<td><i class="fa fa-phone"></i></td>
					  	  		<%if(profile.getMobile_phone()!=null){ %>
					  	  		<td><%=profile.getMobile_phone() %></td>
					  	  		<%} else{ %>
					  	  		<td></td>
					  	  		<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  		<td><i class="fa fa-envelope"></i></td>
					  	  		<td><a href="mailto:<%=profile.getEmail()%>"><%=profile.getEmail() %></a></td>
					  	  		</tr>
					  	  		<tr>
					  	  		<td><i class="fa fa-map-marker"></i></td>
					  	  		<%if(profile.getAddress()!=null){ %>
					  	  		<td><%=profile.getAddress() %></td>
					  	  		<%}else{ %>
					  	  		<td></td>
					  	  		<%} %>
					  	  		</tr>
					  	  	</tbody>
					  	  </table>
					  	</div>
					  </div>
				</div>
			</section>
			<section class="content col-md-8">
				<div class="container-fluid">
					 <!-- Custom Tabs -->
            <div class="card">
              <div class="card-header">
                <ul class="nav nav-pills">
                  <li class="nav-item" style="width:50%" ><a  class="nav-link active li" href="#tab1" data-toggle="tab">ABOUT</a></li>
                  <li class="nav-item" style="width:50%" ><a  class="nav-link li" href="#tab_2" data-toggle="tab">APPRECIATION</a></li>               
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                   <div class="tab-pane active col-md-7" id="tab1">
                    	<span class="card-title"><i class="fa fa-user"></i><strong style="margin-left:20px">Basic Information</strong></span><br>
					  	  <table class="table borderless">
					  	  	<tbody>
					  	  		<tr>
					  	  			<td>Full Name</td>
					  	  			<td><%=profile.getFirst_name()+" "+profile.getLast_name() %></td>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Employee ID</td>
					  	  			<td><%=profile.getEmp_id() %></td>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Email</td>
					  	  			<td><a href="mailto:<%=profile.getEmail()%>"><%=profile.getEmail() %></a></td>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Gender</td>
					  	  			<td><%=profile.getGender() %></td>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Birthday</td>
					  	  			<%if(profile.getBirthday()!=null){ %>
					  	  			<td><%=profile.getBirthday() %></td>
					  	  			<%} else{ %>
					  	  			<td></td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Martial Status</td>
					  	  			<%if(profile.getMartial_status()!=null){ %>
					  	  			<td><%=profile.getMartial_status() %></td>
					  	  			<%} else{ %>
					  	  			<td></td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  		<td>Status</td>
					  	  		<%if(user.getStatus().equals("1")) {%>				  	  			
					  	  			<td ><button class="btn btn-sm" disabled style="color:white;background-color: green"><i class="fa fa-check"></i> Active</button></td>
					  	  		<%} else{ %>
					  	  		  <td ><button class="btn btn-danger btn-sm"><i class="fa fa-cross"></i> Not Active</button></td>
					  	  		<%} %>
					  	  		</tr>
					  	  	</tbody>
					  	  </table>
					  	  	<span class="card-title"><i class="fa fa-institution"></i><strong style="margin-left:20px">Company Relations</strong></span><br>
					  	  	<table class="table borderless">
					  	  	<tbody>
					  	  		<tr>
					  	  			<td>Department</td>
					  	  			<%if(profile.getDepartment()!=null){ %>
					  	  			<td><%=profile.getDepartment() %></td>
					  	  			<%}else{ %>
					  	  			<td>-</td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Designation</td>
					  	  			<%if(profile.getDesignation()!=null){ %>
					  	  			<td><%=profile.getDesignation() %></td>
					  	  			<%}else{ %>
					  	  			<td>-</td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Location</td>
					  	  			<%if(profile.getLocation()!=null){ %>
					  	  			<td><%=profile.getLocation() %></td>
					  	  			<%}else{ %>
					  	  			<td>-</td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Manager</td>
					  	  			<td><button class="btn btn-sm" disabled style="color:white;background-color: grey">No</button></td>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Reports To</td>
					  	  			<%if(profile.getReports_to()!=null){ %>
					  	  			<td><%=profile.getReports_to() %></td>
					  	  			<%}else{ %>
					  	  			<td>-</td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Joining Date</td>
					  	  			<%if(profile.getJoining_date()!=null){ %>
					  	  			<td><%=profile.getJoining_date() %></td>
					  	  			<%}else{ %>
					  	  			<td>-</td>
					  	  			<%} %>
					  	  		</tr>
					  	  		</tbody>				  	  		
					  	  	</table>
					  	  	<span class="card-title"><i class="fa fa-phone"></i><strong style="margin-left:20px">Contact Information</strong></span><br>
					  	  	<table class="table borderless">
					  	  	 <tbody>
					  	  		<tr>
					  	  			<td>Mobile Phone</td>
					  	  			<%if(profile.getMobile_phone()!=null){ %>
					  	  			<td><%=profile.getMobile_phone() %></td>
					  	  			<%} else{ %>
					  	  			<td></td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Emergency Contact Number</td>
					  	  			<%if(profile.getEmergency_contact()!=null){ %>
					  	  			<td><%=profile.getEmergency_contact() %></td>
					  	  			<%} else{ %>
					  	  			<td></td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Emergency Contact Person</td>
					  	  			<%if(profile.getEmergency_person()!=null){ %>
					  	  			<td><%=profile.getEmergency_person() %></td>
					  	  			<%} else{ %>
					  	  			<td></td>
					  	  			<%} %>
					  	  		</tr>
					  	  		<tr>
					  	  			<td>Address</td>
					  	  			<%if(profile.getAddress()!=null){ %>
					  	  			<td><%=profile.getAddress() %></td>
					  	  			<%} else{ %>
					  	  			<td></td>
					  	  			<%} %>
					  	  		</tr>
					  	  		</tbody>
					  	  	</table>            
                   </div>  <!-- /.tab-pane -->
                    <div class="tab-pane" id="tab_2" style="height:435px" >
                   <p> Hello </p>
                  </div>
                  <!-- /.tab-pane -->
              </div> <!-- /.tab-content -->           
            </div> <!-- /.card-body -->                  
            </div><!-- ./card -->
              </div>
			</section>
		</div> <!-- End row -->
	</div> <!-- End content wrapper -->
	<jsp:include page="include/footer.jsp"></jsp:include>
</div>

<jsp:include page="include/js.jsp"></jsp:include>
<script type="text/javascript">
$(function () {
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
            $("#img").show();
        }
    });
});

function imageIsLoaded(e) {
    $('#myImg').attr('src', e.target.result);
    $('#yourImage').attr('src', e.target.result);
};

$(function(){
	$("#profile").addClass("active");
});
</script>
<%if(session.getAttribute("message")!=null){ %>
<script>
$.notify({
	// options
	icon: 'fa fa-check',
	message: '<b>Employee updated successfully!</b>'
},{
	// settings
	
	type: "success",
	delay: 2000,
	animate: {
		enter: 'animated bounceInDown',
		exit: 'animated bounceOutUp'
	},
});

</script>
<%}session.removeAttribute("message"); %>
</body>
</html>