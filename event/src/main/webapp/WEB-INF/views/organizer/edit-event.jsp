<!DOCTYPE html>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.onestop.codeitsoft.event.entity.Venue"%>
<%@page import="com.onestop.codeitsoft.event.entity.Audience"%>
<%@page import="com.onestop.codeitsoft.event.entity.Category"%>
<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="google-site-verification"
	content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
<title>One Stop | Edit Event</title>
 <%@include file="../headercssfile.jsp" %>
  <style>
    /* CSS for datepicker */
    .ui-datepicker {
      font-size: 18px;
    }
    .ui-datepicker-header {
      background-color: #f0f0f0;
    }
    .ui-datepicker-calendar {
      border: 1px solid #ccc;
    }
    /* Add more CSS styles as needed */
  </style>

<%
HashMap eventDetails = (HashMap) request.getAttribute("eventDetails");
ArrayList<HashMap> categoryList = (ArrayList<HashMap>) request.getAttribute("categoryList");
ArrayList<HashMap> audienceList = (ArrayList<HashMap>) request.getAttribute("audienceList");
ArrayList<HashMap> countryList = (ArrayList<HashMap>) request.getAttribute("countryList");
ArrayList<HashMap> venueList = (ArrayList<HashMap>) request.getAttribute("venueList");
HashMap eventCategory = (HashMap) eventDetails.get("category");
ArrayList<HashMap> eventAudience = (ArrayList<HashMap>) eventDetails.get("audience");
HashMap eventVenue = (HashMap) eventDetails.get("venue");
int paymentGatewayRequired = (Integer)eventDetails.get("paymentGatewayRequired");
//Set<Integer> printedValues = new HashSet<>();
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
								<h1>Edit The event</h1>
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

					<div class="row">
						<div class="col-lg-12">
							<div class="card" id="queryData">

								<form name="saveEvent" id="saveEvent">
									<div class="card-body">
										<div class="alert alert-info alert-icon">
											<i class="fa fa-info-circle"></i> The fields preceded with a
											red * are mandatory
										</div>

										<input type="hidden" id="companyName" name="companyName" value="<%=eventDetails.get("companyName")%>"> 
										<input type="hidden" id="branchName" name="branchName" value="<%=eventDetails.get("branchName")%>"> 
										<input type="hidden" id="companyId" name="companyId" value="<%=eventDetails.get("companyId")%>"> 
										<input type="hidden" id="branchId" name="branchId" value="<%=eventDetails.get("branchId")%>"> 
										<input type="hidden" id="createdByRole" name="createdByRole" value="<%=eventDetails.get("createdByRole")%>"> 
										<input type="hidden" value="<%=eventDetails.get("createdByName")%>" id="createdByName" name="createdByName">
										<input type="hidden" id="eventId" name="eventId" value="<%=eventDetails.get("eventId")%>">
										<input type="hidden" id="eventUrl" name="eventUrl" value="<%=eventDetails.get("eventUrl")%>">
										 
										<div class="row">

											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Event name <span
														class="text-danger">*</span> <span class="text-danger">
															<i class="fa fa-info-circle"></i>
													</span> <small> Editing the title after the event is saved
															won't change the event url </small>
													</label> <input type="text" id="eventName" name="eventName"
														value="<%=eventDetails.get("eventName")%>"
														required="required" maxlength="100" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Select Categories <span
														class="text-danger">*</span></label> <select class="form-control"
														name="category.categoryId" id="category">
														<%
														for (int i = 0; i < categoryList.size(); i++) {
															HashMap category = (HashMap) categoryList.get(i);
														%>

														<%
														if (category.get("categoryId").equals(eventCategory.get("categoryId"))) {
														%>
														<option value="<%=category.get("categoryId")%>"
															selected="selected"><%=category.get("categoryName")%></option>
														<%
														} else {
														%>
														<option value="<%=category.get("categoryId")%>"><%=category.get("categoryName")%></option>
														<%
														}
														%>

														<%
														}
														%>

													</select>
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Description </label>
													<textarea name="description" class="form-control desc"
														rows="6" placeholder="Description" id="description"
														spellcheck=""><%=eventDetails.get("description")%></textarea>
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="d-block">Audiences <span
														class="text-danger">*</span><small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Select the audience types that are targeted in your event
													</small>
													</label>
													<div id="audienceList">
														<%
														for (int i = 0; i < audienceList.size(); i++) {
															HashMap audience = (HashMap) audienceList.get(i);
														%>
													 	
														<div
															class="custom-control custom-checkbox custom-control-inline">
															<input type="checkbox"
																class="custom-control-input audiencecheckbox"
																name="audienceIdList"
																id="customCheck<%=audience.get("audienceId")%>"
																value="<%=audience.get("audienceId")%>"> <label
																class="custom-control-label"
																for="customCheck<%=audience.get("audienceId")%>">
																<%=audience.get("audienceName")%></label>
														</div> 
																											
														<%
														}
														%>
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Country <span class="text-danger">*</span> <small>
															<span class="text-danger"> <i
																class="fa fa-info-circle"></i>
														</span> Select the country that your event represents (ie: A
															movie's country of production)
													</small>
													</label> <select name="country" id="country" class="form-control"
														required="required" tabindex="-1" aria-hidden="true">
														<%
														for (int i = 0; i < countryList.size(); i++) {
															HashMap country = (HashMap) countryList.get(i);
														%>

														<%
														if (country.get("countryName").equals(eventDetails.get("country"))) {
														%>
														<option value="<%=country.get("countryName")%>"
															selected="selected"><%=country.get("countryName")%></option>
														<%
														} else {
														%>
														<option value="<%=country.get("countryName")%>"><%=country.get("countryName")%></option>
														<%
														}
														%>

														<%
														}
														%>

													</select>

												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Contact phone number <span
														class="text-danger">*</span> <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Enter the phone number to be called for inquiries
													</small>
													</label> <input type="text" id="phoneNo" name="phoneNo"
														aria-describedby="event_phonenumber_help" value="<%=eventDetails.get("phoneNo")%>"
														class="form-control">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Contact email address <span
														class="text-danger">*</span> <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Enter the email address to be reached for inquiries
													</small>
													</label> <input type="text" id="email" name="email" value="<%=eventDetails.get("email")%>"
														aria-describedby="event_email_help" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label>Artists <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Enter the list of artists that will perform in your event
															(press Enter after each entry)
													</small>
													</label> <input type="text" name="artists" id="artists"
														placeholder="" class="form-control" value="<%=eventDetails.get("artists")%>" >
												</div>
											</div>

											<div class="col-md-12">
														<label>Images gallery <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Add other images that represent your event to be
															displayed as a gallery and Image size should be less than 1 MB
													</small>
													</label> 
													<div class="m-2">
														<input
															type="file" name="imageGallery" id="imageGallery" class="form-control">
														<input type="hidden" value="0" name="removeImg"
															id="removeImg" class="form-control">
														<button type="button" class="btn btn-info btn-sm"
															id="add_image">Upload Image</button>
														<div class="mb-2">
															<img src="<%=MyUrl.uploadedUrl%>eventImages/<%=eventDetails.get("imageGalleryName")%>" alt="" id="preview_image" class="img-fluid"
																style='height: 100px'> <img src="" alt=""
																id="preview_image1" class="img-fluid"
																style='height: 100px'>
														</div>
														<button type="button" class="btn btn-info btn-sm"
															id="edit_image">Upload</button>
														<button type="button" class="btn btn-danger btn-sm"
															id="delete_image">Remove</button>
														<button type="button" class="btn btn-danger btn-sm"
															id="delete_image1">Remove</button>
													</div>
													</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="d-block">Approval Required <span
														class="text-danger">*</span>
													</label>
													<% int approvalRequired = (Integer)eventDetails.get("approvalRequired"); %>
													
													<%if(approvalRequired == 1) {%>												
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="approvalrequired1" value="1"
															name="approvalRequired" class="custom-control-input"
															checked="checked" > <label
															class="custom-control-label" for="approvalrequired1">Yes</label>
													</div>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="approvalrequired2" value="0"
															name="approvalRequired" class="custom-control-input">
														<label class="custom-control-label"
															for="approvalrequired2">No</label>
													</div>
													<%}else{ %>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="approvalrequired1" value="1"
															name="approvalRequired" class="custom-control-input"
															> <label
															class="custom-control-label" for="approvalrequired1">Yes</label>
													</div>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="approvalrequired2" value="0"
															checked="checked" name="approvalRequired" class="custom-control-input">
														<label class="custom-control-label"
															for="approvalrequired2">No</label>
													</div>
													<%} %>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="d-block">Payment Gateway <span
														class="text-danger">*</span>
													</label>
													<%if(paymentGatewayRequired == 1) {%>	
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="paymentGateway1" value="1"
															name="paymentGatewayRequired" checked="checked"
															class="custom-control-input" onchange="showPrice()">
														<label class="custom-control-label" for="paymentGateway1">Enable</label>
													</div>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="paymentGateway2" value="0"
															 name="paymentGatewayRequired"
															class="custom-control-input" onchange="showPrice()">
														<label class="custom-control-label" for="paymentGateway2">Disable</label>
													</div>
													<%}else{ %>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="paymentGateway1" value="1"
															name="paymentGatewayRequired"
															class="custom-control-input" onchange="showPrice()">
														<label class="custom-control-label" for="paymentGateway1">Enable</label>
													</div>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="paymentGateway2" value="0"
															checked="checked" name="paymentGatewayRequired"
															class="custom-control-input" onchange="showPrice()">
														<label class="custom-control-label" for="paymentGateway2">Disable</label>
													</div>
													<%} %>
												</div>
											</div>
											
											<div class="col-md-6" id="price">
												<div class="form-group">
													<label class="d-block">Price <span
														class="text-danger">*</span></label> <input type="number"
														name="ticketPrice" id="ticketPrice"
														class="form-control" placeholder="" value="<%=eventDetails.get("ticketPrice")%>">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Start Date <span class="text-danger">*</span></label>
													<div class="cal-icon">
														<input type="text" name="eventStartDate" value="<%=eventDetails.get("eventStartDate")%>"
															id="eventStartDate" placeholder="" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>End Date <span class="text-danger">*</span></label>
													<div class="cal-icon">
														<input type="text" name="eventLastDate" id="eventLastDate"
															placeholder="" class="form-control" value="<%=eventDetails.get("eventLastDate")%>">
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Venue <span class="text-danger">*</span></label> <select
														id="venue" name="venue.venueId" class="form-control">
														<%
														for (int i = 0; i < venueList.size(); i++) {
															HashMap venue = (HashMap) venueList.get(i);
														%>

														<%
														if (venue.get("venueId").equals(eventVenue.get("venueId"))) {
														%>
														<option value="<%=venue.get("venueId")%>"
															selected="selected"><%=venue.get("venueName")%></option>
														<%
														} else {
														%>
														<option value="<%=venue.get("venueId")%>"><%=venue.get("venueName")%></option>
														<%
														}
														%>

														<%
														}
														%>
													</select>
												</div>
											</div>

										</div>

									</div>
									<div class="card-footer text-right mt-5">
										<button type="submit" class="btn btn-primary"
											onclick="return validateForm()">Save</button>
									</div>

								</form>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- jquery vendor -->

	<%@include file="../footerjsfile.jsp" %>
	<script>
       $('#eventStartDate').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            "format": "YYYY-MM-DD",
           // maxDate : dateToday // maxDate: (moment(new Date())) 
        });
        
        $('#eventLastDate').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            "format": "YYYY-MM-DD",
           	//minDate : dateToday // maxDate: (moment(new Date())) 
        }); 
       
        $("[data-toggle=tooltip]").tooltip();
    </script>
			
	<script>	
		$('#saveEvent').submit(function (event) { 
	        event.preventDefault();                 
	        var form = document.getElementById('saveEvent'); 
	        var formData = new FormData(form); 
	       
	        $.ajax({ 
	            url: '/organizer/myEvent/saveEvent', 
	            method: 'POST', 
	            data: formData, 
	            processData: false, 
	            contentType: false, 
	            success: function (response) {
	            	
	            	if(response.code == 1){
	            		swal("Yay !...", response.message, "success");	            		
	            		setTimeout(function () {	            	
	                        window.location.href = '/organizer/myEvent/event-list';
	                    }, 2000);             		
	            	}
	            	else{
	            		 swal("Oops...", response.message, "error");
	            		/*  setTimeout(function () {
	            			 location.reload();		                       
	                     }, 2000); */
	            	}	            	
	            }, 
	            error: function (xhr, status, error) {                   	
	                console.error(error); 
	                swal("Oops...", "Something Went Wrong", "error");	
	              //  location.reload();	
	                return false;
	            } 
	        }); 
	    }); 
	
	</script>

	<script>	
		function validateForm(){
			
			var companyId = $("#company").val();
			var branchId = $("#branch").val();
			var eventName = $("#eventName").val();
			var category = $("#category").val();
			var checkboxes = document.getElementsByName('audienceIdList');
			var isChecked = false;
			var country = $("#country").val();
			var phoneNo = $("#phoneNo").val();
			var email = $("#email").val();
			var eventStartDate = $("#eventStartDate").val();
			var eventLastDate = $("#eventLastDate").val();
			var venue = $("#venue").val();
			var payment = $('input[name="paymentGatewayRequired"]:checked').val();
			var ticketPrice = $("#ticketPrice").val();
			
			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				return false;
			}
			if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				return false;
			}
			if (eventName == "" || eventName == null) {
				swal("Oops...", "Please Enter Event Name !!", "error");
				$('#eventName').focus();
				return false;
			}
			if (category == "0") {
				swal("Oops...", "Please Select Category !!", "error");
				$('#category').focus();
				return false;
			}
			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					isChecked = true;
					break;
				}
			}
			if (!isChecked) {
				swal("Oops...", "Please Select at least one type of Audience !!", "error");
				$('.audiencecheckbox').focus();
				return false;
			}
			if (country == "0") {
				swal("Oops...", "Please Select Country !!", "error");
				$('#country').focus();
				return false;
			}
			if (phoneNo == "" || phoneNo == null) {
				swal("Oops...", "Please Enter Mobile No !!", "error");
				$('#phoneNo').focus();
				return false;
			}
			if (email == "" || email == null) {
				swal("Oops...", "Please Enter Email !!", "error");
				$('#email').focus();
				return false;
			}
			if (eventStartDate == "" || eventStartDate == null) {
				swal("Oops...", "Please Select Start Date !!", "error");
				$('#eventStartDate').focus();
				return false;
			}
			if (eventLastDate == "" || eventLastDate == null) {
				swal("Oops...", "Please Select Last Date !!", "error");
				$('#eventLastDate').focus();
				return false;
			}
			if (venue == "0") {
				swal("Oops...", "Please Select Venue !!", "error");
				$('#venue').focus();
				return false;
			}	
			if (payment == "1") {
				if (ticketPrice == "" || ticketPrice == null) {
					swal("Oops...", "Please Enter Price !!", "error");
					$('#ticketPrice').focus();
					return false;
				}else{
					return true;
				}
			}
			
			return true;
		}
	
	</script>
	
	<script>
	
	$(document).ready(function() {	
		
		<% if(paymentGatewayRequired == 1){%>
			$("#price").css("display", "block");		
		<%}else{%>
			$("#price").css("display", "none");		
		<%}%>
	});
	
	function showPrice(){
		
		if ($("input:radio[id='paymentGateway1']").is(":checked")) {
			$("#price").css("display", "block");
		} else {
			$("#price").css("display", "none");
		}
	}
	
	</script>

	<script>
	
	$(document).ready(function(){
		
		<% for(int k =0; k <eventAudience.size(); k++){ %>		
			console.log("<%=eventAudience.get(k).get("audienceId")%>");		
			
			$("#customCheck"+<%=eventAudience.get(k).get("audienceId")%>).prop('checked', true);
			
		<%}%>
		
	});
	
	</script> 
	
	<script>
		function backFun() {
			window.history.back();
		}
	</script>

	<script>
	$(document).ready(function() {
		var imageName = "<%=eventDetails.get("imageGalleryName")%>";
		
		console.log(imageName);
			if (imageName == null) {

				$('#delete_image').hide();
				$('#delete_image1').hide();
				$('#edit_image').hide();
				$('#add_image').show();
				$('#preview_image').hide();
				$('#preview_image1').hide();
				$('[name="imageGallery"]').hide();
				$('#removeImg').val(1);

				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$('#preview_image').show();
							$('#preview_image').attr('src', e.target.result);
							$('#add_image').hide();
							$('#edit_image').show();
							$('#delete_image').show();
							$('#removeImg').val(0);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}

				$('[name="imageGallery"]').change(function() {
					readURL(this);
				});

				$('#add_image,#edit_image').click(function(event) {
					$('[name="imageGallery"]').trigger('click');
				});

				$('#delete_image').click(function(event) {
					$('[name="imageGallery"]').val('');
					$('#preview_image').attr('src', '');
					$('#preview_image').hide();
					$('#delete_image').hide();
					$('#edit_image').hide();
					$('#add_image').show();
					$('#removeImg').val(1);
				});
			} else {
				$('#delete_image').show();
				$('#delete_image1').hide();
				$('#edit_image').show();
				$('#add_image').hide();
				$('#preview_image').show();
				$('#preview_image1').hide();
				$('[name="imageGallery"]').hide();
				$('#removeImg').val(0);

				function readURLBackgroundImage(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {

							$('#preview_image1').show();
							$('#preview_image1').attr('src', e.target.result);
							$('#add_image').hide();
							$('#edit_image').show();
							$('#delete_image').hide();
							$('#delete_image1').show();
							$('#preview_image').hide();
							$('#removeImg').val(0);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}

				$('[name="imageGallery"]').change(function() {
					readURLBackgroundImage(this);
				});

				$('#add_image,#edit_image').click(function(event) {
					$('[name="imageGallery"]').trigger('click');
				});

				$('#delete_image').click(function(event) {
					$('[name="imageGallery"]').val('');
					$('#preview_image').attr('src', '');
					$('#preview_image').hide();
					$('#delete_image').hide();
					$('#delete_image1').hide();
					$('#edit_image').hide();
					$('#add_image').show();
					$('#preview_image1').hide();
					$('#removeImg').val(1);
				});

				$('#delete_image1').click(function(event) {

					var image = $('#preview_image').attr('src');

					if (image == "") {
						$('[name="imageGallery"]').val('');
						$('#preview_image1').attr('src', '');
						$('#preview_image').hide();
						$('#delete_image1').hide();
						$('#delete_image').hide();
						$('#edit_image').hide();
						$('#add_image').show();
						$('#preview_image1').hide();
						$('#removeImg').val(1);
					} else {
						//$('[name="image"]').val(image);
						$('#preview_image1').attr('src', '');
						$('#preview_image').show();
						$('#delete_image1').hide();
						$('#delete_image').show();
						$('#edit_image').show();
						$('#add_image').hide();
						$('#preview_image1').hide();
						$('#removeImg').val(0);
					}

				});
			}

		});
	</script>

	<script>
		$('#imageGallery').on('change',function() {
			myfile = $(this).val();
			var ext = myfile.split('.').pop();
			if (ext == "jpg" || ext == "png" || ext == "jpeg") {

			} else {
				$('#imageGallery').val('');
				swal("Oops...","Please Select jpeg, jpg and png file !!","error");
				$('#edit_image,#add_image').focus();
				return false;
			}
		});			
	</script>
</body>

</html>