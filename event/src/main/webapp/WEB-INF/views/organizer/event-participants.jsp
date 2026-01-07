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
<title>One Stop | Event Participants</title>
 <%@include file="../headercssfile.jsp" %>

<%
ArrayList<HashMap> tableData = (ArrayList<HashMap>) request.getAttribute("participantList");
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
								<%
								if (tableData.isEmpty()) {
								%>
								<h1>Event Name</h1>
								<%
								} else {
								%>
								<%
								HashMap attende = (HashMap) tableData.get(0);
								HashMap ev = (HashMap) attende.get("event");
								%>

								<h1>
									Participant List of
									<%=ev.get("eventName")%>
								</h1>
								<%
								}
								%>
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
													<th class="border-bottom-0">Participant Image</th>
													<th class="border-bottom-0">Participant Name</th>
													<th class="border-bottom-0">Email</th>
													<th class="border-bottom-0">Mobile No</th>
													<!-- <th class="border-bottom-0">Event Name</th> -->
													<th class="border-bottom-0">Stall Name</th>
													<th class="border-bottom-0">Description</th>
												</tr>
											</thead>
											<tbody class="popup">

												<%
												if (tableData.isEmpty()) {
												%>

												<%
												} else {
												%>

												<%
												for (int i = 0; i < tableData.size(); i++) {
													HashMap participantList = (HashMap) tableData.get(i);
													HashMap event = (HashMap) participantList.get("event");
												%>
												<tr>
													<td><%=(i + 1)%></td>
													<td><div class="event-table-block">
														<div class="event-img">
																<%
																if (participantList.get("profilePicName") != null) {
																%>

																<a href="#" title="Zoom" data-toggle="tooltip"> <img
																	src="<%=MyUrl.uploadedUrl%>participantImages/<%=participantList.get("profilePicName")%>"
																	alt="" style="height: 80px;">
																</a>
																<%
																} else {
																%>
																<a href="#" title="Zoom" data-toggle="tooltip"> <img
																	src="/images/user.svg" alt="Image" style="height: 80px">
																</a>
																<%
																}
																%>
															
														</div>
														</div></td>
													<td><%=participantList.get("participantName")%></td>
													<td><%=participantList.get("participantEmail")%></td>
													<td><%=participantList.get("participantPhoneNo")%></td>
													<%-- <td>
														<div class="event-table-block">
															<p class="m-0">
																<a title="Event"> <%=event.get("eventName")%>
																</a>
															</p>
														</div>
													</td> --%>
													<td><%=participantList.get("stallName")%></td>
													<td><%=participantList.get("stallDescription")%></td>

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
						</div>
					</div>

				</section>
			</div>
		</div>
	</div>


	<%@include file="../footerjsfile.jsp" %>
	
	<script>
		function backFun() {
			window.history.back();
		}
	</script>
	
</body>

</html>