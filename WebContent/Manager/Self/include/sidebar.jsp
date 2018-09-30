
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="index3.html" class="brand-link"> <img
		src="../../assets/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">CronCon</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar Menu -->
		<nav class="mt-2">

			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<ul class="nav nav-pills">
					<li class="nav-item has-treeview" style="width: 50%"><a
						class="nav-link active" href="#tab_1" data-toggle="tab"><i
							class="fa fa-user"></i> Self</a></li>
					<li class="nav-item has-treeview" style="width: 50%"><a
						class="nav-link" href="../dashboard.jsp"><i
							class="fa fa-user-secret"></i> Manager</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<ul class="nav nav-pills nav-sidebar flex-column"
							data-widget="treeview" role="menu" data-accordion="false">
							<li class="nav-item has-treeview"><a id="dashboard"
								href="dashboard.jsp" class="nav-link"> <i
									class="nav-icon fa fa-home"></i>
									<p>Dashboard</p>
							</a></li>
							<li class="nav-item has-treeview"><a id="profile"
								href="profile.jsp" class="nav-link"> <i
									class="nav-icon fa fa-user"></i>
									<p>My Profile</p>
							</a></li>
							<li class="nav-item has-treeview"><a id="team"
								href="team.jsp" class="nav-link"> <i
									class="nav-icon fa fa-users"></i>
									<p>Team</p>
							</a></li>
							<li class="nav-item has-treeview"><a id="payroll"
								href="payroll.jsp" class="nav-link"> <i
									class="nav-icon fa fa-money"></i>
									<p>Payroll</p>
							</a></li>
							<li class="nav-item has-treeview"><a id="attendance"
								href="attendance.jsp" class="nav-link"> <i
									class="nav-icon fa fa-clock-o"></i>
									<p>Attendance</p>
							</a></li>
							<li id="leaves" class="nav-item has-treeview"><a id=""
								href="#" class="nav-link"> <i class="nav-icon fa fa-rocket"></i>
									<p>
										Leaves <i class="right fa fa-angle-left"></i>
									</p>
							</a>
								<ul class="nav nav-treeview">
									<li class="nav-item"><a href="applications.jsp"
										id="applications" class="nav-link"> <i
											class="fa fa-circle-o nav-icon"></i>
											<p>Applications</p>
									</a></li>
									<li class="nav-item"><a href="leaves_remaining.jsp"
										id="leavesremaining" class="nav-link"> <i
											class="fa fa-circle-o nav-icon"></i>
											<p>Leaves Remaining</p>
									</a></li>
									<li class="nav-item"><a href="unpaid_leaves.jsp"
										id="unpaidleaves" class="nav-link"> <i
											class="fa fa-circle-o nav-icon"></i>
											<p>Unpaid Leaves</p>
									</a></li>
								</ul></li>
							<li class="nav-item has-treeview"><a id="claims"
								href="claims.jsp" class="nav-link"> <i
									class="nav-icon fa fa-credit-card-alt"></i>
									<p>Expense Claims</p>
							</a></li>
						</ul>
					</div>
					<!-- /tab pane -->
					
				</div>
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
