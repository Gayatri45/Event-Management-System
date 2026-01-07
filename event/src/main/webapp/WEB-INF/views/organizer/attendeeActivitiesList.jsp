<!DOCTYPE html>
<%@page import="java.time.Period"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
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
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("attendeeActivitiesDetails");
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
								<h1>Attendee Activities</h1>																	
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
													<th class="border-bottom-0">Stall Name</th>
													<th class="border-bottom-0">Stall's Owner Name</th>
													<th class="border-bottom-0">Check In Date & Time</th>
													<th class="border-bottom-0">Check Out Date & Time</th>
													<th class="border-bottom-0">Total Duration</th>								
												</tr>
											</thead>
											<tbody class="popup">
																
														<% if(tableData == null){ %>
														
														<%}else{ %>
													<%
													for (int i = 0; i < tableData.size(); i++) {
														HashMap stallList = (HashMap) tableData.get(i);
														HashMap participant = (HashMap) stallList.get("participant");
														String participantStallCheckInDate = (String)stallList.get("participantStallCheckInDate");
														String participantStallCheckInTime = (String)stallList.get("participantStallCheckInTime");									
														String participantStallCheckOutDate = (String)stallList.get("participantStallCheckOutDate");
																		
														Duration duration = null;
														Period period = null;
														long hourPart = 0;
														long minutesPart = 0;
													    long secondsPart = 0;
												        if(participantStallCheckOutDate != null){	
												        		String participantStallCheckOutTime = (String)stallList.get("participantStallCheckOutTime");
												        	 	String dateString1 = participantStallCheckOutDate+'T'+participantStallCheckOutTime;
														        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
														        LocalDateTime dateTime1 = LocalDateTime.parse(dateString1, formatter1);									     
														        
														        String dateString = participantStallCheckInDate+'T'+participantStallCheckInTime;
														        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
														        LocalDateTime dateTime = LocalDateTime.parse(dateString, formatter);
														     	
														       	duration = Duration.between(dateTime, dateTime1);
														        long seconds = duration.getSeconds();
					
														         hourPart = duration.toHoursPart();
														         minutesPart = duration.toMinutesPart();
														         secondsPart = duration.toSecondsPart();
												        }
												        									
													%>
													<tr>
														<td><%=(i+1)%></td>
														<td><%=participant.get("stallName") %></td>
														<td><%=participant.get("participantName") %></td>
														
														<td><h6><span class="badge badge-info p-1"><%=stallList.get("participantStallCheckInDate") %></span></h6>
														<h6><span class="badge badge-info p-1"><%=stallList.get("participantStallCheckInTime") %></span></h6></td>							
													
													<% if(stallList.get("participantStallCheckOutTime") == null){ %>
														<td></td>
													 	<td></td> 
													<%}else{ %>								
														<td><h6><span class="badge badge-secondary p-1"><%=stallList.get("participantStallCheckOutDate") %></span></h6>
														<h6><span class="badge badge-secondary p-1"><%=stallList.get("participantStallCheckOutTime") %></span></h6></td>
														<td><h6><span class="badge badge-warning p-1"><%=hourPart%> Hours <%=minutesPart%> Minutes <%=secondsPart%> Seconds</span></h6></td>
													<%} %>
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

	<%@include file="../footerjsfile.jsp" %>

	
	<script>
		function backFun() {
			window.history.back();
		}
	</script>
</body>

</html>