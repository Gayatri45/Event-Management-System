<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("eventParticipantReportList");
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
								<th class="border-bottom-0">Event Images</th>
								<th class="border-bottom-0">Event</th>
								<th class="border-bottom-0">Category</th>
								<th class="border-bottom-0">Venue</th>
								<th class="border-bottom-0">No Of Participant</th>
								<th class="border-bottom-0">Action</th>
							</tr>
						</thead>
						<tbody class="popup">

							<%
							for (int i = 0; i < tableData.size(); i++) {
								HashMap eventList = (HashMap) tableData.get(i);
								HashMap category = (HashMap) eventList.get("category");
								ArrayList<HashMap> audience = (ArrayList<HashMap>) eventList.get("audience");
								HashMap venue = (HashMap) eventList.get("venue");
							%>
							<tr>
								<td><%=(i + 1)%></td>
								<td>
									<div class="event-table-block">
										<div class="event-img">
											
											<% if(eventList.get("imageGalleryName") != null){																											
											%>
											
											<a href="#" title="Zoom" data-toggle="tooltip"> <img
												src="<%=MyUrl.uploadedUrl%>eventImages/<%=eventList.get("imageGalleryName")%>"
												alt="" style="height: 80px;">
											</a>
											<%}else{%>
											
											<%} %>
										</div>										
									</div>
								</td>
								
								<td>
									<div class="event-table-block">									
										<p class="m-0">
											<a href="#" title="View Event" data-toggle="tooltip"> <%=eventList.get("eventName")%>
											</a>
										</p>
									</div>
								</td>

								<%
								if (eventList.get("category") == null) {
								%>
								<td></td>
								<%
								} else {
								%>
								<td><%=category.get("categoryName") %>
								</td>
								<%
								}
								%>
							
								<%
								if (eventList.get("venue") == null) {
								%>
								<td></td>
								<%
								} else {
								%>
								<td><%=venue.get("venueName")%></td>
								<%
								}
								%>
								
								<td><%=eventList.get("noOfParticipant")%></td>
								
								<td>
									<div class="dropdown">
										<a href="javascript:void(0)"
											class="btn btn-sm btn-outline-primary" data-toggle="dropdown"
											aria-expanded="false"><i class="ti-angle-down"></i></a>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">											
											<li><a href="/organizer/participant/getParticipantByEventIdTableList?companyId=<%=eventList.get("companyId")%>&branchId=<%=eventList.get("branchId")%>&eventId=<%=eventList.get("eventId")%>""><i
													class="fa fa-users mr-2"></i>Participant</a></li>											
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

