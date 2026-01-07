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
<title>One Stop | Event Attendees</title>
 <%@include file="../headercssfile.jsp" %>
<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("attendeeList");
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
								<% if(tableData.isEmpty()){ %>
									<h1>Event Name</h1>									
								<%}else{ %>
									<% HashMap attende = (HashMap) tableData.get(0);
									HashMap ev = (HashMap) attende.get("event");%>
									
									<h1>Attendee List of <%=ev.get("eventName")%>  </h1>
								<%} %> 
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
								<!-- <th class="border-bottom-0">Event Name</th> -->
								<!-- <th class="border-bottom-0">Start Date - End Date</th> -->
								<th class="border-bottom-0">Approval</th>
								<th class="border-bottom-0">Payment</th>
								<!-- <th class="border-bottom-0">Action</th> -->
							</tr>
						</thead>
						<tbody class="popup">
						
							<% if(tableData.isEmpty()){ %>
							
							<%}else{ %>

								<%
								for (int i = 0; i < tableData.size(); i++) {
									HashMap attendeeList = (HashMap) tableData.get(i);
									HashMap event = (HashMap) attendeeList.get("event");
									int attendeeApprovalStatus = (Integer) attendeeList.get("attendeeApprovalStatus");
									int paymentGatewayRequired = (Integer) attendeeList.get("payment");
								%>
								<tr>
									<td><%=(i + 1)%></td>
									<td><%=attendeeList.get("firstName") %> <%=attendeeList.get("lastName") %></td>
									<td><%=attendeeList.get("email") %></td>
									<td><%=attendeeList.get("phoneNo") %></td>
									<%-- <td>
										 <div class="event-table-block">										
											<p class="m-0">
												<a title="Event"> <%=event.get("eventName")%>
												</a>
											</p>
										</div> 
									</td> --%>
									<%-- <td><%=event.get("eventStartDate")%> - <%=event.get("eventLastDate")%> --%>
	
									
									<%
									if (attendeeApprovalStatus == 0) {
									%>
									<td><span class="badge badge-secondary">No Approval Required</span></td>
									<%
									}else if (attendeeApprovalStatus == 1) {
									%>
									<td><span class="badge badge-warning">Approval Processing..</span></td>
									<%
									} else if (attendeeApprovalStatus == 2) {
									%>
									<td><span class="badge badge-success">Approved</span></td>
									<% }else  {
									%>
									<td><span class="badge badge-danger">Rejected</span></td>
									<%
									}
									%>	
									
									
									<%
									if (paymentGatewayRequired == 0) {
									%>
									<td><span class="badge badge-secondary">No Payment Required</span></td>
									<%
									}else if (paymentGatewayRequired == 1) {
									%>
									<td><span class="badge badge-warning">Payment Processing..</span></td>
									<%
									} else {
									%>
									<td><span class="badge badge-success">Payment Done</span></td>
									<%
									}
									%>
									
								</tr>
								<%
								}
								%>
							
							<%} %>

						</tbody>
					</table>
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
<!-- 	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script> -->

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
		function loadAttendee() {

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
					url : '/organizer/attendee/getAttendeeTableList', // JSP page to fetch data
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
		function backFun() {
			window.history.back();
		}
	</script>
</body>

</html>