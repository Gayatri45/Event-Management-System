<!DOCTYPE html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onestop.codeitsoft.event.entity.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.onestop.codeitsoft.event.entity.Participant"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="google-site-verification"
	content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
<title>One Stop | Dashboard</title>
<!-- ================= Favicon ================== -->
<!-- Standard -->
<link rel="shortcut icon" href="/images/32x32.png" />
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144" href="/images/144x144.png" />
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114" href="/images/114x114.png" />
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72" href="/images/72x72.png" />
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57" href="/images/57x57.png" />
<!-- Style-->
<link href="/css/font-awesome.min.css" rel="stylesheet">
<!--<link href="/css/line-awesome/line-awesome.css" rel="stylesheet">-->
<link href="/css/themify-icons.css" rel="stylesheet">
<link href="/css/data-table/buttons.bootstrap.min.css" rel="stylesheet" />
<link href="/css/menubar/sidebar.css?v=1.7" rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/sweetalert/sweetalert.css" rel="stylesheet">
<link href="/css/helper.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/event-admin.css" rel="stylesheet">
<link href="/css/core.css?v=1.27" rel="stylesheet">
<style>
.pbar-flex-1 {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
}

.progress {
  flex-grow: 1;
}

.pbar-mr-2 {
  margin-right: .2rem;
  display: block;
}
</style>

