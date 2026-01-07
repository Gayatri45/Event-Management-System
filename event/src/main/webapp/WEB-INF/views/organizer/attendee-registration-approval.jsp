<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
<title>Attendee Registration Approval</title>
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
ArrayList companyList = (ArrayList) request.getAttribute("companyList");
%>
</head>

<body>
	<%@include file="sidebar.jsp"%>

	<%@include file="header.jsp"%>
	<!--<script> history.forward();</script>-->

	<div class="content-wrap">
		<div class="main">
			<div class="page-header">
				<div class="container-fluid">
					<div class="row d-flex align-items-center">
						<div class="col-md-6">
							<div class="page-title">
								<h1>Attendee Request</h1>
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
										<div class="col-md-5">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Company<span
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
										<div class="col-md-5">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Branch<span
													class="requiredFiled">*</span></label>
												<div class="col-md-9">
													<select name="branch" id="branch"
														class="form-control input-default">
														<option value="0">-Select-</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group row m-b-0">
												<div class="col-md-12">
													<button type="button" onclick="loadAttendeeApprovalList()"
														class="btn btn-warning w-100 loader-position">
														<i class="ti-filter"></i> &nbsp;Filter<span
															class="sm-loader" style="display: none"></span>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div id="queryData">
					<div id="table-container">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body mt-5">
										<div class="table-responsive">
											<table id="bootstrap-data-table-export"
												class="table table-vcenter text-nowrap border-bottom"
												id="hr-table">
												<thead>
															<tr>
																<th>Name</th>
																<th>Event</th>
																<th>Venue</th>
																<!-- <th>No of Person</th> -->
																<th>Event Date</th>
																<th>Action</th>
															</tr>
														</thead>
														<tbody>

														</tbody>
													</table>
												</div>
											</div>
										</div>
										<!-- /# card -->
									</div>
									<!-- /# column -->
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
		function loadAttendeeApprovalList() {

			$('.sm-loader').show();

			var companyId = $("#company").val();
			var branchId = $("#branch").val();

			if (companyId == "0") {
				swal("Oops...", "Please Select School Name !!", "error");
				$('#companyId').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				return false;
			} else if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				return false;
			} else {

				$.ajax({
					url : '/organizer/attendee/getAttendeeApprovedTableList', // JSP page to fetch data
					type : 'POST',
					data : {
						companyId : companyId,
						branchId : branchId
					},
					success : function(data) {
						$('.sm-loader').hide();
						$("#queryData").css("display", "block");
						$('#table-container').html(data); // Update the table content
					},
					error : function() {
						alert('Error fetching data.');
					}
				});
			}
		}
	</script>
	
	<script>
		function approveRequest(attendeeId) {

			var companyId = $("#company").val();
			var branchId = $("#branch").val();
			var attendeeApprovalStatus = 2;

			$.ajax({
				type : 'POST',
				url : "/organizer/attendee/approveOrRejectRequest",
				data : {
					companyId : companyId,
					branchId : branchId,
					attendeeId : attendeeId,
					attendeeApprovalStatus : attendeeApprovalStatus
				},
				dataType : "text",
				success : function(response) {
					
					var parsedData = JSON.parse(response);
					console.log(parsedData);
					
					if (parsedData.code ==  1) {
						swal("Yay !...", "Approved Successfully", "success");
						setTimeout(function() {
							location.reload();
						}, 2000);
					} else {
						swal("Oops...", "Something Went Wrong", "error");
						setTimeout(function() {
							//location.reload();
						}, 2000);
					} 

				}

			});
		}
	</script>

	<script>
		function rejectedRequest(attendeeId) {

			var companyId = $("#company").val();
			var branchId = $("#branch").val();
			var attendeeApprovalStatus = -1;

			$.ajax({
				type : 'POST',
				url : "/organizer/attendee/approveOrRejectRequest",
				data : {
					companyId : companyId,
					branchId : branchId,
					attendeeId : attendeeId,
					attendeeApprovalStatus : attendeeApprovalStatus
				},
				dataType : "text",
				success : function(response) {
					
					
					var parsedData = JSON.parse(response);
					console.log(parsedData);
					if (parsedData.code == 1) {
						swal("Ooh !...", "Rejected", "warning");
						setTimeout(function() {
							location.reload();
						}, 2000);
					} else {
						swal("Oops...", "Something Went Wrong", "error");
						setTimeout(function() {
							//location.reload();
						}, 2000);
					} 
				}

			});
		}
	</script>

</body>

</html>