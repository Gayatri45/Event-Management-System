<%@ page errorPage="error-page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free Invoicing and Billing software with GST for India.">
<meta name="keywords"
	content="free invoicing software,gst Invoice, invoice,online invoicing,free invoice">
<meta name="author" content="Codeit ERP">
<title>One Stop | login</title>
<!-- ================= Favicon ================== -->
<!-- Standard -->
<link rel="shortcut icon" href="/images/favicon.svg">
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
<script
	src="https://apis.google.com/js/platform.js?onload=oneStopCallback"
	async defer></script>
</head>

<body
	class="d-flex align-items-center bg-auth border-top border-top-2 border-primary layout-bg">
	<div class="container">
		<div class="row justify-content-center align-items-center"
			id="skeletone">
			<div class="col-12 col-md-6 col-xl-6">
				<div class="card border-0 mb-4 shadow p-5">
					<h4 class="display-4 text-center mb-3">Sign in</h4>
					<div class="card-body outerField">
						<div class="msg" style="text-align: center; color: red;">
							<%=request.getAttribute("message") != null ? request.getAttribute("message") : ""%></div>
						<form method="post" name="loginForm" action="/organizer/loginUserOrganizer">
							<!-- Email address -->
							<div class="form-group">
								<!-- Label -->
								<label>Email <span style="color: red">*</span></label>
								<!-- Input -->
								<input id="email" type="email" name="email"
									class="form-control loginField"
									placeholder="Enter your email id" required=""
									onkeypress="clearmsg(event)">
								<div class="valid-feedback"></div>
							</div>
							<!-- Password -->
							<div class="form-group">
								<label>Password <span style="color: red">*</span></label>
								<!-- Input group -->
								<div class="input-group input-group-merge">
									<input id="password" type="password" name="password"
										class="form-control form-control-appended loginField"
										placeholder="Enter your onestop password">
									<!-- Icon -->
									<div class="input-group-append" style="cursor: pointer">
										<span class="input-group-text inputGroupTextLogin"> <i
											class="fa fa-eye" id="togglePassword"></i>
										</span>
									</div>
									<div class="valid-feedback"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-12 col-md-6 col-lg-6">
										<div class="form-check">
											<label for="rememberMe"><input
												class="form-check-input is-invalid" type="checkbox"
												name="remember" value="true" id="rememberMe">
												Remember Me</label>
										</div>
									</div>
									<div class="col-12 col-md-6 col-lg-6 text-right">
										<a id="recoverPassword" onclick="return recoverPassword()"
											class="form-text password_recover"> Recover password? </a>
									</div>
								</div>
							</div>

							<div class="row form-group justify-content-center">
								<div class="col-12 col-md-8 col-lg-8">
									<button type="submit"
										class="btn btn-lg btn-block btn-primary mb-3 loader-position m-auto"
										onclick="return validateForm()">
										Sign in <span class="sm-loader mt-1" style="display: none"></span>
									</button>

								</div>
							</div>
							<div class="form-group d-flex justify-content-center">
								<span class="text-center"> Don't have an account? <span
									class="sign_up_link"> <a
										href="https://www.onestop.global/signup">Sign up here</a></span>.
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Email Confirmation -->
	<div class="modal fade" id="mailconfirm">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="border-radius: 10px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Recovery mail
						sent</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mail-img text-center my-3">
						<img src="/images/check-mail.png" style="width: 100px;" alt="">
					</div>
					<h3 class="text-center">Email Confirmation</h3>
					<p class="text-justify px-3">
						We have sent mail to <a href="#" class="text-primary"> <span
							id="recoverPasswordEmail"></span>
						</a> to verfiy your account. After receiving the email follow the link
						provided to verify your account and reset your password
					</p>
				</div>
				<div class="modal-footer"
					style="justify-content: center !important;">
					<p>
						If you not get any mail <a href="#" class="text-primary">Resend
							confirmation mail</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<script src="/js/jquery-1.11.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/sweetalert/sweetalert.min.js"></script>
	<script src="/js/polyfill.min.js"></script>

	<script>
		function clearmsg(event) {
			$('.msg').text('');
			if (event.keyCode === 13) {
				loginUser();
			}
		}
		var togglePassword = document.querySelector('#togglePassword');
		var pass = document.querySelector('#password');
		togglePassword.addEventListener('click', function(e) {
			var type = pass.getAttribute('type') === 'password' ? 'text'
					: 'password';
			pass.setAttribute('type', type);
			this.classList.toggle('fa-eye-slash');
		});
	</script>

	<!-- <script>    
  
    const rmCheck = document.getElementById("rememberMe"), emailInput = document.getElementById("email");

    if (localStorage.checkbox && localStorage.checkbox !== "") {
      rmCheck.setAttribute("checked", "checked");
      emailInput.value = localStorage.username;
    } else {
      rmCheck.removeAttribute("checked");
      emailInput.value = "";
    }

    function lsRememberMe() {
      if (rmCheck.checked && emailInput.value !== "") {
        localStorage.username = emailInput.value;
        localStorage.checkbox = rmCheck.value;
      } else {
        localStorage.username = "";
        localStorage.checkbox = "";
      }
    }    
    
    </script> -->

	<script>
		$("#recoverPassword").on('click', function() {

			var email = $("#email").val();

			if (email == "" || null) {
				$(".msg").html('<div>Please Enter Email</div>');
			} else {
				$(".msg").text("");
				$("#recoverPasswordEmail").text(email);
				$('#mailconfirm').modal('toggle');
				window.location = '/organizer/resetPasssword?email=' + email;
			}

		});
	</script>

	<script>
		function validateForm() {

			$('.sm-loader').hide();

			var email = $("#email").val();
			var password = $("#password").val();

			if (email == "" || null) {
				$(".msg").html("<div>Please Enter Email</div>");
				return false;
			} else if (password == "" || null) {
				$(".msg").html("<div>Please Enter Password</div>");
				return false;
			} else {
				$(".msg").text("");
				$('.sm-loader').show();
				return true;
			}

		}
	</script>
</body>
</html>