<%
HashMap organizerDashboardData = (HashMap) request.getAttribute("organizerDashboardData");
int companyList = (Integer) request.getAttribute("companyList");
int branchList = (Integer) request.getAttribute("branchList");
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("eventList");
/* List participantList = (ArrayList<HashMap>) organizerDashboardData.get("participantList");
HashMap participant;
List attendeList = (ArrayList<HashMap>) organizerDashboardData.get("attendeList");
HashMap attendee;
int attendeeLog = (Integer)organizerDashboardData.get("noOfAttendeeLog");
int nonattendeeLog = 100-attendeeLog;
List<Integer> attendeeLogList = (ArrayList) organizerDashboardData.get("attendeeLogList");
int attendeeLogd;  */
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
						<div class="col">
							<div class="page-title">
								<h1>Event Management Dashboard</h1>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="container-fluid">
				<section id="main-content">
					<div class="row">
						<div class="col-lg-3">
							<div class="card shadow-none">
								<div class="stat-widget-four">
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-heading dropdown">
												<span class="cursor-pointer" data-toggle="dropdown"
													aria-expanded="false"> Events added </span>
											</div>
											<h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=organizerDashboardData.get("noOfEvent")%></h4> 

										</div>
									</div>
									<div class="stat-icon bg-success">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="card shadow-none">
								<div class="stat-widget-four">
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-heading">Completed events</div>
											<h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=organizerDashboardData.get("noOfCompletedEvent")%></h4> 
										</div>
									</div>
									<div class="stat-icon bg-primary">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="card shadow-none">
								<div class="stat-widget-four">
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-heading dropdown">
												<span class="cursor-pointer" data-toggle="dropdown"
													aria-expanded="false"> Upcoming events </span>
											</div>
										 <h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=organizerDashboardData.get("noOfUpcomingEvent")%></h4> 
										</div>
									</div>
									<div class="stat-icon bg-info">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="card shadow-none">
								<div class="stat-widget-four">
									<div class="stat-content d-flex">
										<div class="text-left dib">
											<div class="stat-heading dropdown">
												<span class="cursor-pointer" data-toggle="dropdown"
													aria-expanded="false"> Live Event </span>
											</div>
											 <h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=organizerDashboardData.get("noOfLiveEvent")%></h4>
										</div>
									</div>
									<div class="stat-icon bg-danger">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card shadow-none">
								<div class="stat-widget-four">
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-heading dropdown">
												<span class="cursor-pointer" data-toggle="dropdown"
													aria-expanded="false"> Total Company </span>
											</div>
											<h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=companyList%></h4>

										</div>
									</div>
									<div class="stat-icon bg-warning">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card shadow-none">
								<div class="stat-widget-four">
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-heading dropdown">
												<span class="cursor-pointer" data-toggle="dropdown"
													aria-expanded="false"> Total Branch </span>
											</div>
											<h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=branchList%></h4>

										</div>
									</div>
									<div class="stat-icon bg-secondary">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Events summary</h4>

								</div>
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
													<th class="border-bottom-0">Participant</th>
													<th class="border-bottom-0">Attendee</th>
													<th class="border-bottom-0">Attend Event Attendee</th>
													<th class="border-bottom-0">Not Attend Event Attendee</th>
												</tr>
											</thead>
											<tbody class="popup">
												<%
												for (int i = 0; i < tableData.size(); i++) {
													HashMap eventList = (HashMap) tableData.get(i);	
													int noOfAttendee = (Integer)eventList.get("noOfAttendee");
													int noOfAttendeLog = (Integer)eventList.get("noOfAttendeLog");
													
													double attendeePer = 0.0;
													double nonAttendeePer = 0.0;
													String attendeePerFormatValue = "0";
													String nonAttendeePerFormatValue = "0";
													if(noOfAttendeLog != 0){
														attendeePer = ((double)noOfAttendeLog/(double)noOfAttendee)*100;
														nonAttendeePer = 100 - attendeePer;
														attendeePerFormatValue = String.format("%.1f", attendeePer);
														nonAttendeePerFormatValue = String.format("%.1f", nonAttendeePer);
													}												
													
												%>
												<tr>
													<td><%=(i + 1)%></td>
													<td>
														<div class="event-table-block">
															<div class="event-img">

																<%
																if (eventList.get("imageGalleryName") != null) {
																%>
																<a href="#" title="Zoom" data-toggle="tooltip"> <img
																	src="<%=MyUrl.uploadedUrl%>eventImages/<%=eventList.get("imageGalleryName")%>"
																	alt="" style="height: 80px;">
																</a>
																<%
																} else {
																%>
																<%
																}
																%>
															</div>
														</div>
													</td>

													<td>
														<div class="event-table-block">
															<p class="m-0">
																<a href="#"><%=eventList.get("eventName")%> </a>
															</p>
														</div>
													</td>
							
													<td><div class="progress-bar progress-bar-striped progress-bar-animated bg-info" 
          													role="progressbar" style="width: <%=eventList.get("noOfParticipant")%>%;"  
          													aria-valuenow="<%=eventList.get("noOfParticipant")%>" aria-valuemin="0" aria-valuemax="100"><%=eventList.get("noOfParticipant")%>%</div>   
														<div class="ml-2"><%=eventList.get("noOfParticipant")%>%</div></td>													
													
													<td><div class="progress-bar progress-bar-striped progress-bar-animated bg-success" 
          													role="progressbar" style="width: <%=eventList.get("noOfAttendee")%>%;" 
          													aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"><%=eventList.get("noOfAttendee")%>%</div>   
														<div class="ml-2"><%=eventList.get("noOfAttendee")%>%</div></td>		
												
													<td><div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" 
          													role="progressbar" style="width: <%=attendeePerFormatValue%>%;" 
          													aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"><%=attendeePerFormatValue%>%</div>   
														<div class="ml-2"><%=attendeePerFormatValue%>%</div> 
													</td>													
												
													<td>											
														<div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" 
          													role="progressbar" style="width: <%=nonAttendeePerFormatValue%>%;" 
          													aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"><%=nonAttendeePerFormatValue%>%</div>   
														<div class="ml-2"><%=nonAttendeePerFormatValue%>%</div>         																																									  												
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
				</section>
			</div>
		</div>
	</div>
	
	<!-- jquery vendor -->

	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.nanoscroller.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/menubar/sidebar.js"></script>
	<script src="/js/preloader/pace.min.js"></script>
	<script src="/js/sweetalert/sweetalert.min.js"></script>
	<script src="/js/polyfill.min.js"></script>
	<script src="/js/scripts.js"></script>
	<script src="/js/data-table/datatables.min.js"></script>
	<script src="/js/data-table/datatables-init.js"></script>

	<script>
		$('[data-toggle="tooltip"]').tooltip();
	</script>


</body>

</html>