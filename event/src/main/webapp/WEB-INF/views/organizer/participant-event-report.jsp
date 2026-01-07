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
<title>One Stop | Participant Event Report</title>
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
								<h1>Participant Event Report</h1>
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
													<button type="button" onclick="loadParticipantReport()"
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
													<th class="border-bottom-0" width="30">Sl.</th>
													<th class="border-bottom-0">Attendee Name</th>
													<th class="border-bottom-0">Email</th>
													<th class="border-bottom-0">Mobile No</th>
													<th class="border-bottom-0">Event Name</th>
													<th class="border-bottom-0">Start Date - End Date</th>
													<th class="border-bottom-0">Approval</th>
													<th class="border-bottom-0">Payment</th>
													<th class="border-bottom-0">Action</th>
												</tr>
												</thead>
												<tbody class="popup">
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					 </div>
				</section>
			</div>
		</div>
	</div>
	<!-- jquery vendor -->

	<!-- Modal -->
	<div class="modal fade" id="deletemodal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Delete Events</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure want to delete this?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>

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
		function loadParticipantReport() {

			$('.sm-loader').show();

			var companyId = $("#company").val();
			var branchId = $("#branch").val();

			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
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
					url : '/organizer/report/getParticipantEventReportTableList', // JSP page to fetch data
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
	
	
</body>

</html>