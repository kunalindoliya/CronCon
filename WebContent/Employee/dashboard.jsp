<%@page import="croncon.operation.Comment"%>
<%@page import="croncon.bean.ProfileBean"%>
<%@page import="croncon.bean.CommentBean"%>
<%@page import="croncon.bean.FeedBean"%>
<%@page import="java.util.List"%>
<%@page import="croncon.bean.AttendanceBean"%>
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
<title><%=user.getFirst_name()+" "+user.getLast_name() %> | CronCon</title>
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
<%List<ProfileBean> list=c4.displayProfile(user.getEmp_id());
ProfileBean profile=list.get(0); %>
    <!-- Main content -->
    <div class="row">
     <section class="content col-md-8">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <!-- Update Status -->
         <div class="card direct-chat direct-chat-warning">
                  <div class="card-header">
                  <div class="user-block">
                  <%if(profile.getImage()!=null){ %>
                  <img class="img-circle" src="../profilepictures/<%=profile.getImage()%>" alt="User Image">
                  <%}else { %>
                  <img class="img-circle" src="https://user.gadjian.com/static/images/personnel_boy.png" alt="User Image">
                  <%} %>
                  <span class="username"><a href="profile.jsp"><%=user.getFirst_name()+" "+user.getLast_name()%></a></span>               
                  </div>
                  </div>
                  <div class="card-footer">                 
                    <div  style="display:none" id="img">
                    	<img class="img-responsive" src="#" id="myImg" style="object-fit:contain" width="100%" height="400px"> 
                    </div>                    
                    <form action="feed" method="post" enctype="multipart/form-data" style="padding-top:10px">
                      <div class="input-group">
                        <input type="text" name="status" placeholder="Update your status..." class="form-control" style="width:80%">
                      
                         <!-- attach file button -->
                        <label class="btn-lg btn-default form-control" id="upload-file" title="attach file" for="inputImage">
    					<input type="file" id="inputImage" class="hide " name="photo" >
   						<i class="fa fa-file" aria-hidden="true" ></i>
						</label>                                                              
                        <span  class="input-group-append">
                          <button type="submit" class="btn btn-warning">Send</button>
                        </span>
                      </div>
                    </form>
                      </div>
                    </div>
       <!-- News Feeds -->        
        
        <% 
        //response.setIntHeader("Refresh", 25);
        List<FeedBean> result=c1.displayfeed();
        
        
                        		 for(FeedBean feed:result)
                                 {     //formatting time 
                              	   Time t=feed.getTime();
                              	   String time= t.toString();
                              	   String Time=time.substring(0,5);
                              	   /*formatting day
                              	   String d=rs.getString("day");
                              	   String day="";
                              	   Date date=Calendar.getInstance().getTime();
                              	   
                              	   if(d.equals(new SimpleDateFormat("EEEE").format(date.getTime())))
                              		    day="Today"; */
                              %>
                              
                                  <!-- Box Comment -->
                                  <div class="card card-widget">
                                    <div class="card-header">
                                      <div class="user-block">
                                        <img class="img-circle" src="../profilepictures/<%=feed.getImage()%>" alt="User Image">
                                        <span class="username"><a href="#"><%=feed.getName() %></a></span>
                                        <span class="description">Shared publicly - <%=Time %>  <%=feed.getDay() %></span>
                                      </div>
                    
                                    <!-- /.card-header -->
                                    
                                    <div class="card-body">
                                    <% if(feed.getPhoto()!=null){ %>
                                      <img class="img-responsive" src="../feeds/<%=feed.getPhoto() %>" style="object-fit:contain" width="100%" height="400px" alt="Photo">
                                   <%} if(feed.getStatus()!=null){ %>
                                      <p style="margin-left:30px;margin-top:10px"><b><%=feed.getStatus() %></b></p>
                                      <%} %>
                                    </div>
                                    <!-- /.card-body -->
                                    <%  List<CommentBean> result1=c2.displaycomment(feed.getId());
                                        for(CommentBean cmnt:result1)
                                        {  Time t1=cmnt.getTime();
                                 	         String time1= t1.toString();
                                 	        String Time1=time1.substring(0,5);              
                                    %>
                                    <div class="card-footer card-comments">
                                      <div class="card-comment">
                                        <!-- User image -->
                                        <%if(cmnt.getImage()!=null){ %>
                                        <img class="img-circle img-sm" src="../profilepictures/<%=cmnt.getImage()%>" alt="User Image">
										<%}else { %>
										 <img class="img-circle img-sm" src="https://user.gadjian.com/static/images/personnel_boy.png" alt="User Image">
										 <%} %>
                                        <div class="comment-text">
                                          <span class="username">
                                             <%=cmnt.getName() %>
                                            <span class="text-muted float-right"><%=Time1 %>  <%=cmnt.getDay() %></span>
                                          </span><!-- /.username -->
                                         <%=cmnt.getComment() %>
                                        </div>
                                        <!-- /.comment-text -->
                                      </div>
                                      <!-- /.card-comment -->
                                    </div>
                                    <%} %>
                                    <!-- /.card-footer -->
                                    <div class="card-footer">
                                      <form action="comment" method="post">
                                       <%if(profile.getImage()!=null){ %>
                                        <img class="img-fluid img-circle img-sm" src="../profilepictures/<%=profile.getImage()%>" alt="Alt Text">
                                        <%} else{ %>
                                        <img class="img-fluid img-circle img-sm" src="https://user.gadjian.com/static/images/personnel_boy.png" alt="Alt Text">
                                        <%} %>
                                        <!-- .img-push is used to add margin to elements next to floating images -->
                                        <!-- Id of comment -->
                                        <input type="text" name="feed_id" hidden value="<%=feed.getId()%>">
                                        <div class="img-push">
                                          <input type="text" name="comment" class="form-control form-control-sm" placeholder="Press enter to post comment">
                                        </div>
                                        <span style= margin-left:10px class="input-group-append">
                                            <button type="submit" class="btn btn-warning" style="display:none">Send</button>
                                        </span>                
                                      </form>
                                    </div>
                                    <!-- /.card-footer -->
                                  </div>
                                  <!-- /.card --> 
                                   </div>
                                <%} %>    						
    			  </div> <!-- /.container-fluid -->
       </section> 
    <section class="content col-md-4" >
     	   <div class="container-fluid">
					<div class="card card-info">
						<div class="card-header">
							<i class="fa fa-clock-o"></i> <span class="card-title">Today's
								Attendance</span>
						</div>
						<div class="card-body">
							<div>
								<strong>Current IP Address:</strong> <span id=""><%=session.getAttribute("ip") %></span>
							</div>
							<div>
								<strong>Current Time:</strong> <span id=time></span>
							</div>
							<div>
							 <form action="attendance" method="post" id="form">                   
							    <input style="display:none" name="emp_id" value="<%=user.getEmp_id()%>">
							    <input style="display:none" name="emp_name" value="<%=user.getFirst_name()+" "+user.getLast_name() %>">
							    <%List<AttendanceBean> rs=c3.checkAttendanceStatus(user.getEmp_id());
							       if(rs.isEmpty()){
							    %>
							    <input style="display:none" name="status" value="0">
								<span><button type="submit"  class="btn btn-primary btn-sm"  name="clock-in">Clock
										In</button>
								</span> 
								<span><button class="btn btn-primary btn-sm" disabled name="clock-out">Clock
										Out</button>
							   </span>
							   <%} else{							   
								   AttendanceBean attendance=(AttendanceBean)rs.get(0);						       
							       if(attendance.getStatus().equals("1")){ %>
							     <input style="display:none" name="status" value="<%=attendance.getStatus() %>">
							   <span><button type="submit"  class="btn btn-success btn-sm" disabled name="clock-in">Clocked
										In: <%=attendance.getClock_in_time() %></button>
								</span> 
								<span><button type="submit" class="btn btn-primary btn-sm" onclick=" return modal()"  name="clock-out">Clock
										Out</button>
							   </span>
							   <%} else if(attendance.getStatus().equals("0")){ %>
							   <span><button type="submit"  class="btn btn-success btn-sm" disabled name="clock-in">Clocked
										In: <%=attendance.getClock_in_time() %></button>
								</span> 
								<span><button type="submit" class="btn btn-danger btn-sm" disabled  name="clock-out">Clocked
										Out: <%=attendance.getClock_out_time() %></button>
							   </span>
							   <%}
							       }%>
							  </form>
							</div>
						</div>
					</div>
					<div class="card card-success">
					    <div class="card-header">
							<i class="fa fa-birthday-cake"></i> <span class="card-title">Upcoming
								Birthday's</span>						
						</div>
						<div class="card-body" style="height:300px">
						 
						</div>
					</div>
					<div class="card card-danger">
					    <div class="card-header">
							<i class="fa fa-star"></i> <span class="card-title">Appreciations</span>						
						</div>
						<div class="card-body" style="height:300px">
						 
						</div>
					</div>
			</div>
    </section> 
    </div> <!-- End of section row -->
    
	</div> <!-- end of content-wrapper -->
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
};

$(function(){
	$("#dashboard").addClass("active");
});

var myVar=setInterval(function () {myTimer()}, 1000);
function myTimer() {
    var date = new Date();
    document.getElementById("time").innerHTML = date.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric',second:'numeric', hour12: true });
}

function modal(){
	var date = new Date()
	 var hour=date.getHours();
	 
	 if(hour>"9" &&hour<"18"){
	bootbox.confirm({ 
		  title: 'Are you sure?',
		  message: "<img class='img-responsive' style=' display:block;margin-left:auto;margin-right:auto;' src='../assets/dist/img/alert.png' width='70px' height='70px'><p style='text-align:center'>You are leaving before the office hour<p>", 
		  closeButton: false,
		  buttons:{
		        confirm: {
		            label: '<i class="fa fa-check"></i> Clock Out',
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
	 else{
		 return true;
	 }
	 
}
</script>
</body>
</html>