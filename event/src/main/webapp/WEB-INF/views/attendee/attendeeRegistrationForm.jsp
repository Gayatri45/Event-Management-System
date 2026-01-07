<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="error-page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free Invoicing and Billing software with GST for India.">
<meta name="keywords"
	content="free invoicing software,gst Invoice,invoice,online invoicing,free invoice">
<meta name="author" content="One Stop">
<meta name="google-site-verification"
	content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
<!-- Standard -->
<link rel="shortcut icon" href="/images/32x32.png" />
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144" href="/images/144x144.png" />
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114" href="/images/114x114.png" />
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72" href="/images/72x72.png" />
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57" href="/images/57x57.png" />
<!-- Style-->
<link href="/css/select2/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/select2/select2-bootstrap.css" />
<link href="/css/font-awesome.min.css" rel="stylesheet">
<!--<link href="/css/line-awesome/line-awesome.css" rel="stylesheet">-->
<link href="/css/themify-icons.css" rel="stylesheet">
<link href="/css/menubar/sidebar.css?v=1.7" rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/sweetalert/sweetalert.css" rel="stylesheet">
<link href="/css/helper.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/event-admin.css" rel="stylesheet">
<link href="/css/core.css?v=1.27" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" type="text/css"
	href="/js/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="/views/organizer/css/choices.min.css">
<style>
h5 span .actionMessage {
	font-size: 20px !important;
}
</style>
 <%
//ArrayList<HashMap> eventList = (ArrayList<HashMap>) request.getAttribute("eventList");
HashMap eventDetails = (HashMap) request.getAttribute("eventDetails");
HashMap category = (HashMap)eventDetails.get("category");
HashMap venue = (HashMap)eventDetails.get("venue");
%>

</head>

