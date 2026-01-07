<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="error-page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Attendee</title>
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
 <%@include file="../headercssfile.jsp" %>

<style>
h5 span .actionMessage {
	font-size: 20px !important;
}
</style>

<%
HashMap attendeeDetails = (HashMap)request.getAttribute("attendeeDetails");
%>

</head>

<body>
	
	<%@include file="sidebar.jsp"%>

	<%@include file="header.jsp"%>
	<div class="content-wrap">
		<div class="main">	
		 <div class="page-header">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col">
                            <div class="page-title">
                                <h1>Edit Attendee </h1> 
                            </div>
                        </div>
                          <div
							class="col-md-6 ml-auto text-sm-left text-md-right text-lg-right">
							<a class="btn btn-success btn-sm m-b-10 m-l-5" onclick="backFun()"><i class="fa fa-backward"></i> Back</a>
						</div>
                    </div>
                </div>
            </div>		
			<div class="container-fluid">
				<section id="main-content">
	 <div class="content-wrap">
		<div class="row justify-content-center">
			<div class="col-12 col-md-12 col-xl-6">
				<div class="card"> 
					
						<form name="saveAttendee"
							 id="saveAttendee">
							
							<input type="hidden" id="companyId" name="companyId" value="<%=attendeeDetails.get("companyId")%>">
							<input type="hidden" id="branchId" name="branchId" value="<%=attendeeDetails.get("branchId")%>">
							<input type="hidden" id="companyName" name="companyName" value="<%=attendeeDetails.get("companyName")%>">
							<input type="hidden" id="branchName" name="branchName" value="<%=attendeeDetails.get("branchName")%>">
							<input type="hidden" name="attendeeLoginAccess" id="attendeeLoginAccess" value="<%=attendeeDetails.get("attendeeLoginAccess") %>"> 
							<input type="hidden" name="attendeeId" id="attendeeId"  value="<%=attendeeDetails.get("attendeeId") %>">
							<input type="hidden" id="attendeeApprovalStatus" name="attendeeApprovalStatus" value="<%=attendeeDetails.get("attendeeApprovalStatus")%>">
							<input type="hidden" name="qrCodeImageName" id="qrCodeImageName"  value="<%=attendeeDetails.get("qrCodeImageName") %>">
							<input type="hidden" name="qrCodeImageOriginalName" id="qrCodeImageOriginalName"  value="<%=attendeeDetails.get("qrCodeImageOriginalName") %>">
							<input type="hidden" name="attendeeCode" id="attendeeCode"  value="<%=attendeeDetails.get("attendeeCode") %>">
							<input type="hidden" name="updateAttendee" id="updateAttendee"  value="1">
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Event <span style="color: red">*</span></label> <select
											name="event.eventId" id="event"
											class="form-control input-default"
											required="required">
											
											<% HashMap event = (HashMap)attendeeDetails.get("event");%>
																									
											<option id="event"
												value="<%=event.get("eventId")%>"><%=event.get("eventName")%></option>
										
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
											<% HashMap category = (HashMap)attendeeDetails.get("category");%>
										
										<option 
												value="<%=category.get("categoryId")%>"><%=category.get("categoryName")%></option>																		
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
											
												<% HashMap venue = (HashMap)attendeeDetails.get("venue");%>
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
											class="form-control input-default" value="<%=attendeeDetails.get("firstName") %>"
											placeholder="Enter your first name" ng-model="firstName"
											required="required">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Last Name <span style="color: red">*</span></label> <input
											type="text" name="lastName" id="lastName"
											class="form-control input-default" value="<%=attendeeDetails.get("lastName") %>"
											placeholder="Enter your last name" ng-model="lastName"
											required="required">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Email (Login Id)<span style="color: red">*</span></label>
										<input type="email" name="email" id="email"  value="<%=attendeeDetails.get("email") %>"
											class="form-control loginField" placeholder="Enter email"
											ng-model="email" ng-blur="checkEmail(this)" required="required" readonly="readonly" data-toggle="tooltip"
																>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Phone No <span style="color: red">*</span></label> <input
											type="text" name="phoneNo" id="phoneNo"
											class="form-control input-default" value="<%=attendeeDetails.get("phoneNo") %>"
											placeholder="Enter your Id" ng-model="uId" required="required">
									</div>
								</div>
							</div>
							
							<%-- <div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>No Of Person<span style="color: red">*</span></label> <input
											type="text" name="noOfPerson" id="noOfPerson"
											class="form-control input-default" value="<%=attendeeDetails.get("noOfPerson") %>"
											placeholder="Enter your Id" ng-model="uId" required="">
									</div>
								</div>
							</div> --%>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									  <div class="form-group">
					                    <label for="">Date Of Birth<span class="requiredFiled">*</span> </label>
					                       <div class="cal-icon">
					                    <input type="text" class="form-control" placeholder="" 
					                    value="<%=attendeeDetails.get("dob") %>" name="dob" id="dob">
					                    </div>
					                  </div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label>Gender <span style="color: red">*</span></label> <select
											name="gender" id="gender"
											class="form-control input-default" required="required">
											<option value="0" selected="selected">Select
												Gender</option>
												
										<% if(attendeeDetails.get("gender").equals("Female")){ %>	
										<option value="Female" selected="selected">Female</option>
										<option value="Male">Male</option>	
										<%} else{%>											
										<option value="Female">Female</option>
										<option value="Male" selected="selected">Male</option>											
										<%} %>
										
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-12 col-md-12 col-lg-12">
									  <div class="form-group">
					                    <label for="">Address </label>
					                    <textarea class="form-control" id="address" 
					                    name="address" rows="3"><%=attendeeDetails.get("address") %></textarea>
					                  </div>
								</div>
							</div>													
							<div class="row justify-content-center">
								<div class="col-12 col-md-8 col-lg-8">
									<button 
										class="btn btn-lg btn-block btn-primary mb-3 loader-position" onclick="return validateForm()"
										type="submit"
										ng-disabled="regisForm.companyName.$dirty && regisForm.companyName.$invalid || regisForm.email.$dirty && regisForm.email.$invalid">
										Update <span class="loader" style="display: none"></span>
									</button>
								</div>
							</div>						
						</form>
					</div>
			
			</div>
		</div>
	</div>
	
	</section>

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
	
	<%@include file="../footerjsfile.jsp" %>
 	
	<script>
	//var dateToday = new Date();
        $('#dob').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            "format": "YYYY-MM-DD",
           // maxDate : dateToday // maxDate: (moment(new Date())) 
        });        
        $("[data-toggle=tooltip]").tooltip();
    </script>
    
    <script>
    $(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});</script>

	<script>
		function validateForm() {

			$('.sm-loader').show();
			
			var firstName = $("#firstName").val();
			var lastName = $("#lastName").val();
			var email = $("#email").val();
			var phoneNo = $("#phoneNo").val();
			var dob = $("#dob").val();
			var gender = $("#gender").val();
			
			if (firstName == "" || firstName == null) {
				swal("Oops...", "Please Enter First Name !!", "error");
				$('#firstName').focus();
				return false;
			}
			if (lastName == "" || lastName == null) {
				swal("Oops...", "Please Enter Last Name !!", "error");
				$('#lastName').focus();
				return false;
			}
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
	            	
	            	if(response == true){	
	            		$('#mailconfirm').modal('toggle');
	            		setTimeout(function () {	            	
	                        window.location.href = '/organizer/attendee/attendee-list';
	                    }, 5000);          		
	            	}
	            	else{
	            		 swal("Oops...", response.message, "error");
	            		 /* setTimeout(function () {
	            			 location.reload();		                       
	                     }, 3000); */
	            	}	            	
	            }, 
	            error: function (xhr, status, error) {                   	
	                console.error(error); 
	                swal("Oops...", "Something Went Wrong", "error");	
	                //location.reload();	
	                return false;
	            } 
	        }); 
	    }); 
	
	</script>
		
	<script>
		function backFun() {
			window.history.back();
		}
	</script>


</body>
</html>