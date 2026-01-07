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
    <title>One Stop | Venue Details</title>
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
HashMap venueDetails = (HashMap) request.getAttribute("venueDetails");
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
                                <h1> <%=venueDetails.get("venueName")%> </h1>
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
                                                    <th class="border-bottom-0"><b> Title </b> </th>
                                                    <td><%=venueDetails.get("venueName")%></td>
                                                </tr>                                              
                                                 <tr>
                                                    <th class="border-bottom-0"><b>Seated Guest No</b> </th>
                                                    <td><%=venueDetails.get("seatedGuestNo")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Standing Guest No</b> </th>
                                                    <td><%=venueDetails.get("standingGuestNo")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Food And Beverage</b> </th>
                                                    <% if(venueDetails.get("foodAndBeverageDetails").equals(null)){ %>
                                                    <td>NA</td>
                                                    <%}else{ %>
                                                    <td><%=venueDetails.get("foodAndBeverageDetails")%></td>
                                                    <%} %>
                                                </tr>
                                               
                                               <%
												HashMap venueType = (HashMap) venueDetails.get("venueType");
												%>
												<tr>
													<th class="border-bottom-0"><b>Venue Type</b></th>
													<td> <%=venueType.get("name")%>
													</td>
												</tr>
                                              
                                                <tr>
                                                    <th class="border-bottom-0"><b>Email</b> </th>
                                                    <td><%=venueDetails.get("contactEmail")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Address</b> </th>
                                                    <td><%=venueDetails.get("streetAddress")%>,  
                                                    <% if(!venueDetails.get("streetAddress2").equals(null)){ %>
                                                    	<%=venueDetails.get("streetAddress2")%>
                                                    <%} %>
                                                    , <%=venueDetails.get("city")%>,
                                                     <%=venueDetails.get("postalCode")%>, <%=venueDetails.get("state")%>, <%=venueDetails.get("countryName")%></td>
                                                </tr>
                                                <tr>
                                                    <th class="border-bottom-0"><b>Description</b> </th>
                                                    <td><%=venueDetails.get("description")%></td>
                                                </tr>
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                       
                  <!--       <div class="col-lg-12">
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