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
<title>One Stop | Add Participant</title>
  <%@include file="../headercssfile.jsp" %>
<%
ArrayList companyList = (ArrayList) request.getAttribute("companyList");
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
								<h1>Add a new Participant</h1>
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
												<label class="control-label col-md-3">Company <span
													class="requiredFiled">*</span></label>
												<div class="col-md-8">
													<select id="company" name="company" required="true"
														class="form-control select2-single" tabindex="-1"
														aria-hidden="true">
														<option value="0" selected="selected">-Select Company-</option>
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
													<select name="branch" id="branch" onchange="loadData()"
														class="form-control input-default">
														<option value="0">-Select-</option>
													</select>
												</div>
											</div>
										</div>
										<!-- <div class="col-md-2">
											<div class="form-group row m-b-0">
												<div class="col-md-12">
													<button type="button" 
														class="btn btn-warning w-100 loader-position">
														<i class="ti-filter"></i> &nbsp;Filter<span
															class="sm-loader" style="display: none"></span>
													</button>
												</div>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="card"  id="queryData">

								<form name="saveParticipant" id="saveParticipant">

									<input type="hidden" id="companyName" name="companyName">
									<input type="hidden" id="branchName" name="branchName">
									<input type="hidden" id="companyId" name="companyId"> <input
										type="hidden" id="branchId" name="branchId">

									<div class="card-body">

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Participant's Name <span class="text-danger">*</span></label>
													<input type="text" class="form-control"
														name="participantName" id="participantName"
														placeholder="name">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Event <span
														class="text-danger">*</span></label> <select name="event.eventId"
														id="event"
														class="form-control select2-single select2-hidden-accessible"
														required="required" tabindex="-1" aria-hidden="true">

													</select>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group">
													<label>Stall Name <span class="text-danger">*</span></label>
													<input type="text" class="form-control" name="stallName"
														id="stallName" placeholder=" ">
												</div>
											</div>

											<div class="col-md-8">
												<div class="form-group">
													<label>Stall Description</label>
													<textarea class="form-control"
														name="stallDescription" id="stallDescription"
														placeholder=" " rows="2"></textarea>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="d-block">Participant Email <span
														class="text-danger">*</span>
													</label> <input type="text" class="form-control"
														name="participantEmail" id="email"
														placeholder="" />
														<span class="error" style="color: red" id="emailError"></span>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="d-block">Participant Mobile No <span
														class="text-danger">*</span>
													</label> <input type="text" class="form-control mobile numberonly"
														name="participantPhoneNo" maxlength="10" id="phoneNo"
														placeholder="" />
														 <span class="error" style="color: red"
											id="phoneError"></span> <span class="error"
											style="color: red" id="mobileError"></span>

												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label>Participant Address </label>
													<textarea class="form-control"
														name="participantAddress" id="participantAddress"
														placeholder=""></textarea>
												</div>
											</div>
																			
											<div class="col-md-4">
													<label for="exampleFormControlTextarea1">Profile Pic </label>
													<div class="col-12 text-center">

														<input type="file" name="profilePic" id="profilePic"
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
		jQuery(document).ready(function($) {
			$('#delete_image').hide();
			$('#edit_image').hide();
			$('[name="profilePic"]').hide();
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

			$('[name="profilePic"]').change(function() {
				readURL(this);
			});

			$('#add_image,#edit_image').click(function(event) {
				$('[name="profilePic"]').trigger('click');
			});

			$('#delete_image').click(function(event) {
				$('[name="profilePic"]').val('');
				$('#preview_image').attr('src', '');
				$('#preview_image').hide();
				$('#delete_image').hide();
				$('#edit_image').hide();
				$('#add_image').show();
			});
		});
	</script>

	<script>
		$('#profilePic').on('change',function() {
			myfile = $(this).val();
			var ext = myfile.split('.').pop();
			if (ext == "jpg" || ext == "png" || ext == "jpeg") {

			} else {
				$('#profilePic').val('');
				swal("Oops...","Please Select jpeg, jpg and png file !!","error");
				$('#edit_image,#add_image').focus();
				return false;
			}
		});
	</script>
		
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
		function loadData() {

			$('.sm-loader').show();
			var companyId = $("#company").val();
			var branchId = $("#branch").val();
			
			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#company').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				return false;
			} else if (branchId == 0) {

				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				return false;
			} else {

				$.ajax({
					type : 'POST',
					url : "/organizer/myEvent/getEventList",
					data : {
						companyId : companyId,
						branchId : branchId
					},
					dataType : "text",
					success : function(eventDetailsList) {

						var parsedData = JSON.parse(eventDetailsList);

						$('.sm-loader').hide();
						$("#queryData").css("display", "block");

						$("#event").children().remove();
						$("#event").append('<option value='+0+'>- Select -</option>');
						for (var i = 0; i < parsedData.length; i++) {
							$("#event").append('<option value='+parsedData[i].eventId+'>'+ parsedData[i].eventName+ '</option>');
						}

					}

				});
			}
		}
	</script>

	<script>
		$('#saveParticipant').submit(function(event) {

			event.preventDefault();
			var form = document.getElementById('saveParticipant');
			var formData = new FormData(form);

			$.ajax({
				url : '/organizer/participant/saveParticipant',
				method : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					
					console.log(response);
					
					if (response.code == 1) {
						swal("Yay !...", response.message, "success");
						setTimeout( function() {
							window.location.href = '/organizer/participant/participant-list';
						}, 2000);
					} else {
						swal("Oops...", response.message, "error");
						/* setTimeout(function() {
							location.reload();
						}, 2000); */
					}  
				},
				error : function(xhr, status, error) {
					console.error(error);
					swal("Oops...", "Something Went Wrong", "error");
					//location.reload();
					return false; 
				}
			});
		});							
	</script>

	<script>
		function validateForm() {

			var companyId = $("#company").val();
			var branchId = $("#branch").val();
			var participantName = $("#participantName").val();
			var event = $("#event").val();
			var participantEmail = $("#email").val();
			var stallName = $("#stallName").val();
			var participantPhoneNo = $("#phoneNo").val();

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
			if (participantName == "" || participantName == null) {
				swal("Oops...", "Please Enter Participant's Name !!", "error");
				$('#participantName').focus();
				return false;
			}
			if (event == "0") {
				swal("Oops...", "Please Select Event !!", "error");
				$('#event').focus();
				return false;
			}
			if (stallName == "" || stallName == null) {
				swal("Oops...", "Please Enter Stall's Name !!", "error");
				$('#stallName').focus();
				return false;
			}
			if (participantEmail == "" || participantEmail == null) {
				swal("Oops...", "Please Enter Participant Email !!", "error");
				$('#participantEmail').focus();
				return false;
			}
			if (participantPhoneNo == "" || participantPhoneNo == null) {
				swal("Oops...", "Please Enter Participant Mobile No !!",
						"error");
				$('#participantPhoneNo').focus();
				return false;
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
</body>

</html>