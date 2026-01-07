<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("attendeeLogDetails");
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
								<th class="border-bottom-0" width="30">Sl.</th>
								<th class="border-bottom-0">Attendee Name</th>
								<th class="border-bottom-0">Email</th>
								<th class="border-bottom-0">Mobile No</th>
								<th class="border-bottom-0">Event Name</th>
								<th class="border-bottom-0">Event Start Date</th>
								<th class="border-bottom-0">Event End Date</th>
								<th class="border-bottom-0">Check In Date & Time</th>
								<th class="border-bottom-0">Check Out Date & Time</th>
								<th class="border-bottom-0">Action</th>
							</tr>
						</thead>
						<tbody class="popup">

							<%
							for (int i = 0; i < tableData.size(); i++) {
								HashMap attendeeLogList = (HashMap) tableData.get(i);								
								HashMap attendeeList = (HashMap) attendeeLogList.get("attendee");
								HashMap event = (HashMap)attendeeList.get("event");
							%>
							<%if(tableData == null){ %>
							
							<%}else{ %>
							<tr>
								<td><%=(i+1)%></td>
							 	 <td><%=attendeeList.get("firstName") %> <%=attendeeList.get("lastName") %></td>
								<td><%=attendeeList.get("email")%></td> 
								<td><%=attendeeList.get("phoneNo")%></td>
								<td>
									 <div class="event-table-block">										
										<p class="m-0">
											<a title="Event"> <%=event.get("eventName")%>
											</a>
										</p>
									</div> 
								</td>
								<td><h6><span class="badge badge-primary p-1"><%=event.get("eventStartDate")%></span></h6></td>
								<td><h6><span class="badge badge-warning p-1"><%=event.get("eventLastDate")%></span></h6></td>
								 
								<td><h6><span class="badge badge-info p-1"><%=attendeeLogList.get("checkInDate") %></span></h6><h6><span class="badge badge-info p-1"><%=attendeeLogList.get("checkIntime") %></span></h6></td>						
								
								<% if(attendeeLogList.get("checkOutTime") == null){ %>
									<td></td>
								<%}else{ %>
									<td><h6><span class="badge badge-secondary p-1"><%=attendeeLogList.get("checkOutDate") %></span></h6><h6><span class="badge badge-secondary p-1"><%=attendeeLogList.get("checkOutTime") %></span></h6></td>								
								<%} %>
								
								 <td>
									<div class="dropdown">
										<a href="javascript:void(0)"
											class="btn btn-sm btn-outline-primary" data-toggle="dropdown"
											aria-expanded="false"><i class="ti-angle-down"></i></a>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">	
										
											<li><a href="/organizer/attendee/getAttendeeActivitiesTableList?companyId=<%=attendeeLogList.get("companyId")%>&branchId=<%=attendeeLogList.get("branchId")%>&attendeeLogId=<%=attendeeLogList.get("attendeeLogId")%>" 
											><i class="fa-solid fa-chart-line"></i>Activities
											</a></li>																														
											<!-- <li><a href="javascript:void(0)" data-toggle="modal"
												data-target="#deletemodal"><i class="ti-trash mr-2"></i>Delete
											</a></li> -->
										</ul>
									</div>
								</td>  
							</tr>
							<%} %>
							<%
							}
							%> 

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
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
