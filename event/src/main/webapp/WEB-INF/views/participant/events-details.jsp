<!DOCTYPE html>
<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="google-site-verification"
	content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
<title>One Stop | Event Details</title>
 <%@include file="../headercssfile.jsp" %>
<style>
.gallerys-img ul li img {
	width: 130px;
}

.gallerys-img ul {
	display: flex;
}

.gallerys-img ul li {
	border: 2px solid #33a5f0;
	margin: 13px 4px;
}
</style>

<%
HashMap eventDetails = (HashMap) request.getAttribute("eventDetails");
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
								<h1>
									<%=eventDetails.get("eventName")%>
								</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<section id="main-content">
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h5>
										<i class="fa fa-file-text-o "></i> General information
									</h5>
									<div class="table-responsive">
										<table id="bootstrap-data-table-export"
											class="table table-vcenter text-nowrap border-bottom"
											id="hr-table">
											<tbody class="popup">
												<!--  <tr>
                                                    <th class="border-bottom-0"><b>Status</b> </th>
                                                    <td><span class="btn btn-info">On sale</span></td>
                                                </tr> -->
												<tr>
													<th class="border-bottom-0"><b> Title </b></th>
													<td><%=eventDetails.get("eventName")%></td>
												</tr>
												<tr>
                                                    <th class="border-bottom-0"><b>Creation date</b> </th>
                                                    <td><h6><span class="badge badge-pink p-1"><%=eventDetails.get("createdDate")%></span></h6></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Event Start date</b> </th>
                                                    <td><h6><span class="badge badge-primary p-1"><%=eventDetails.get("eventStartDate")%></span></h6></td>
                                                </tr> 
                                                  <tr>
                                                    <th class="border-bottom-0"><b>Event End date</b> </th>
													<td><h6><span class="badge badge-warning p-1"><%=eventDetails.get("eventLastDate")%></span></h6></td>
                                                </tr> 
												<!-- <tr>
                                                    <th class="border-bottom-0"><b>Views</b> </th>
                                                    <td>11043 view(s)</td>
                                                </tr> -->
												<!-- <tr>
                                                    <th class="border-bottom-0"><b>Added to favorites by</b> </th>
                                                    <td>5 user(s)</td>
                                                </tr> -->
												<%
												HashMap category = (HashMap) eventDetails.get("category");
												%>
												<tr>
													<th class="border-bottom-0"><b>Category</b></th>
													<td><%=category.get("categoryName")%></td>
												</tr>
												<!--  <tr>
                                                    <th class="border-bottom-0"><b>Languages</b> </th>
                                                    <td>English, Icelandic, Georgian, Turkish</td>
                                                </tr> -->
												<!--   <tr>
                                                    <th class="border-bottom-0"><b>Subtitles</b> </th>
                                                    <td>English, Scots/Gaelic, Icelandic, Occitan</td>
                                                </tr> -->
												<%
												ArrayList<HashMap> audience = (ArrayList<HashMap>) eventDetails.get("audience");
												%>
												<tr>
													<th class="border-bottom-0"><b>Audiences</b></th>
													<td>[ <%
													for (int a = 0; a < audience.size(); a++) {
													%> <%
													 HashMap audienceDetails = (HashMap) audience.get(a);
													 %> <%=audienceDetails.get("audienceName")%>, <%
													 }
													 %>]
													</td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Country</b></th>
													<td><%=eventDetails.get("country")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Artists</b></th>
													<td><%=eventDetails.get("artists")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Description</b></th>
													<td><%=eventDetails.get("description")%></td>
												</tr>
												<!-- <tr>
                                                    <th class="border-bottom-0"><b>Year</b> </th>
                                                    <td>2019</td>
                                                </tr> -->
												<!--  <tr>
                                                    <th class="border-bottom-0"><b>Youtube video</b> </th>
                                                    <td>https://www.youtube.com/watch?v=n0OFH4xpPr4</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Publicly show attendees</b> </th>
                                                    <td>Yes</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Allow attendees to leave reviews</b> </th>
                                                    <td>Yes</td>
                                                </tr> -->



											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h5>
										<i class="fa fa-picture-o" aria-hidden="true"></i> Images
									</h5>
									<div class="cover-img text-center">
										<a
											href="<%=MyUrl.uploadedUrl%>eventImages/<%=eventDetails.get("imageGalleryName")%>"
											data-fancybox="gallery"> <img
											src="<%=MyUrl.uploadedUrl%>eventImages/<%=eventDetails.get("imageGalleryName")%>"
											class="img-fluid" alt="">
										</a>
									</div>
									<!-- <div class="gallerys-img">
                                            <ul>
                                                <li><a href="/images/event1.jpg" data-fancybox="gallery"> 
                                                    <img src="/images/event1.jpg" class="img-fluid" alt=""> </a></li>
                                                <li><a href="/images/event2.jpg" data-fancybox="gallery"> 
                                                    <img src="/images/event2.jpg" class="img-fluid" alt=""> </a></li>
                                                <li><a href="/images/event3.jpg" data-fancybox="gallery"> 
                                                    <img src="/images/event3.jpg" class="img-fluid" alt=""> </a></li>
                                                <li><a href="/images/event4.jpg" data-fancybox="gallery"> 
                                                    <img src="/images/event4.jpg" class="img-fluid" alt=""> </a></li>
                                                <li><a href="/images/event5.jpg" data-fancybox="gallery"> 
                                                    <img src="/images/event5.jpg" class="img-fluid" alt=""> </a></li>
                                            </ul>
                                    </div> -->
								</div>
							</div>
						</div>



						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h5>
										<i class="fa fa-map-marker"></i> Venue
									</h5>
									<div class="table-responsive">
										<table id="bootstrap-data-table-export"
											class="table table-vcenter text-nowrap border-bottom"
											id="hr-table">
											<tbody class="popup">
												<!--  <tr>
                                                    <th class="border-bottom-0"><b>Event date 1</b> </th>
                                                    <td></td>
                                                </tr> -->
												<%
												HashMap venue = (HashMap) eventDetails.get("venue");
												%>
												<tr>
													<th class="border-bottom-0"><b> Venue Name</b></th>
													<td><%=venue.get("venueName")%></td>
												</tr>
												<%
												HashMap venueType = (HashMap) venue.get("venueType");
												%>
												<tr>
													<th class="border-bottom-0"><b> Venue Type</b></th>
													<td><%=venueType.get("name")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Seated Guest No</b></th>
													<td><%=venue.get("seatedGuestNo")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Standing Guest No</b></th>
													<td><%=venue.get("standingGuestNo")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Food And Beverage</b></th>
													<%
													if (venue.get("foodAndBeverageDetails").equals(null)) {
													%>
													<td>NA</td>
													<%
													} else {
													%>
													<td><%=venue.get("foodAndBeverageDetails")%></td>
													<%
													}
													%>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Email</b></th>
													<td><%=venue.get("contactEmail")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Address</b></th>
													<td><%=venue.get("streetAddress")%>, <%
													if (!venue.get("streetAddress2").equals(null)) {
													%>
														<%=venue.get("streetAddress2")%> <%
														 }
														 %> , <%=venue.get("city")%>,
														<%=venue.get("postalCode")%>, <%=venue.get("state")%>, <%=venue.get("countryName")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Description</b></th>
													<td><%=venue.get("description")%></td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>


						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h5>@ Contact</h5>
									<div class="table-responsive">
										<table id="bootstrap-data-table-export"
											class="table table-vcenter text-nowrap border-bottom"
											id="hr-table">
											<tbody class="popup">
												<!--   <tr>
                                                    <th class="border-bottom-0"><b>External link</b> </th>
                                                    <td>	https://example.com</td>
                                                </tr> -->
												<tr>
													<th class="border-bottom-0"><b> Email </b></th>
													<td><%=eventDetails.get("email")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Phone number</b></th>
													<td><%=eventDetails.get("phoneNo")%></td>
												</tr>
												<!--  <tr>
                                                    <th class="border-bottom-0"><b>Facebook</b> </th>
                                                    <td>	https://www.facebook.com</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Twitter</b> </th>
                                                    <td>https://twitter.com</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Google plus</b> </th>
                                                    <td>https://plus.google.com</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Instagram</b> </th>
                                                    <td>https://www.instagram.com</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Linkedin</b> </th>
                                                    <td>https://www.linkedin.com</td>
                                                </tr> -->
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

	<%@include file="../footerjsfordetails.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css">

	<script>
		Fancybox.bind("[data-fancybox]", {

		});
	</script>


</body>

</html>