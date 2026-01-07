<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("venueList");
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
								<th class="border-bottom-0">Venue Name</th>
								<th class="border-bottom-0">Venue Type</th>
								<th class="border-bottom-0">Email</th>
								<th class="border-bottom-0">Address</th>
								<th class="border-bottom-0">Action</th>
							</tr>
						</thead>
						<tbody class="popup">


							<%
							for (int i = 0; i < tableData.size(); i++) {
								HashMap venueList = (HashMap) tableData.get(i);
								HashMap venueType = (HashMap) venueList.get("venueType");
							%>
							<tr>
								<td><%=(i + 1)%></td>
								
								<td><%=venueList.get("venueName")%></td>
								<td><%=venueType.get("name")%></td>
								<td><%=venueList.get("contactEmail")%></td>
								<td><%=venueList.get("streetAddress")%>, <%=venueList.get("city")%>,
									<%=venueList.get("state")%>, <%=venueList.get("countryName")%>
								</td>
								
								<td>
									<div class="dropdown">
										<a href="javascript:void(0)"
											class="btn btn-sm btn-outline-primary" data-toggle="dropdown"
											aria-expanded="false"><i class="ti-angle-down"></i></a>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">
											<li><a href="/organizer/venue/edit-venues?venueId=<%=venueList.get("venueId")%>"><i
													class="fa fa-edit mr-2"></i>Edit</a></li>										
											<li><a href="/organizer/venue/venues-details?venueId=<%=venueList.get("venueId")%>"><i
													class="fa fa-file-text mr-2"></i>Details</a></li>
											<!-- <li><a href="javascript:void(0)" data-toggle="modal"
												data-target="#editvenueModal"><i
													class="fa fa-trash mr-2"></i>Delete</a></li> -->
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