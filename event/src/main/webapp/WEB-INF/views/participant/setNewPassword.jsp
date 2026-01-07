<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="OneStop">
<title>Set New Password</title>
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
<!-- Styles -->
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/themify-icons.css" rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/helper.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/core.css" rel="stylesheet">
<link href="/css/sweetalert/sweetalert.css" rel="stylesheet">

</head>
<body
	class="d-flex align-items-center bg-auth border-top border-top-2 border-primary layout-bg"
	onload='document.loginForm.email.focus();'>


	<div class="container">
		<div class="row justify-content-center align-items-center"
			id="skeletone">
			<div class="col-12 col-md-6 col-xl-6">
				<div class="card border-0 mb-4 shadow p-lg-5">
					<h1 class="display-4 text-center mb-3">Set your new Password</h1>
					<div class="card-body outerField">

						<div class="msg" style="text-align: center"></div>
						<form name="loginForm" id="loginForm" method="post">
							<input type="hidden" value="<%=request.getAttribute("email")%>"
								name="email" id="email">
							<div class="form-group">
								<label>New Password <span style="color: red">*</span></label>
								<!-- Input group -->
								<div class="input-group input-group-merge">
									<input id="pss" type="password" name="password"
										class="form-control form-control-appended loginField"
										placeholder="Enter your new password">
									<div class="input-group-append" style="cursor: pointer">
										<span class="input-group-text inputGroupTextLogin"> <i
											class="fa fa-eye-slash" id="togglePassword"></i>
										</span>
									</div>
								</div>
								<div class="msg" id="passwordError" style="color: red;"></div>
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
								<div class="msg" id="confPasswordError" style="color: red;">
								</div>
							</div>
							<div class="row form-group justify-content-center">
								<div class="col-12 col-md-8 col-lg-8">
									<button type="submit" id="sign_in_btn"
										onclick="return validateForm()"
										class="btn btn-lg btn-block btn-primary mb-3 loader-position m-auto">
										Set Password <span class="sm-loader" style="display: none"></span>
									</button>
								</div>
							</div>
							<div class="form-group d-flex justify-content-center">
								<span class="text-center"> don't want to change password
									? <span class="sign_up_link"> <a href="signup">Sign
											in</a></span>.
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



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


	<!--<script src="safelocker/js/ossf-aes.js?v=1.1"></script>-->
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
		$('#loginForm').submit(function(event) {

			$('.sm-loader').show();

			event.preventDefault();
			var form = document.getElementById('loginForm');
			var formData = new FormData(form);

			$.ajax({
				url : '/participant/setNewPassword',
				method : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					
					console.log(response);
					
					$('.sm-loader').hide();
					if (response.code == 1) {
						swal("Yay !...", response.message, "success");
						setTimeout(function() {
							window.location = '/participant/login';
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
		function validateForm() {

			var pass = $("#pss").val();
			var confpass = $("#conpss").val();
			$("#passwordError").html('');
			$("#confPasswordError").html('');

			if (pass == "" || null) {
				$("#passwordError").html('<div class="text-danger">Please Enter Password</div>');
				$('#pss').focus();
				return false;
			} else if (confpass == "" || null) {
				$("#confPasswordError").html('<div class="text-danger">Please Enter Confirm Password</div>');
				$('#conpss').focus();
				return false;
			} else {
				$("#passwordError").html('');
				$("#confPasswordError").html('');
				return true;
			}
		}
	</script>

</body>
</html>
