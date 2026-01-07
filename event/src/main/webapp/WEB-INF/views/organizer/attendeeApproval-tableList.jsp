<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("attendeeApprovalRequest");
%>

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
								<th class="border-bottom-0">Start Date</th>
								<th class="border-bottom-0">End Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (tableData == null) {
							%>

							<%
							} else {
							%>

							<%
							for (int i = 0; i < tableData.size(); i++) {
								HashMap attendeeDetails = (HashMap) tableData.get(i);
								HashMap event = (HashMap) attendeeDetails.get("event");
								HashMap venue = (HashMap) attendeeDetails.get("venue");
							%>

							<tr role="row">
								<td><%=attendeeDetails.get("firstName")%> <%=attendeeDetails.get("lastName")%></td>
								<td><%=event.get("eventName")%></td>
								<td><%=venue.get("venueName")%></td>
								<%-- <td><%=attendeeDetails.get("noOfPerson")%></td> --%>
								<td><h6><span class="badge badge-primary p-1"><%=event.get("eventStartDate")%></span></h6></td>
								<td><h6><span class="badge badge-warning p-1"><%=event.get("eventLastDate")%></span></h6></td>

								<td nowrap=''><a data-toggle="modal"
									data-target="#exampleModaledit" style="cursor: pointer;"
									title="Click to Update User" class="btn-md display-4"
									onclick="approveRequest(<%=attendeeDetails.get("attendeeId")%>)">
										<i class="fa fa-check-circle-o text-success"
										data-toggle="tooltip" title="" data-original-title="Approve "></i>
								</a> <a class="btn-sm display-4" data-toggle="modal"
									data-target="#staticBackdrop"
									onclick="rejectedRequest(<%=attendeeDetails.get("attendeeId")%>)">
										<i class="fa fa-times-circle-o text-danger"
										data-toggle="tooltip" title="" data-original-title="Reject"></i>
								</a></td>
							</tr>

							<%
							}
							%>
							<%
							}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--  /# card -->
	</div>
	<!--   /# column -->
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/data-table/datatables.min.js"></script>
<script src="/js/data-table/dataTables.buttons.min.js"></script>
<script src="/js/data-table/buttons.flash.min.js"></script>
<script src="/js/data-table/jszip.min.js"></script>
<script src="/js/data-table/pdfmake.min.js"></script>
<script src="/js/data-table/buttons.colVis.min.js"></script>
<script src="/js/data-table/vfs_fonts.js"></script>
<script src="/js/data-table/buttons.html5.min.js"></script>
<script src="/js/data-table/buttons.print.min.js"></script>
<script src="/js/data-table/datatables-init.js"></script>