<body class="d-flex bg-auth border-top border-top-2 layout-bg"
	ng-app="erpApp" ng-controller="userRegistration">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6 col-xl-6 my-2">
				<div class="card border-0 mb-4 shadow p-5">
					<div class="row mb-3">
						<div class="col-md-12">

							<h4 style="margin: 0;">Register For Event</h4>
							Create Account on One Stop Event App
							<hr />
						</div>
					</div>
					<div class="card-body outerField">

						<form name="saveAttendee" ng-submit="register()"
							 id="saveAttendee">
							
							<input type="hidden" id="companyName" name="companyName" value="<%=eventDetails.get("companyName")%>">
							<input type="hidden" id="branchName" name="branchName" value="<%=eventDetails.get("branchName")%>">
							<input type="hidden" id="companyId" name="companyId" value="<%=eventDetails.get("companyId")%>">
							<input type="hidden" id="branchId" name="branchId" value="<%=eventDetails.get("branchId")%>">
							<input type="hidden" id="attendeeApprovalStatus" name="attendeeApprovalStatus" value="<%=eventDetails.get("approvalRequired")%>">
							<input type="hidden" id="payment" name="payment" value="<%=eventDetails.get("paymentGatewayRequired")%>">
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Event <span style="color: red">*</span></label> <select
											name="event.eventId" id="event"
											class="form-control input-default"
											onchange="getEventDetails()" required="true">											
											<option id="event"
												value="<%=eventDetails.get("eventId")%>" selected="selected"><%=eventDetails.get("eventName")%></option>										
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Category <span style="color: red">*</span></label> 
										<select
											name="category.categoryId" id="categoryIdList"
											class="form-control">											
											<% if(category != null){ %>																				
											<option value="<%=category.get("categoryId")%>"><%=category.get("categoryName") %></option>	 
											<%} %>								
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Venue <span style="color: red">*</span></label> <select
											name="venue.venueId" id="venue"
											class="form-control input-default">
									 	<option value="<%=venue.get("venueId")%>"><%=venue.get("venueName") %></option>											
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>First Name <span style="color: red">*</span></label> <input
											type="text" name="firstName" id="firstName"
											class="form-control input-default"
											placeholder="Enter your first name" ng-model="firstName"
											required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Last Name </label> <input
											type="text" name="lastName" id="lastName"
											class="form-control input-default"
											placeholder="Enter your last name" ng-model="lastName"
											required="">
									</div>
								</div>
							</div>							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Email (Login Id)<span style="color: red">*</span></label>
										<input type="email" name="email" id="email"
											class="form-control loginField" placeholder="Enter email"
											ng-model="email" ng-blur="checkEmail(this)" required="">
											 <span class="error" style="color: red" id="emailError"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Phone No <span style="color: red">*</span></label> <input
											type="text" name="phoneNo" id="phoneNo"  maxlength="10" 
											class="form-control input-default mobile numberonly"
											placeholder="Enter your Id" ng-model="uId" required="">
											<span class="error" style="color: red"
											id="phoneError"></span> <span class="error"
											style="color: red" id="mobileError"></span>
									</div>
								</div>
							</div>
							
							<!-- <div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>No Of Person<span style="color: red">*</span></label> <input
											type="text" name="noOfPerson" id="noOfPerson"
											class="form-control input-default"
											placeholder="Enter your Id" ng-model="uId" required="">
									</div>
								</div>
							</div> -->
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									  <div class="form-group">
					                    <label for="">Date Of Birth<span class="requiredFiled">*</span> </label>
					                       <div class="cal-icon">
					                    <input type="text" class="form-control" placeholder="" value="" name="dob" id="dob">
					                    </div>
					                  </div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Gender <span style="color: red">*</span></label> <select
											name="gender" id="gender"
											class="form-control input-default" required="true">
											<option value="0" selected="selected">Select
												Gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									  <div class="form-group">
					                    <label for="">Address </label>
					                    <textarea class="form-control" id="address" name="address" rows="3"></textarea>
					                  </div>
								</div>
							</div>							
							<%-- <div class="row">
								<div class="col-12">
									<div class="form-group">
										<div class="form-check">
											<label><input type="checkbox"
												class="form-check-input is-invalid" ng-model="terms"
												required name="isTerms"> Agree the <span
												class="sign_up_link"><a
													href="${pageContext.request.contextPath}/terms"
													target="_blank"> terms and policy</a></span></label>
										</div>
									</div>
								</div>
							</div> --%>
							<div class="row justify-content-center">
								<div class="col-12 col-md-8 col-lg-8">
									<button 
										class="btn btn-lg btn-block btn-primary mb-3 loader-position" onclick="return validateForm()"
										type="submit"
										ng-disabled="regisForm.companyName.$dirty && regisForm.companyName.$invalid || regisForm.email.$dirty && regisForm.email.$invalid">
										Register <span class="loader" style="display: none"></span>
									</button>
								</div>
							</div>
						<%-- 	<div class="form-group d-flex justify-content-center">
								<span class="text-center"> Already have account ? <span
									class="sign_up_link"><a
										href="${pageContext.request.contextPath}/home/signin">
											Sign in</a></span>
								</span>
							</div> --%>
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
					<h5 class="modal-title" id="exampleModalLabel">Registration mail
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
					<h3 class="text-center">Confirmation</h3>
					<p class="text-justify px-3">
						We have sent QR Code to <a href="#" class="text-primary"> <span
							id="recoverPasswordEmail"></span>
						</a> your email And whatsApp account. Using the QR Code You can enter in the Event.
					</p>
				</div>
				<div class="modal-footer"
					style="justify-content: center !important;">
					<p>
						If you not get any mail or message <a href="#" class="text-primary">Resend
							confirmation mail and message</a>
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
	<script src="/js/core.js?v=10.81"></script>
	<script src="/js/scripts.js"></script>
	<script type="text/javascript" src="/js/moment-with-locales.min.js"></script>
	<script src="/js/date-picker/jquery-ui.js"></script>
 	<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
	<script>
	var dateToday = new Date();
        $('#dob').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            "format": "YYYY-MM-DD",
           maxDate : dateToday // maxDate: (moment(new Date())) 
        });        
        $("[data-toggle=tooltip]").tooltip();
    </script>
    	
	<script>
		function validateForm() {

			$('.sm-loader').show();
			
			var firstName = $("#firstName").val();
			//var lastName = $("#lastName").val();
			var email = $("#email").val();
			var phoneNo = $("#phoneNo").val();
			//var noOfPerson = $("#noOfPerson").val();
			var dob = $("#dob").val();
			var gender = $("#gender").val();
			
			if (firstName == "" || firstName == null) {
				swal("Oops...", "Please Enter First Name !!", "error");
				$('#firstName').focus();
				return false;
			}
			/* if (lastName == "" || lastName == null) {
				swal("Oops...", "Please Enter Last Name !!", "error");
				$('#lastName').focus();
				return false;
			} */
			if (email == "" || email == null) {
				swal("Oops...", "Please Enter Email !!", "error");
				$('#email').focus();
				return false;
			}			
			if (phoneNo == "" || phoneNo == null) {
				swal("Oops...", "Please Enter Mobile No !!", "error");
				$('#phoneNo').focus();
				return false;
			}
			/* if (noOfPerson == "" || noOfPerson == null) {
				swal("Oops...", "Please Enter No of Person !!", "error");
				$('#noOfPerson').focus();
				return false;
			} */
			if (dob == "" || dob == null) {
				swal("Oops...", "Please Select Date of Birth !!", "error");
				$('#dob').focus();
				return false;
			}
			if (gender == "0") {
				swal("Oops...", "Please Select Gender !!", "error");
				$('#gender').focus();
				return false;
			}				

		}
	</script>
	
	<script>	
		$('#saveAttendee').submit(function (event) { 
	        event.preventDefault();                 
	        var form = document.getElementById('saveAttendee'); 
	        var formData = new FormData(form); 
	       
	        $.ajax({ 
	            url: '/attendee/saveAttendee', 
	            method: 'POST', 
	            data: formData, 
	            processData: false, 
	            contentType: false, 
	            success: function (response) {
	            	
	            	console.log(response);
	            	
	            	if(response.code == 1){	
	            		$('#mailconfirm').modal('toggle');
	            		setTimeout(function () {	            	
	                        window.location.href = '/';
	                    }, 5000);          		
	            	}
	            	else{
	            		 swal("Oops...", response.message, "error");
	            		 setTimeout(function () {
	            			 location.reload();		                       
	                     }, 3000);
	            	}	            	
	            }, 
	            error: function (xhr, status, error) {                   	
	                console.error(error); 
	                swal("Oops...", "Something Went Wrong", "error");	
	                location.reload();	
	                return false;
	            } 
	        }); 
	    }); 
	
	</script>
	
	<script>
	
	$('#email').keyup(function() {
		var email = $('#email').val();
		isValidEmail(email);
	});

	function isValidEmail(email) {
		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		if (emailRegex.test(email)) {
			$("#emailError").text("");
		} else {
			$("#emailError").text("Invalid email format");
			return false;
		}
	}

	$('#phoneNo').keyup(function() {
		var phoneNo = $('#phoneNo').val();
		isValidPhoneNo(phoneNo);
	});

	function isValidPhoneNo(phoneNo) {
		var phoneRegex = /^\d{10}$/;

		if (!phoneRegex.test(phoneNo)) {
			$("#phoneError").text("Invalid length");
			return false;
		} else {
			$("#phoneError").text("");
		}
	}
	
	</script>
		
</body>
</html>