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
<title>Create Employee | CronCon</title>
<jsp:include page="include/css.jsp"></jsp:include>
<link rel="stylesheet" href="../assets/dist/css/custom.css">
<style>
.content-wrapper {
	margin-top: 40px;
}

.dropdown-item:hover {
	background-color: #007bff;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper" >
		<jsp:include page="include/header.jsp"></jsp:include>
		<jsp:include page="include/sidebar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
				</div>
			</div>
			<form action="create" method="post">
			<section class="content">
			<div class="row">
			<section class="content col-md-12">
			<div class="container-fluid">	 		 	
					<div class="form-group form-inline pull-left">
						<a href="employees.jsp" class="btn btn-success"><i
							class="fa fa-caret-left"></i> Back</a>
					</div>			
					<div class="form-group form-inline pull-right">
						<button type="submit" class="btn btn-info" style="margin-right:5px;"><i
							class="fa fa-check"></i> Create</button>
						<a href="employees.jsp"class="btn btn-danger"><i
							class="fa fa-times"></i> Cancel</a>
					</div>
			 </div>				
			</section>
			</div>
			</section>
			<section class="content">
			<div class="container-fluid">
			
				<div class="row">
					<div class="col-md-8">
						<div class="card card-primary">
							<div class="card-header">
								<span class="card-title"><i class="fa fa-info-circle"></i>
									Basic Info</span><br>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>First Name</label> <input type="text"
												name="first_name" class="form-control" required>
										</div>
										<div class="form-group">
											<label>Email</label> <input type="text" name="email"
												class="form-control" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Last Name</label> <input type="text" name="last_name"
												class="form-control" required>
										</div>
										<div class="form-group">
											<label>Gender</label> <select class="form-control"
												name="gender">
												<option value="">--Select an option--</option>
												<option value="Male" selected>Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>Employee ID</label> <input type="text" name="emp_id"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Date of Birth</label> <input type="date" name="dob"
										class="form-control" required>
								</div>
								<div class="row">
									<div class="form-group col-md-3">
										<label>Allow Login</label><br> <input type="checkbox"
											name="allow_login" data-toggle="toggle" data-on="Yes"
											data-off="No" checked>
									</div>
									<div class="form-group col-md-9">
										<label>Password</label> <input type="text" name="password"
											class="form-control" required>
									</div>
								</div>
							</div>
							<!-- /card-body -->
						</div>
						<!-- /card -->
					</div>
					<div class=col-md-4>
						<div class="card card-warning">
							<div class="card-header">
								<span class="card-title"><i class="fa fa-camera"></i>
									Photo</span><br>
							</div>

							<input type="hidden" value="" name="croppedprofileimage"
								id="croppedprofileimage">
							<div class="card-body">
								<img class="img-responsive gambar"
									src="../assets/dist/img/avatar5.png"
									width="250px" height="300px" style="object-fit: cover;">
								<div class="upload-btn-wrapper">
									<button class="upload-btn">Select File</button>
									<input type="file" class="item-img" />
								</div>
							</div>
							<!-- crop modal -->
							<div class="modal fade" id="cropImagePop" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">Crop Image</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div id="upload-demo" class="center-block"></div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="button" id="cropImageBtn"
												class="btn btn-primary">Crop</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			</section>
       </form>
		</div>
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="include/js.jsp"></jsp:include>
	<script type="text/javascript">
$(function(){
	$("#employees").addClass("active");
});

var $uploadCrop,
tempFilename,
rawImg,
imageId;
function readFile(input) {
		if (input.files && input.files[0]) {
      var reader = new FileReader();
        reader.onload = function (e) {
			$('.upload-demo').addClass('ready');
			$('#cropImagePop').modal('show');
            rawImg = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    }
    else {
        swal("Sorry - you're browser doesn't support the FileReader API");
    }
}

$uploadCrop = $('#upload-demo').croppie({
	viewport: {
		width: 300,
		height: 300,
	},
	showZoomer: true,
	enforceBoundary: true,
	 boundary: { width: 400, height: 400 },
	enableExif: true
});
$('#cropImagePop').on('shown.bs.modal', function(){
	// alert('Shown pop');
	$uploadCrop.croppie('bind', {
		url: rawImg
	}).then(function(){
		console.log('jQuery bind complete');
	});
});

$('.item-img').on('change', function () { imageId = $(this).data('id'); tempFilename = $(this).val();
																				 $('#cancelCropBtn').data('id', imageId); readFile(this); });
$('#cropImageBtn').on('click', function (ev) {
	$uploadCrop.croppie('result', {
		type: 'base64',
		format: 'png',
		size: {width: 300, height: 300}
	}).then(function (resp) {
		$('.gambar').attr('src', resp);
		$("#croppedprofileimage").attr('value',resp);
		$('#cropImagePop').modal('hide');
	});
});
// End upload preview image
</script>
</body>
</html>