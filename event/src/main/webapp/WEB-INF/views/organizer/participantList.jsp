<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("participantList");
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
								<th class="border-bottom-0">Participant Image</th>
								<th class="border-bottom-0">Participant Name</th>
								<th class="border-bottom-0">Email</th>
								<th class="border-bottom-0">Mobile No</th>
								<th class="border-bottom-0">Event Name</th>
								<th class="border-bottom-0">Start Date</th>
								<th class="border-bottom-0">End Date</th>
								<th class="border-bottom-0">Stall Name</th>
								<th class="border-bottom-0">Action</th>
							</tr>
						</thead>
						<tbody class="popup">

							<%
							for (int i = 0; i < tableData.size(); i++) {
								HashMap participantList = (HashMap) tableData.get(i);
								HashMap event = (HashMap) participantList.get("event");							
							%>
							<tr>
								<td><%=(i + 1)%></td>
								<td><div class="event-table-block">
										<div class="event-img">
											
											<% if(participantList.get("profilePicName") != null){															
												//String imgUrl = MyUrl.uploadedUrl+"eventImages/"+eventList.get("imageGalleryName"); 
											%>
											
											<a href="#" title="Zoom" data-toggle="tooltip"> <img
												src="<%=MyUrl.uploadedUrl%>participantImages/<%=participantList.get("profilePicName")%>"
												alt="" style="height: 80px;">
											</a>
											<%}else{%>
											 <a href="#" title="Zoom" data-toggle="tooltip"> <img
												src="/images/user.svg"
												alt="Image" style="height: 80px">
											</a> 
											<%} %>
										</div>										
									</div></td>
						 		<td><%=participantList.get("participantName") %></td>
								<td><%=participantList.get("participantEmail") %></td>
								<td><%=participantList.get("participantPhoneNo") %></td>
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
								<td><%=participantList.get("stallName") %></td>
								<td>
									<div class="dropdown">
										<a href="javascript:void(0)"
											class="btn btn-sm btn-outline-primary" data-toggle="dropdown"
											aria-expanded="false"><i class="ti-angle-down"></i></a>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">											
											<li><a href="/organizer/participant/participant-details?participantId=<%=participantList.get("participantId")%>"><i
													class="fa fa-file-text mr-2"></i>Details</a></li>
													
											<li><a href="/organizer/participant/edit-participant?participantId=<%=participantList.get("participantId")%>"><i
													class="ti-pencil mr-2"></i>Edit</a></li>	
																							
											<!-- <li><a href="javascript:void(0)" data-toggle="modal"
												data-target="#deletemodal"><i class="ti-trash mr-2"></i>Delete
											</a></li> -->
										</ul>
									</div>
								</td>
							</tr> 
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
