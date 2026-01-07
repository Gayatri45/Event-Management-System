<!DOCTYPE html>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
<title>One Stop | Attendee Log</title>
 <%@include file="../headercssfile.jsp" %>
<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("attendeeLogDetails");
HashMap sl = null;
HashMap al = null; 
HashMap e = null;
if(!(tableData.isEmpty())){
	sl = tableData.get(0);
	al = (HashMap)sl.get("attendee");
	e = (HashMap)al.get("event");
}
Duration duration = null;
long hourPart = 0;
long minutesPart = 0;
long secondsPart = 0; 
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
								<% if(tableData.isEmpty()) {%>												
									<h1>Attendee Log </h1>			
								<%}else{ %>
									<h1>Attendee Log of <%=e.get("eventName")%></h1>	
								<%} %> 
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="container-fluid">
				<section id="main-content">

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
														<!-- <th class="border-bottom-0">Event Name</th> -->
														<th class="border-bottom-0">Start Date</th>
														<th class="border-bottom-0">End Date</th>
														<th class="border-bottom-0">Check In Date & Time</th>
														<th class="border-bottom-0">Check Out Date & Time</th>
														<th class="border-bottom-0">Total Duration</th> 
													</tr>
												</thead>
												<tbody class="popup">
													<%
													if (!(tableData.isEmpty())) {
													%>													
												 <%
													for (int i = 0; i < tableData.size(); i++) {
														HashMap stallLog = (HashMap) tableData.get(i);
														HashMap attendeeList = (HashMap) stallLog.get("attendee");
														HashMap event = (HashMap) attendeeList.get("event");
														if(stallLog != null){
														String participantStallCheckInDate = (String)stallLog.get("participantStallCheckInDate");
														String participantStallCheckInTime = (String)stallLog.get("participantStallCheckInTime");									
														String participantStallCheckOutDate = (String)stallLog.get("participantStallCheckOutDate");
																		
														
													        if(participantStallCheckOutDate != null){	
													        		String participantStallCheckOutTime = (String)stallLog.get("participantStallCheckOutTime");
													        	 	String dateString1 = participantStallCheckOutDate+'T'+participantStallCheckOutTime;
															        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
															        LocalDateTime dateTime1 = LocalDateTime.parse(dateString1, formatter);									     
															        
															        String dateString = participantStallCheckInDate+'T'+participantStallCheckInTime;
															        LocalDateTime dateTime = LocalDateTime.parse(dateString, formatter);
															     	
															       	duration = Duration.between(dateTime, dateTime1);
															        long seconds = duration.getSeconds();
	
															         hourPart = duration.toHoursPart();
															         minutesPart = duration.toMinutesPart();
															         secondsPart = duration.toSecondsPart();
													        }
														}
													%>
													<tr>
														<td><%=(i + 1)%></td>
														<td><%=attendeeList.get("firstName")%> <%=attendeeList.get("lastName")%></td>
														<td><%=attendeeList.get("email")%></td>
														<td><%=attendeeList.get("phoneNo")%></td>														
														<td><h6><span class="badge badge-primary p-1"><%=event.get("eventStartDate")%></span></h6></td>
														<td><h6><span class="badge badge-pink p-1"><%=event.get("eventLastDate")%></span></h6></td>
														
														<%if(stallLog != null){ %>
														<td><h6><span class="badge badge-info p-1"><%=stallLog.get("participantStallCheckInTime") %></span></h6>
														<h6><span class="badge badge-info p-1"><%=stallLog.get("participantStallCheckInDate") %></span></h6></td>													
														
														<% if(stallLog.get("participantStallCheckOutTime") == null){ %>
															<td></td>
															<td></td> 
														<%}else{ %>
															<td><h6><span class="badge badge-secondary p-1"><%=stallLog.get("participantStallCheckOutDate") %></span></h6>
															<h6><span class="badge badge-secondary p-1"><%=stallLog.get("participantStallCheckOutTime") %></span></h6></td>		
															<td><h6><span class="badge badge-warning p-1"><%=hourPart%> Hours <%=minutesPart%> Minutes <%=secondsPart%> Seconds</span></h6></td>												
														<%} %>
														<%} %>

														<!-- <td>
															<div class="dropdown">
																<a href="javascript:void(0)"
																	class="btn btn-sm btn-outline-primary"
																	data-toggle="dropdown" aria-expanded="false"><i
																	class="ti-angle-down"></i></a>
																<ul class="dropdown-menu dropdown-menu-right"
																	role="menu">
																	<li><a href="javascript:void(0)"
																		data-toggle="modal" data-target="#deletemodal"><i
																			class="ti-trash mr-2"></i>Delete </a></li>
																</ul>
															</div>
														</td> -->
													</tr>
													<%
													}
													%>
													<%
													} else {
													%>
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

</body>

</html>