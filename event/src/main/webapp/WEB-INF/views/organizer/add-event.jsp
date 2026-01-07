<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="google-site-verification"
	content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
<title>One Stop | Add Event</title>
<%@include file="../headercssfile.jsp"%>
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
ArrayList companyList = (ArrayList) request.getAttribute("companyList");
String firstName = (String) request.getAttribute("firstName");
String lastName = (String) request.getAttribute("lastName");
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
								<h1>Add a new event</h1>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="container-fluid">
				<section id="main-content">

					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div class="row d-flex align-items-center">
										<div class="col-md-6">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Company<span
													class="requiredFiled">*</span></label>
												<div class="col-md-8">
													<select id="company" name="company" required="true"
														class="form-control select2-single" tabindex="-1"
														aria-hidden="true">
														<option value="0" selected="selected">-Select
															Company-</option>
														<%
														HashMap companyDetails = null;
														for (int i = 0; i < companyList.size(); i++) {
															companyDetails = (HashMap) companyList.get(i);
														%>
														<option id="company"
															value="<%=companyDetails.get("companyId")%>"><%=companyDetails.get("companyName")%></option>
														<%
														}
														%>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Branch<span
													class="requiredFiled">*</span></label>
												<div class="col-md-9">
													<select name="branch" id="branch"
														class="form-control input-default"
														onchange="loadCategoryAudienceAndCountryList()">
														<option value="0" selected="selected">-Select
															Branch-</option>
													</select>
												</div>
											</div>
										</div>
										<!--  <div class="col-md-2">
												<div class="form-group row m-b-0">
													<div class="col-md-12">
														<button type="button" 
															class="btn btn-warning w-100 loader-position"
															>
															<i class="ti-filter"></i> &nbsp;Filter<span
																class="sm-loader" style="display: none"></span>
														</button>
													</div>
												</div>
											</div>  -->
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="card" id="queryData">

								<form name="saveEvent" id="saveEvent">
									<div class="card-body">
										<div class="alert alert-info alert-icon">
											<i class="fa fa-info-circle"></i> The fields preceded with a red * are mandatory
										</div>

										<input type="hidden" id="companyName" name="companyName">
										<input type="hidden" id="branchName" name="branchName">
										<input type="hidden" id="companyId" name="companyId">
										<input type="hidden" id="branchId" name="branchId"> 
										<input type="hidden" value="organizer" id="createdByRole" name="createdByRole"> 
										<input type="hidden" value="<%=firstName%> <%=lastName%>" id="createdByName" name="createdByName">

										<div class="row">

											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Event name <span
														class="text-danger">*</span> <span class="text-danger">
															<i class="fa fa-info-circle"></i>
													</span> <small> Editing the title after the event is saved
															won't change the event url </small>
													</label> <input type="text" id="eventName" name="eventName"
														required="required" maxlength="100" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Select Categories <span
														class="text-danger">*</span></label> <select class="form-control"
														name="category.categoryId" id="category">
													</select>
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Description </label>
													<textarea name="description" class="form-control desc"
														rows="6" placeholder="Description" id="description"
														spellcheck="true"></textarea>
													<div id="misspelled"></div>
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
													<div id="audienceList"></div>
												</div>
											</div>

											<!-- <div class="col-md-6">
												<div class="form-group">
													<label>Country <span class="text-danger">*</span> <small>
															<span class="text-danger"> <i
																class="fa fa-info-circle"></i>
														</span> Select the country that your event represents (ie: A
															movie's country of production)
													</small>
													</label> <select name="country" id="country" class="form-control"
														required="required" tabindex="-1" aria-hidden="true">
													</select>

												</div>
											</div> -->

											<div class="col-md-6">
												<div class="form-group">
													<label>Contact phone number <span
														class="text-danger">*</span> <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Enter the phone number to be called for inquiries
													</small>
													</label> <input type="text" id="phoneNo" name="phoneNo"
														maxlength="10" aria-describedby="event_phonenumber_help"
														class="form-control mobile numberonly"> <span
														class="error" style="color: red" id="phoneError"></span> <span
														class="error" style="color: red" id="mobileError"></span>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Contact email address <span
														class="text-danger">*</span> <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Enter the email address to be reached for inquiries
													</small>
													</label> <input type="text" id="email" name="email"
														aria-describedby="event_email_help" class="form-control">
													<span class="error" style="color: red" id="emailError"></span>
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label>Artists <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Enter the list of artists seperate by , that will perform
															in your event
													</small>
													</label> <input type="text" name="artists" id="artists"
														placeholder="" class="form-control">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Start Date <span class="text-danger">*</span></label>
													<div class="cal-icon">
														<input type="text" name="eventStartDate"
															id="eventStartDate" placeholder=""
															class="start-date form-control">
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>End Date <span class="text-danger">*</span></label>
													<div class="cal-icon">
														<input type="text" name="eventLastDate" id="eventLastDate"
															placeholder="" class="end-date form-control">
													</div>
												</div>
											</div>											
																						
											<div class="col-md-6">
													<label>Images gallery <small> <span
															class="text-danger"> <i class="fa fa-info-circle"></i>
														</span> Add other images that represent your event to be
															displayed as a gallery and Image size should be less than 1 MB
													</small>
													</label> 
													<div class="col-12">
														<input type="file" name="imageGallery" id="imageGallery"
															class="form-control">
														<button type="button" class="btn btn-info btn-sm"
															id="add_image">Upload Image</button>
														<div class="mb-2">
															<img src="" alt="" id="preview_image"
																style="height: 100px;" class="img-fluid">
														</div>
														<button type="button" class="btn btn-danger btn-sm"
															id="delete_image">remove</button>
													</div>
												</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="d-block">Approval Required <span
														class="text-danger">*</span>
													</label>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="approvalrequired1" value="1"
															name="approvalRequired" class="custom-control-input"
															checked="checked"> <label
															class="custom-control-label" for="approvalrequired1">Yes</label>
													</div>
													<div
														class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="approvalrequired2" value="0"
															name="approvalRequired" class="custom-control-input">
														<label class="custom-control-label"
															for="approvalrequired2">No</label>
													</div>

												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="d-block">Payment Gateway <span
														class="text-danger">*</span>
													</label>
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
												</div>
											</div>

											<div class="col-md-6" id="price">
												<div class="form-group">
													<label class="d-block">Price <span
														class="text-danger">*</span></label> <input type="number"
														name="ticketPrice" id="ticketPrice" value="0"
														class="form-control" placeholder="">
												</div>
											</div>
											
											<div class="col-md-6">
												<label>Venue <span class="text-danger">*</span></label>
												<div class="input-group">

													<select id="venue" name="venue.venueId"
														class="form-control">
														<option value=""></option>
													</select>

													<div class="input-group-append">
														<button class="btn btn-info rounded" id="addvenue"
															onclick="addVenue()" type="button">Add Veune</button>
													</div>
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

	<div class="modal fade" id="venueModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content p-2">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Venue</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form id="saveVenue" name="saveVenue" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="row">
							<input type="hidden" id="companyNameDetails" name="companyName">
							<input type="hidden" id="branchNameDetails" name="branchName">
							<input type="hidden" id="companyIdDetails" name="companyId">
							<input type="hidden" id="branchIdDetails" name="branchId">

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Name <span class="text-danger">*</span></label> <input
											type="text" class="form-control" name="venueName"
											id="venueName" placeholder="name ">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label class="form-label">Description</label>
										<textarea name="description" class="form-control desc"
											rows="6" placeholder="Description" id="description"
											spellcheck="">
                                                    </textarea>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label class="form-label">Type <span
											class="text-danger">*</span></label> <select
											name="venueType.venueTypeId" id="venueType"
											class="form-control select2-single select2-hidden-accessible"
											required="required" tabindex="-1" aria-hidden="true">
										</select>
									</div>
								</div>

								<div class="col-md-4">
									<div class="form-group">
										<label>Seated guests number</label> <input type="number"
											class="form-control" name="seatedGuestNo" id="seatedGuestNo"
											placeholder="" value="0">
									</div>
								</div>

								<div class="col-md-4">
									<div class="form-group">
										<label>Standing guests number</label> <input type="number"
											class="form-control" name="standingGuestNo"
											id="standingGuestNo" placeholder="" value="0">
									</div>
								</div>

								<div class="col-md-4">
									<div class="form-group">
										<label>Food and beverage details</label>
										<textarea class="form-control" name="foodAndBeverageDetails"
											id="foodAndBeverageDetails" rows="2">NA</textarea>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label class="d-block">Contact email <span
											class="text-danger">*</span><small> <span
												class="text-danger"> <i class="fa fa-info-circle"></i>
											</span> This email address will be used to receive the quote
												requests, make sure to mention it if you want to show the
												quote form
										</small>
										</label> <input type="text" class="form-control" name="contactEmail"
											id="emailvenue" placeholder=""> <span class="error"
											style="color: red" id="emailErrorvenue"></span>

									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Street address <span class="text-danger">*</span></label>
										<input type="text" class="form-control" name="streetAddress"
											id="streetAddress" placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Street address 2 </label> <input type="text"
											class="form-control" name="streetAddress2"
											id="streetAddress2" placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>City <span class="text-danger">*</span></label> <input
											type="text" class="form-control" name="city" id="city"
											placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Zip / Postal code <span class="text-danger">*</span></label>
										<input type="text" class="form-control" name="postalCode"
											id="postalCode" placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>State <span class="text-danger">*</span></label> <input
											type="text" class="form-control" name="state" id="state"
											placeholder="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Country <span class="text-danger">*</span></label> <input
											type="hidden" id="countryNameVenue" name="countryName">
										<input type="hidden" id="countryCodeVenue" name="countryCode">
										<input type="hidden" id="isdCodeVenue" name="isdCode"
											value="908"> <select name="countryId"
											id="countryVenue"
											class="form-control select2-single select2-hidden-accessible"
											required="required" tabindex="-1" aria-hidden="true">
											<option value="0" selected="selected">Select Country</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success"
							onclick="return validateVenue()">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- jquery vendor -->

	<%@include file="../footerjsfile.jsp"%>
	
	<script>
		$(document).ready(function() {
			$("#queryData").css("display", "none");
		});
	</script>

	<script>
		$("#branch").on('change', function() {

			var branchId = $("#branch").val();
			if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branchId').focus();
				$("#queryData").css("display", "none");
				return false;
			}
		});
	</script>

	<script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        $('.desc').wysihtml5();
        $(document).ready(function () {
           // var multipleCancelButton = new Choices('.choices-multiple-remove-button', {
             //   removeItemButton: true,
                //maxItemCount: 10,
                //searchResultLimit: 10,
                //renderChoiceLimit: 10
           /// });

        });
    </script>
		
	<script>
		jQuery(document).ready(function($) {
			$('#delete_image').hide();
			$('#edit_image').hide();
			$('[name="imageGallery"]').hide();
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#preview_image').show();
						$('#preview_image').attr('src', e.target.result);
						$('#add_image').hide();
						$('#edit_image').show();
						$('#delete_image').show();
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
			});
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
	
	<script>	
		function loadCategoryAudienceAndCountryList(){
			
			$('.sm-loader').show();
			var companyId = $("#companyId").val();
			var branchId = $("#branch").val();
			
			if(companyId == "0"){
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				$('.sm-loader').hide();		
				$("#queryData").css("display", "none");
				return false;
			}
			else if(branchId == 0){
				
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				$('.sm-loader').hide();		
				$("#queryData").css("display", "none");
				return false;
			}
			else{
				
				var urls = [ '/organizer/categoryAndAudience/getCategoryList',
					'/organizer/categoryAndAudience/getAudienceList',
					'/eventApi/getCountryList',
					'/organizer/venue/getVenueList'];
	
				var requests = [];
	
				$.each(urls, function(index, url) {
					var request = $.ajax({
						url : url,
						method : 'POST',
						data : {
							companyId : companyId,
							branchId : branchId
						}
					});
	
					requests.push(request);
				});

				$.when.apply($, requests).done( function(categoryList, audienceList, countryList, venueList) {
						
						$('.sm-loader').hide();
						$("#queryData").css("display", "block");				
						
						$("#category").children().remove();
						$("#category").append('<option value='+0+'>- Select -</option>');
						for (var i = 0; i < categoryList[0].length; i++) {
							$("#category").append('<option value='+categoryList[0][i].categoryId+'>'+ categoryList[0][i].categoryName+ '</option>');
						} 

						$("#country").children().remove();
						$("#country").append('<option value='+0+'>- Select -</option>');
						for (var i = 0; i < countryList[0].length; i++) {
							$("#country").append('<option value='+countryList[0][i].countryName+'>'+ countryList[0][i].countryName + '</option>');
						}		
						
						$("#audienceList").children().remove();	
						for (var i = 0; i < audienceList[0].length; i++) {
						$("#audienceList").append("<div class='custom-control custom-checkbox custom-control-inline'>"+
                                "<input type='checkbox' class='custom-control-input audiencecheckbox' name='audienceIdList' id='customCheck"+audienceList[0][i].audienceId+"' value='"+audienceList[0][i].audienceId+"'>"+
                                " <label class='custom-control-label' for='customCheck"+audienceList[0][i].audienceId+"'>"+audienceList[0][i].audienceName+"</label></div>");
						}					
						
						$("#venue").children().remove();
						$("#venue").append('<option value='+0+'>- Select -</option>');
						for (var i = 0; i < venueList[0].length; i++) {
							$("#venue").append('<option value='+venueList[0][i].venueId+'>'+ venueList[0][i].venueName + '</option>');
						}
						
				}).fail(function() {
					console.error("One or more requests failed");
				});
			}			
		}
	
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
	                //location.reload();	
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
			//var country = $("#country").val();
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
			/* if (country == "0") {
				swal("Oops...", "Please Select Country !!", "error");
				$('#country').focus();
				return false;
			} */
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
		$("#price").css("display", "none");
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

	<script>
  $('.start-date').datepicker({
	  templates: {
	    leftArrow: '<i class="fa fa-chevron-left"></i>',
	    rightArrow: '<i class="fa fa-chevron-right"></i>'
	  },
	  format: "yyyy-mm-dd",
	  startDate: new Date(),
	  keyboardNavigation: false,
	  autoclose: true,
	  todayHighlight: true,
	  disableTouchKeyboard: true,
	  orientation: "bottom auto"
	});

	$('.end-date').datepicker({
	  templates: {
	    leftArrow: '<i class="fa fa-chevron-left"></i>',
	    rightArrow: '<i class="fa fa-chevron-right"></i>'
	  },
	  format: "yyyy-mm-dd",
	  startDate: moment().add(1, 'days').toDate(),
	  keyboardNavigation: false,
	  autoclose: true,
	  todayHighlight: true,
	  disableTouchKeyboard: true,
	  orientation: "bottom auto"

	});


	$('.start-date').datepicker().on("changeDate", function () {
	  var startDate = $('.start-date').datepicker('getDate');
	  var oneDayFromStartDate = moment(startDate).add(1, 'days').toDate();
	  $('.end-date').datepicker('setStartDate', oneDayFromStartDate);
	  $('.end-date').datepicker('setDate', oneDayFromStartDate);
	});

	$('.end-date').datepicker().on("show", function () {
	  var startDate = $('.start-date').datepicker('getDate');
	  $('.day.disabled').filter(function (index) {
	    return $(this).text() === moment(startDate).format('D');
	  }).addClass('active');
	});
  </script>

	<script>
    
    function addVenue(){
    	
    	var companyId = $("#company").val();
		var branchId = $("#branch").val();
		var companyName = $('#company').find(":selected").text();
		var branchName = $('#branch').find(":selected").text();
		
    	if(companyId == "0"){
			swal("Oops...", "Please Select Company Name !!", "error");
			$('#companyId').focus();
			$('.sm-loader').hide();		
			$("#queryData").css("display", "none");
			return false;
		}
		else if(branchId == 0){
			
			swal("Oops...", "Please Select Branch Name !!", "error");
			$('#branch').focus();
			$('.sm-loader').hide();		
			$("#queryData").css("display", "none");
			return false;
		}
		else{
			$("#companyNameDetails").val(companyName);
			$("#branchNameDetails").val(branchName);
			$("#companyIdDetails").val(companyId);
			$("#branchIdDetails").val(branchId);
			
			var urls = [ '/organizer/categoryAndAudience/getVenueTypeList',
				'/eventApi/getCountryList'];

			var requests = [];

			$.each(urls, function(index, url) {
				var request = $.ajax({
					url : url,
					method : 'POST',
					data : {
						companyId : companyId,
						branchId : branchId
					}
				});

				requests.push(request);
			});

			$.when.apply($, requests).done( function(venueTypeList, countryList) {
					
					$('.sm-loader').hide();
					$("#queryData").css("display", "block");
					
					console.log(venueTypeList);
					console.log(audienceList);
					console.log(countryList);
					
					$("#venueType").children().remove();
					$("#venueType").append('<option value='+0+'>- Select -</option>');
					for (var i = 0; i < venueTypeList[0].length; i++) {
						$("#venueType").append('<option value='+venueTypeList[0][i].venueTypeId+'>'+ venueTypeList[0][i].name+ '</option>');
					} 

					$("#countryVenue").children().remove();
					$("#countryVenue").append('<option value='+0+'>- Select -</option>');
					for (var i = 0; i < countryList[0].length; i++) {
						$("#countryVenue").append('<option value='+countryList[0][i].countryId+'>'+ countryList[0][i].countryName + '</option>');
					}					
					
			}).fail(function() {
				console.error("One or more requests failed");
			});
			$('#venueModal').modal('toggle');
		}
    	
    }
    
    </script>

	<script>
	
	$("#countryVenue").on('change', function(){
		
		var companyId = $("#company").val();
		var branchId = $("#branch").val();
		var countryId = $("#countryVenue").val();
		
		$.ajax({
			type : 'POST',
			url : '/eventApi/getCountryList',
			data : {
				companyId : companyId,
				branchId : branchId
			},
			dataType : "text",
			success : function(countryList) {
				
				var parsedData = JSON.parse(countryList);
				console.log(parsedData[0].isdCode);
				
				for (var i = 0; i < parsedData.length; i++) {
					
					if(countryId == parsedData[i].countryId){
						
						$("#isdCodeVenue").val(parsedData[i].isdCode);
						$("#countryNameVenue").val(parsedData[i].countryName);
						$("#countryCodeVenue").val(parsedData[i].countryCode);
						
					}else{
						
					}
					
				}
			}
								
			});
				
	});	
	
	</script>

	<script>	
		function validateVenue(){
			
			var companyId = $("#companyIdDetails").val();
			var branchId = $("#branchIdDetails").val();
			var venueName = $("#venueName").val();
			var venueType = $("#venueType").val();
			var contactEmail = $("#emailvenue").val();			
			var streetAddress = $("#streetAddress").val();
			var city = $("#city").val();
			var postalCode = $("#postalCode").val();
			var state = $("#state").val();
			var country = $("#countryVenue").val();			
			
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
			if (venueName == "" || venueName == null) {
				swal("Oops...", "Please Enter Venue Name !!", "error");
				$('#venueName').focus();
				return false;
			}
			if (venueType == "0") {
				swal("Oops...", "Please Select Venue Type !!", "error");
				$('#venueType').focus();
				return false;
			}			
			if (contactEmail == "" || contactEmail == null) {
				swal("Oops...", "Please Enter Email !!", "error");
				$('#emailvenue').focus();
				return false;
			}
			if (streetAddress == "" || streetAddress == null) {
				swal("Oops...", "Please Enter Address !!", "error");
				$('#streetAddress').focus();
				return false;
			}
			if (city == "" || city == null) {
				swal("Oops...", "Please Enter City !!", "error");
				$('#city').focus();
				return false;
			}
			if (postalCode == "" || postalCode == null) {
				swal("Oops...", "Please Enter Postal Code !!", "error");
				$('#postalCode').focus();
				return false;
			}
			if (state == "" ||  state == null) {
				swal("Oops...", "Please Enter State !!", "error");
				$('#state').focus();
				return false;
			}	
			if (country == "0") {
				swal("Oops...", "Please Select Country !!", "error");
				$('#countryVenue').focus();
				return false;
			} 
		}
	
	</script>

	<script>
	
	$('#emailvenue').keyup(function() {
		var email = $('#emailvenue').val();
		isValidEmail1(email);
	});

	function isValidEmail1(email) {
		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		if (emailRegex.test(email)) {
			$("#emailErrorvenue").text("");
		} else {
			$("#emailErrorvenue").text("Invalid email format");
			return false;
		}
	}
	
	</script>

	<script>
	
		$('#saveVenue').submit(function (event) { 
			
	        event.preventDefault();                 
	        var form = document.getElementById('saveVenue'); 
	        var formData = new FormData(form); 
	        
	        console.log(formData);
	       
	        $.ajax({ 
	            url: '/organizer/venue/saveVenue', 
	            method: 'POST', 
	            data: formData, 
	            processData: false, 
	            contentType: false, 
	            success: function (response) {
	            	
	            	console.log(response.result);
	            	if(response.code == 1){
	            		swal("Yay !...", response.message, "success");	            			            		 	            	
	            		$("#venue").append('<option value='+response.result.venueId+' selected="selected">'+ response.result.venueName + '</option>');	            	 	
	            		$('#venueModal').modal('toggle'); 
	            	}else{
	            		 swal("Oops...", response.message, "error");
	            		/*  setTimeout(function () {
	            			 location.reload();		                       
	                     }, 2000); */
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

</body>

</html>