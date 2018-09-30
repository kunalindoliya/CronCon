<%@page import="croncon.bean.ProfileBean"%>
<%@page import="java.util.List"%>
<%@page import="croncon.bean.UserBean"%>
<jsp:useBean id="c2" class="croncon.operation.Profile"></jsp:useBean>
<%UserBean user=(UserBean)session.getAttribute("currentsessionuser"); 
List<ProfileBean> result=c2.displayProfile(user.getEmp_id()); 
ProfileBean profile=(ProfileBean)result.get(0);
%>
 <!-- Navbar -->
  <nav class="main-header navbar navbar-expand  navbar-light border-bottom bg-white fixed-top">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">     
      <li class="nav-item dropdown">
        <!-- <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-bell-o"></i>
        </a> -->
        <a class="nav-link" href="#" data-toggle="dropdown">
        <span class="user-panel  d-flex">
         <span class="image">
         <%if(profile.getImage()!=null) {%>
          <img src="../../profilepictures/<%=profile.getImage()%>" class="img-circle elevation-2"  alt="User Image">
         <%}else { %>
         <img src="../../assets/dist/img/avatar5.png" class="img-circle elevation-2" style="height:2.2rem"  alt="User Image">
         <%} %>
          <span><%=user.getFirst_name()+" "+user.getLast_name() %></span><i class="fa fa-caret-down"></i>
        </span>
        </span>
        </a>
        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
          <a href="profile.jsp" class="dropdown-item">
            <i class="fa fa-user mr-2"></i> Update Profile
          </a>
         <!--  <div class="dropdown-divider"></div> -->
          <a href="logout" class="dropdown-item">
            <i class="fa fa-lock mr-2"></i> Change Password
          </a>
         <!--  <div class="dropdown-divider"></div> -->
          <a href="logout" class="dropdown-item">
            <i class="fa fa-sign-out mr-2"></i> Logout
          </a>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->