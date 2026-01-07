<!DOCTYPE html>
<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="google-site-verification" content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
    <title>One Stop | Attendee Details</title>
      <%@include file="../headercssfile.jsp" %>
    <style>
        .gallerys-img ul li img {
            width: 130px;
        }
        .gallerys-img ul{
            display: flex;
        }
        .gallerys-img ul li {
            border: 2px solid #33a5f0;
    margin: 13px 4px;
        }
    </style>
    
<%
HashMap attendeeDetails = (HashMap) request.getAttribute("attendeeDetails");
HashMap event = (HashMap)attendeeDetails.get("event");
%>
</head>

<body>
      <%@include file="sidebar.jsp" %>

	<%@include file="header.jsp" %>
	
    <div class="content-wrap">
        <div class="main">
            <div class="page-header">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col">
                            <div class="page-title">
                                <h1> <%=attendeeDetails.get("firstName")%> <%=attendeeDetails.get("lastName")%> </h1>
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
                                <div class="card-body">
                                    <h5><i class="fa fa-file-text-o "></i> General information</h5>
                                    <div class="table-responsive">
                                        <table id="bootstrap-data-table-export"
                                            class="table table-vcenter text-nowrap border-bottom" id="hr-table">
                                            <tbody class="popup">
                                            
                                                <tr>
                                                    <th class="border-bottom-0"><b> Attendee Name </b> </th>
                                                    <td><%=attendeeDetails.get("firstName")%> <%=attendeeDetails.get("lastName")%></td>
                                                </tr>                                              
                                                <tr>
                                                    <th class="border-bottom-0"><b>Mobile No</b> </th>
                                                    <td><%=attendeeDetails.get("phoneNo")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Email</b> </th>
                                                    <td><%=attendeeDetails.get("email")%></td>
                                                </tr> 
                                                  <tr>
                                                    <th class="border-bottom-0"><b>Date of Birth</b> </th>
                                                    <td><%=attendeeDetails.get("dob")%></td>
                                                </tr> 
                                                 <tr>
													<th class="border-bottom-0"><b>Gender</b></th>
													<td><%=attendeeDetails.get("gender")%></td>
												</tr>
												
												<tr>
													<th class="border-bottom-0"><b>Address</b></th>
													<td><%=attendeeDetails.get("address")%></td>
												</tr>
												
												<%int attendeeApprovalStatus = (Integer)attendeeDetails.get("attendeeApprovalStatus");%> 
                                               <tr>
                                                    <th class="border-bottom-0"><b>Approval Status</b> </th>
                                                    <%
													if (attendeeApprovalStatus == 0) {
													%>
													<td><span class="badge badge-secondary">No Approval Required</span></td>
													<%
													}else if (attendeeApprovalStatus == 1) {
													%>
													<td><span class="badge badge-warning">Approval Processing..</span></td>
													<%
													} else if (attendeeApprovalStatus == 2) {
													%>
													<td><span class="badge badge-success">Approved</span></td>
													<% }else  {
													%>
													<td><span class="badge badge-danger">Rejected</span></td>
													<%
													}
													%>	
                                                </tr>      
                                                
                                                	<%int paymentGatewayRequired = (Integer)attendeeDetails.get("payment");%> 
                                               <tr>
                                                    <th class="border-bottom-0"><b>Approval Status</b> </th>
                                                    <%
													if (paymentGatewayRequired == 0) {
													%>
													<td><span class="badge badge-secondary">No Payment Required</span></td>
													<%
													}else if (paymentGatewayRequired == 1) {
													%>
													<td><span class="badge badge-warning">Payment Processing..</span></td>
													<%
													} else {
													%>
													<td><span class="badge badge-success">Payment Done</span></td>
													<%
													}
													%>
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
                                    <h5><i class="fa fa-calendar"></i> Event</h5> 
                                    <div class="table-responsive">
                                        <table id="bootstrap-data-table-export"
                                            class="table table-vcenter text-nowrap border-bottom" id="hr-table">
                                            <tbody class="popup">
                                              <tr>
                                                    <th class="border-bottom-0"><b> Title </b> </th>
                                                    <td><%=event.get("eventName")%></td>
                                                </tr>                                              
                                                <tr>
                                                    <th class="border-bottom-0"><b>Creation date</b> </th>
                                                   <td><h6><span class="badge badge-pink p-1"><%=event.get("createdDate")%></span></h6></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Event Start date</b> </th>
                                                   <td><h6><span class="badge badge-primary p-1"><%=event.get("eventStartDate")%></span></h6></td>
                                                </tr> 
                                                  <tr>
                                                    <th class="border-bottom-0"><b>Event End date</b> </th>
                                                    <td><h6><span class="badge badge-warning p-1"><%=event.get("eventLastDate")%></span></h6></td>
                                                </tr> 
                                               <%
												HashMap category = (HashMap) event.get("category");
												%>
												<tr>
													<th class="border-bottom-0"><b>Category</b></th>
													<td> <%=category.get("categoryName")%>
													</td>
												</tr>
                                                   <%
												ArrayList<HashMap> audience = (ArrayList<HashMap>) event.get("audience");
												%>
												<tr>
													<th class="border-bottom-0"><b>Audiences</b></th>
													<td>[ <%
													for (int a = 0; a < audience.size(); a++) {
													%> <%
														 HashMap audienceDetails = (HashMap) audience.get(a);
														 %>
														<%=audienceDetails.get("audienceName")%>, <%
														}
														%>]
													</td>
												</tr> 
												
												  <tr>
													<th class="border-bottom-0"><b>Country</b></th>
													<td><%=event.get("country")%></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Artists</b></th>
													<td><%=event.get("artists")%></td>
												</tr>
                                               <tr>
                                                    <th class="border-bottom-0"><b>Description</b> </th>
                                                    <td><%=event.get("description")%></td>
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
                                    <h5><i class="fa fa-picture-o" aria-hidden="true"></i> Images</h5>
                                    <div class="cover-img text-center">
                                        <a href="<%=MyUrl.uploadedUrl%>eventImages/<%=event.get("imageGalleryName")%>" data-fancybox="gallery"> 
                                            <img src="<%=MyUrl.uploadedUrl%>eventImages/<%=event.get("imageGalleryName")%>" class="img-fluid" alt=""> </a>
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
                                    <h5><i class="fa fa-map-marker"></i> Venue </h5>
                                    <div class="table-responsive">
                                        <table id="bootstrap-data-table-export"
                                            class="table table-vcenter text-nowrap border-bottom" id="hr-table">
                                            <tbody class="popup">
                                               <!--  <tr>
                                                    <th class="border-bottom-0"><b>Event date 1</b> </th>
                                                    <td></td>
                                                </tr> -->
                                                <%HashMap venue = (HashMap)attendeeDetails.get("venue");%>
                                                <tr>
                                                    <th class="border-bottom-0"><b> Venue Name</b> </th>
                                                    <td><%=venue.get("venueName")%></td>
                                                </tr>  
                                                <%HashMap venueType = (HashMap)venue.get("venueType"); %>
                                                 <tr>
                                                    <th class="border-bottom-0"><b> Venue Type</b> </th>
                                                    <td><%=venueType.get("name")%></td>
                                                </tr>                                               
                                                <tr>
                                                    <th class="border-bottom-0"><b>Seated Guest No</b> </th>
                                                    <td><%=venue.get("seatedGuestNo")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Standing Guest No</b> </th>
                                                    <td><%=venue.get("standingGuestNo")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Food And Beverage</b> </th>
                                                    <% if(venue.get("foodAndBeverageDetails").equals(null)){ %>
                                                    <td>NA</td>
                                                    <%}else{ %>
                                                    <td><%=venue.get("foodAndBeverageDetails")%></td>
                                                    <%} %>
                                                </tr>
                                                 <tr>
                                                    <th class="border-bottom-0"><b>Email</b> </th>
                                                    <td><%=venue.get("contactEmail")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Address</b> </th>
                                                    <td><%=venue.get("streetAddress")%>,  
                                                    <% if(!venue.get("streetAddress2").equals(null)){ %>
                                                    	<%=venue.get("streetAddress2")%>
                                                    <%} %>
                                                    , <%=venue.get("city")%>,
                                                     <%=venue.get("postalCode")%>, <%=venue.get("state")%>, <%=venue.get("countryName")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Description</b> </th>
                                                    <td><%=venue.get("description")%></td>
                                                </tr>
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    <!--   
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5><i class="fa fa-star text-warning" aria-hidden="true"></i>  Reviews</h5>
                                    <div class="table-responsive">
                                        <table id="bootstrap-data-table-export"
                                            class="table table-vcenter text-nowrap border-bottom" id="hr-table">
                                            <tbody class="popup">
                                                <tr>
                                                    <th class="border-bottom-0"><b>Count</b> </th>
                                                    <td>	1</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b> Rating </b> </th>
                                                    <td>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star-half-o text-warning" aria-hidden="true"></i>
                                                        <i class="fa fa-star-half-o text-warning" aria-hidden="true"></i>
                                                        <span>3 out of 5 stars</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                       
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- jquery vendor -->

       <%@include file="../footerjsfordetails.jsp" %>
    
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css">
		
	<script>	
	Fancybox.bind("[data-fancybox]", {
  
});	
	</script>
	<script>
		function backFun() {
			window.history.back();
		}
	</script>

</body>

</html>