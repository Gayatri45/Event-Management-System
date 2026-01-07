<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OneStop | Organizer Profile</title>
<!-- ================= Favicon ================== -->
<!-- Standard -->
<link rel="shortcut icon" href="/images/32x32.png">
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144" href="/images/144x144.png">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114" href="/images/114x114.png">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72" href="/images/72x72.png">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57" href="/images/57x57.png">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<!--<link href="/css/line-awesome/line-awesome.css" rel="stylesheet">-->
<link href="/css/themify-icons.css" rel="stylesheet">
<link href="/css/data-table/buttons.bootstrap.min.css" rel="stylesheet" />
<link href="/css/menubar/sidebar.css?v=1.12" rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/sweetalert/sweetalert.css" rel="stylesheet">
<link href="/css/helper.css" rel="stylesheet">
<link href="/css/style.css?v=1.32" rel="stylesheet">
<link href="/css/core.css?v=1.32" rel="stylesheet">
<link href="/css/bootstrap-imageupload.min.css" rel="stylesheet">
<style>
#sig-canvas {
	border: 2px dotted #CCCCCC;
	border-radius: 15px;
	cursor: crosshair
}
</style>
<%
HashMap userMapData = (HashMap) request.getAttribute("userMap");
%>
</head>

<body>

	<%@include file="sidebar.jsp"%>

	<%@include file="header.jsp" %>
	<!--<script> history.forward();</script>-->

	<div class="content-wrap">
		<div class="main">
			<div class="page-header">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8 m-auto">
							<div class="row d-flex align-items-center">
								<div class="col">
									<div class="page-title">
										<h1>User Profile</h1>
									</div>
								</div>
								<div class="col ml-auto text-right">
									<a href="javascript:void(0)" class="btn btn-success btn-sm"
										data-toggle="modal" data-target="#NewPassword"><i
										class="ti-lock"></i> Change Password</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<section id="main-content">
					<form name="updateProfile" id="updateProfile" class="form-valide"
						method="post">
						<div class="row">
							<div class="col-lg-8 m-auto">
								<div class="card">
									<div class="card-body">
										<ul class="nav nav-tabs customtab" role="tablist">
											<li class="nav-item active"><a class="nav-link"
												data-toggle="tab" href="#account" role="tab"> <span
													class="hidden-sm-up"><i class="ti-email"></i></span> <span
													class="hidden-xs-down">Account</span></a></li>
										</ul>

										<input type="hidden" name="token" value="<%=userMapData.get("token")%>" /> 
										<input type="hidden" name="logedEmail" value="<%=userMapData.get("email")%>" /> 
										<input type="hidden" name="studentId" value="<%=userMapData.get("studentId")%>" /> 
										<input type="hidden" name="userType" value="<%=userMapData.get("userType")%>" /> 
										<input type="hidden" name="roleId" value="<%=userMapData.get("roleId")%>" /> 
										<input type="hidden" name="companyId" value="<%=userMapData.get("companyId")%>" />
										<input type="hidden" name="companyCode" value="<%=userMapData.get("companyCode")%>" /> 
										<input type="hidden" name="userId" value="<%=userMapData.get("userId")%>" />

										<!-- Tab panes -->
										<div class="tab-content mt-3">
											<div class="tab-pane active" id="account" role="tabpanel">
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>First name <span class="requiredFiled">*</span></label>
															<input type="text" id="fname" name="firstName"
																class="form-control"
																value="<%=userMapData.get("firstName")%>">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label>Last Name </label>
															<input type="text" id="lname" class="form-control"
																name="lastName" value="<%=userMapData.get("lastName")%>">
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>Email <span class="requiredFiled">*</span></label>
															<input type="text" id="email" name="email"
																class="form-control" value="<%=userMapData.get("email")%>"
																readonly="" data-toggle="tooltip"
																title="Registered Email Address(login Id) cannot Change.">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label>Mobile No <span class="requiredFiled">*</span></label>
															<div class="d-flex align-items-center position-relative">
																<span class="isdPlus"><strong>+</strong></span> <input
																	type="text" class="form-control" id="isd"
																	style="width: 90px; padding-left: 20px;" name="isdCode"
																	autocomplete="off" maxlength="4" value="91"
																	placeholder="ISD"
																	onkeypress="return isPositiveKey(event)"> <input
																	type="text" id="mobile" class="form-control mobile numberonly"
																	name="mobile" autocomplete="off"
																	onfocus="removeWarning(this)"
																	onkeypress="validNumber(event, this)"
																	value="<%=userMapData.get("mobile")%>" maxlength="10"
																	onpaste="allowAlphabateSpaceOnlyOnPaste(event,this)"
																	ng-model="mob" valid-reg-exp="^[1-9][0-9]{9}"
																	onblur="chkMobile(this)">
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 col-lg-6">
														<div class="form-group">
															<label class="d-block">Profile Pic </label>
															<div class="thumb">
																<img class="img-size" id="file-photo" alt="pic" src="">
															</div>
															<input type="file" name="profile" 
																id="image-file"  />
														</div>
														<div class="row d-flex align-items-center mb-3">
															<div class="col-md-6">
																<div class="imgupl">
																	<div class="file-tab">
																		<!-- <label class="btn btn-sm btn-default btn-file m-b-0">
																			<span>Upload Picture</span> <input type="file"
																			name="logo">
																		</label> -->
																		<!-- <button type="button" class="btn btn-sm btn-danger">Remove</button> -->
																	</div>
																</div>
															</div>
														</div>
													</div>

												</div>
												<hr />
												<div class="row">
													<div class="col-md-6 p-b-0">
														<div class="form-group row m-b-0">
															<div class="col-md-12">
																<span class="m-t-8 m-r-5"><img id="progress1"
																	src="/images/indicator.gif" alt="Loding..."
																	style="display: none"></span>
																<button type="submit" class="btn btn-success m-r-10"
																	id="sig-submitBtn" onclick="return validateProfile()">
																	<i class="ti-pencil-alt"></i> Update
																</button>
																<a href="/organizer/dashboard"
																	class="btn btn-default m-r-10"><i
																	class="fa fa-home"></i> Back to Home</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>

	<!-- Modal Change Password -->
	<div class="modal fade" id="NewPassword" role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						<b>Change Password</b>
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p class="f-s-15">
						<strong>Create a new password for Security Purpose.</strong>
					</p>
					<form name="updatePassword" id="updatePassword" method="post">
						<div class="form-group">
							<!-- Current Password -->
							<label>Current Password <span style="color: red">*</span></label>
							<!-- Input -->
							<!-- <input type="text" class="form-control" placeholder="Enter your current password">
                                    <div class="valid-feedback">
                                        
                                    </div> -->
							<div class="input-group input-group-merge">
								<input id="opss" type="password" name="password"
									class="form-control form-control-appended loginField"
									placeholder="Enter your current password">
								<div class="input-group-append" style="cursor: pointer">
									<span class="input-group-text inputGroupTextLogin"> <i
										class="fa fa-eye-slash" id="toggleOldPassword"></i>
									</span>
								</div>
							</div>
						</div>
						<!-- New Password -->
						<div class="form-group">
							<label>New Password <span style="color: red">*</span></label>
							<!-- Input group -->
							<div class="input-group input-group-merge">
								<input id="pss" type="password" name="newPassword"
									class="form-control form-control-appended loginField"
									placeholder="Enter your new password">
								<div class="input-group-append" style="cursor: pointer">
									<span class="input-group-text inputGroupTextLogin"> <i
										class="fa fa-eye-slash" id="togglePassword"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>Confirm Password <span style="color: red">*</span></label>
							<!-- Input group -->
							<div class="input-group input-group-merge">
								<input id="conpss" type="password" name="conPassword"
									class="form-control form-control-appended loginField"
									placeholder="Please enter your Confirm password">
								<div class="input-group-append" style="cursor: pointer">
									<span class="input-group-text inputGroupTextLogin"> <i
										class="fa fa-eye-slash" id="toggleconPassword"></i>
									</span>
								</div>


							</div>
							<h6 id="conpss_msg"></h6>
						</div>
						<div class="row form-group justify-content-center">
							<div class="col-12 col-md-8 col-lg-8">
								<!-- <button type="button" id="sign_in_btn" onclick="return false"
									class="btn btn-lg btn-block btn-primary mb-3 loader-position m-auto">Update
									Password</button> -->

								<button type="submit"
									class="btn btn-lg btn-block btn-primary mb-3 loader-position m-auto"
									onclick="return validateForm()">
									Update Password <span class="sm-loader mt-1"
										style="display: none"></span>
								</button>
							</div>
						</div>
						<div class="form-group d-flex justify-content-center">
							<span class="text-center"> don't want to change password ?
								<span class="sign_up_link"> <a href="signup">Sign in</a></span>.
							</span>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- jquery vendor -->
	<script src="/js/jquery.min.js"></script>
	<!--<script src="/js/jquery-3.5.1.min.js"></script>-->
	<script src="/js/jquery.nanoscroller.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/menubar/sidebar.js"></script>
	<script src="/js/preloader/pace.min.js"></script>
	<!--<script src="/js/bootstrap.min.js"></script>-->
	<script src="/js/sweetalert/sweetalert.min.js"></script>
	<script src="/js/polyfill.min.js"></script>
	<script src="/js/scripts.js?v=1.12"></script>
	<script src="/js/imageProfileUpload.js"></script>
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		$(document).on('click', '.browse', function() {
			var file = $(this).parent().parent().parent().find('.file');
			file.trigger('click');
		});
		var imageUpl = $('.imgupl');
		imageUpl.imageupload();		
		<%String companyCode = (String)userMap.get("companyCode");%>
		if ('' !== null) {
			document.getElementById('file-photo').setAttribute('src', "<%=MyUrl.profilePicUrl%><%=companyCode.toLowerCase()%>/profile/<%=userMap.get("profilePic")%>");
		}
		(function() {
			window.requestAnimFrame = (function(callback) {
			return window.requestAnimationFrame
						|| window.webkitRequestAnimationFrame
						|| window.mozRequestAnimationFrame
						|| window.oRequestAnimationFrame
						|| window.msRequestAnimaitonFrame
						|| function(callback) {
							window.setTimeout(callback, 1000 / 60);
						};
			})();
		});
	</script>

	<script>
		$('#toggleOldPassword').click(function() {
			if ($(this).hasClass('fa-eye-slash')) {
				$(this).removeClass('fa-eye-slash');
				$(this).addClass('fa-eye');
				$('#opss').attr('type', 'text');
			} else {
				$(this).removeClass('fa-eye');
				$(this).addClass('fa-eye-slash');
				$('#opss').attr('type', 'password');
			}
		});

		$('#togglePassword').click(function() {
			if ($(this).hasClass('fa-eye-slash')) {
				$(this).removeClass('fa-eye-slash');
				$(this).addClass('fa-eye');
				$('#pss').attr('type', 'text');
			} else {
				$(this).removeClass('fa-eye');
				$(this).addClass('fa-eye-slash');
				$('#pss').attr('type', 'password');
			}
		});

		$('#toggleconPassword').click(function() {
			if ($(this).hasClass('fa-eye-slash')) {
				$(this).removeClass('fa-eye-slash');
				$(this).addClass('fa-eye');
				$('#conpss').attr('type', 'text');
			} else {
				$(this).removeClass('fa-eye');
				$(this).addClass('fa-eye-slash');
				$('#conpss').attr('type', 'password');
			}
		});

		$(document).ready(function() {
			$("#conpss").click(function() {
				$("#conpss_msg").hide();
			});
			$("#pss").click(function() {
				$("#conpss_msg").hide();
			});
		});

		$("#conpss").bind('onkeyup change', function() {

			check_Password($("#pss").val(), $("#conpss").val())
		})
		$("#pss").bind('onkeyup change', function() {

			check_Password($("#pss").val(), $("#conpss").val())
		})

		$("#sign_in_btn").click(function() {
			check_Password($("#pss").val(), $("#conpss").val())

		})
		function check_Password(Pass, Con_Pass) {
			if (Pass === "" || Con_Pass === "") {
				$("#conpss_msg").hide();
			} else if (Pass === Con_Pass) {
				$("#conpss_msg").hide();
			} else {
				$("#conpss").focus()
				$('#conpss_msg').show()
				$("#conpss_msg").html('<div class="text-danger">Password did not matched</div>')
			}

		}
	</script>

	<script>
		$('#updatePassword').submit(function(event) {

			event.preventDefault();
			var form = document.getElementById('updatePassword');
			var formData = new FormData(form);

			$.ajax({
				url : '/organizer/changeUserPassword',
				method : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {

					if (response.code == 1) {
						swal("Yay !...", response.message, "success");
						setTimeout(function() {
							$('#NewPassword').modal('toggle');
							location.reload();
						}, 2000);
					} else {
						swal("Oops...", response.message, "error");
						setTimeout(function() {
							$('#NewPassword').modal('toggle');
							location.reload();
						}, 2000);
					}

				},
				error : function(xhr, status, error) {
					console.error(error);
					swal("Oops...", "Something Went Wrong", "error");
					location.reload();
					return false;
				}
			});
		});
	</script>

	<script>
		function validateForm() {

			$('.sm-loader').hide();

			var opss = $("#opss").val();
			var pss = $("#pss").val();
			var conpss = $("#conpss").val();

			if (opss == "" || null) {
				swal("Oops...", "Please Enter Current Password !!", "warning");
				$('#opss').focus();
				$('.sm-loader').hide();
				return false;
			} else if (pss == "" || null) {
				swal("Oops...", "Please Enter New Password !!", "warning");
				$('#pss').focus();
				$('.sm-loader').hide();
				return false;
			} else if (conpss == "" || null) {
				swal("Oops...", "Please Enter Confirm Password !!", "warning");
				$('#conpss').focus();
				$('.sm-loader').hide();
				return false;
			} else {
				$('.sm-loader').show();
			}

		}
	</script>

	<script>
		$('#updateProfile').submit(function(event) {
			event.preventDefault();
			var form = document.getElementById('updateProfile');
			var formData = new FormData(form);

			$.ajax({
				url : '/organizer/updateUserProfile',
				method : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {

					if (response.code == 1) {
						swal("Yay !...", response.message, "success");
						setTimeout(function() {
							location.reload();
						}, 2000);
					} else {
						swal("Oops...", response.message, "error");
						setTimeout(function() {
							location.reload();
						}, 2000);
					}

				},
				error : function(xhr, status, error) {
					console.error(error);
					swal("Oops...", "Something Went Wrong", "error");
					location.reload();
					return false;
				}
			});
		});
	</script>

	<script>
	
	function validateProfile(){
		
		var fname = $("#fname").val();
		var mobile = $("#mobile").val();

		if (fname == "" || null) {
			swal("Oops...", "Please Enter First Name !!", "warning");
			$('#fname').focus();			
			return false;
		} 
		if (mobile == "" || null) {
			swal("Oops...", "Please Enter Mobile No !!", "warning");
			$('#mobile').focus();
			return false;
		} 
	}	
	</script>

</body>
</html>
