<!DOCTYPE html>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main Page Title -->
    <title>Service Market Place</title>
    <link rel="icon" href="/images/32x32.png" type="image/x-icon" />
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/landing.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/event.css">
    <link href="/css/data-table/buttons.bootstrap.min.css" rel="stylesheet" />    
	<link href="/css/sweetalert/sweetalert.css" rel="stylesheet">
    <style>
        .alertServerheader {
            line-height: 25px;
            background: #cfd;
            border: 1px solid #ff0;
            color: #f30;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            padding: 5px;
        }

        .whatsapp {
            position: fixed;
            bottom: 20px;
            right: 10px;
            width: 50px;
            z-index: 9999;
        }
        a.aa{
        	text-decoration: none;
        	text-color: #fff;
        }
    </style>
<%
HashMap event = (HashMap) request.getAttribute("event");
%>
</head>

<body data-spy="scroll" data-target=".header-area" data-offset="50" id="home">
  
    <%@include file="navbar.jsp" %>
    <div class="page-title-bg  top-spacing ">

    </div>
    <div class="event-section py-3 py-lg-5">
     <div class="container">
            <div class="page-header">
                <div class="container-fluid">
                    <div class="row d-flex align-items-center">
                        <div class="col">
                            <div class="page-title">
                                <h2> <%=event.get("eventName")%> </h2>
                            </div>
                        </div>
                        
                        <div
							class="col-md-6 ml-auto text-sm-left text-md-right text-lg-right">
							<a class="btn btn-success btn-sm m-b-10 m-l-5" onclick="backFun()"><i class="fa fa-backward"></i> Back</a>
						</div>
                    </div>
                </div>
            </div>

                    <div class="row">
                        <div class="col-lg-6 d-flex align-items-stretch">
                            <div class="card p-3 mb-4 card-event w-100">
                                <div class="card-body">
                                    <h5><i class="fa fa-file-text-o "></i> General information</h5>
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
                                                <%int paymentGatewayRequired = (Integer)event.get("paymentGatewayRequired"); %>
                                                <%if(paymentGatewayRequired == 1){ %>                                                
                                                <tr>
                                                    <th class="border-bottom-0"><b>Ticket Price</b> </th>
                                                    <td><%=event.get("ticketPrice")%></td>
                                                </tr> 
                                                <%} %>
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-stretch">
                            <div class="card p-3 mb-4 card-event w-100">
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
                                                
                        <div class="col-lg-6 d-flex align-items-stretch">
                            <div class="card p-3 mb-4 card-event w-100">
                                <div class="card-body">
                                    <h5><i class="fa fa-map-marker"></i> Venue </h5>
                                    <div class="table-responsive">
                                        <table id="bootstrap-data-table-export"
                                            class="table table-vcenter text-nowrap border-bottom" id="hr-table">
                                            <tbody class="popup">                                              
                                                <%HashMap venue = (HashMap)event.get("venue");%>
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
                                                                                    
                        <div class="col-lg-6 d-flex align-items-stretch">
                            <div class="card p-3 mb-4 card-event w-100">
                                <div class="card-body">
                                    <h5><i class="fa fa-phone-square"></i> Contact</h5>
                                    <div class="table-responsive">
                                        <table id="bootstrap-data-table-export"
                                            class="table table-vcenter text-nowrap border-bottom" id="hr-table">
                                            <tbody class="popup">                                            
                                                <tr>
													<th class="border-bottom-0"><b> Email </b></th>
													<td><%=event.get("email") %></td>
												</tr>
												<tr>
													<th class="border-bottom-0"><b>Phone number</b></th>
													<td><%=event.get("phoneNo")%></td>
												</tr>                                           
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>                                                                         
                    </div>
                     <div class="row">
		                <div class="col-lg-12 m-4">
		                    <div class="text-center animated fadeInUp" data-wow-duration="0.6s">
		                        <a class="btn btn-success btn-lg px-5 enrollEvent position-relative" href="<%=event.get("eventUrl")%>">
		                        Enroll Event 
		                        <span class="sm-loader" style="display: none"></span>
								</a>
		                    </div>
		                </div>
		            </div>

    </div>
        </div>    
          
    <div class="whatsapp"><a href="https://wa.me/919205793659" target="_blank"><img src="/images/whatsapp.svg"
                class="img-fluid"></a></div>

   <footer class="footer_bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-lg-3">
                    <div class="logo"><a href="homePage">
                            <h4>OneStop Social Link</h4>
                        </a></div>
                    <div class="social-icons">
                        <a href="https://www.facebook.com/onestopglobalindia" target="_blank"
                            class="fa fa-facebook"></a>
                        <a href="https://twitter.com/onestopglobal_" target="_blank" class="fa fa-twitter"></a>
                        <a href="https://www.instagram.com/onestopglobalindia/" target="_blank"
                            class="fa fa-instagram"></a>
                        <a href="https://www.linkedin.com/company/one-stop-global/" target="_blank"
                            class="fa fa-linkedin"></a>
                    </div>
                </div>
                <div class="col-12 col-sm-3">
                    <h4>Quick Links</h4>
                    <ul class="footer_nav">
                        <li><a href="terms"><i class="fa fa-angle-right mr-1"></i> T&amp;C &amp; Privacy Policy</a></li>
                        <li><a href="https://blog.onestop.global" target="_blank"><i class="fa fa-angle-right mr-1"></i>
                                Blogs</a></li>
                        <li><a href="https://careers.onestop.global" target="_blank"><i
                                    class="fa fa-angle-right mr-1"></i> Careers</a></li>
                        <li><a href="https://affiliate.onestop.global/" target="_blank"><i
                                    class="fa fa-angle-right mr-1"></i> Affiliate Program</a></li>
                    </ul>
                </div>
                <div class="col-12 col-sm-3">
                    <h4>Address</h4>
                    <div class="contact-info">
                        <div class="row d-flex align-items-center">
                            <div class="contact_icon ml-3"> <svg width="1em" height="1em" viewBox="0 0 16 16"
                                    class="bi bi-building" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z">
                                    </path>
                                    <path
                                        d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z">
                                    </path>
                                </svg> </div>
                            <div class="contact_info">
                                <div class="contact_heading">Codeit Softwares Limited</div>
                                <p>CIN:-U72900HR2011PLC043248</p>
                            </div>
                        </div>
                        <div class="divider"></div>
                        <div class="row d-flex align-items-center">
                            <div class="contact_icon ml-3"> <svg width="1em" height="1em" viewBox="0 0 16 16"
                                    class="bi bi-building" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z">
                                    </path>
                                </svg> </div>
                            <div class="contact_info">
                                <p class="mb-0">C-20, South City-I,<br>
                                    Gurugram, Haryana- 122001 </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-3">
                    <h4>Contact us</h4>
                    <div class="contact-info">
                        <div class="row d-flex align-items-center">
                            <div class="contact_icon ml-3"> <svg width="1em" height="1em" viewBox="0 0 16 16"
                                    class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z">
                                    </path>
                                </svg> </div>
                            <div class="contact_info">
                                mailus@codeitsoft.com
                                <p></p>
                            </div>
                        </div>
                        <div class="divider"></div>
                        <div class="row d-flex align-items-center">
                            <div class="contact_icon ml-3"> <svg width="1em" height="1em" viewBox="0 0 16 16"
                                    class="bi bi-telephone" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z">
                                    </path>
                                </svg> </div>
                            <div class="contact_info">
                                <p class="mb-0">Mobile: +91-7827997050<br>
                                    Phone: +91-124-4227455</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bar mt-3">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="text-sm-left">
                            <p class="mb-0">© 2020 A product of <a target="_blank" href="http://codeitsoft.com"> Codeit
                                    Sofwares Ltd. </a>All Rights Reserved.</p>
                        </div>
                    </div>
                    <div class="col-sm-3 mb-sm-2">
                        <span id="siteseal">
                            <script async type="text/javascript"
                                src="https://seal.godaddy.com/getSeal?sealID=LQjrSA28JIajTBD5BpGulRA2hz3afHrxgov4rvoSgf94n8gqDz746Dn4oPfo"></script>
                        </span>
                    </div>
                    <div class="col-sm-3">
                        <div class="aws_payment">
                            <img src="/images/aws.png" alt="AWS Logo" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css">
		
	<script>	
	Fancybox.bind("[data-fancybox]", {
  
});	
	</script>
    <script type="text/javascript">
        $('.navbar-nav li a').click(function () {
            $('.navbar-nav li a.active').removeClass('active');
            $(this).addClass('active');
        });

        $('.navbar-toggler').on('click', function () {
            $("#collapsibleNavbar").toggleClass('open-menu');
        });

        $(window).scroll(function () {
            var sticky = $('.navbar'),
                scroll = $(window).scrollTop();

            if (scroll >= 75) {
                sticky.addClass('fixed-top');
                $("#collapsibleNavbar").css({ top: "61px" });
            } else {
                sticky.removeClass('fixed-top');
                $("#collapsibleNavbar").css({ top: "77px" });

            }
        });
        $(document).ready(function () {
            $(window).resize(function () {
                var height = $('.navbar').height();
                $('.top-spacing').css("margin-top", height);
            });
            $(window).resize(); //on page load
            $('.hero-slider').owlCarousel({
                loop: true,
                margin: 0,
                items: 1,
                dots: false,
                navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"],
                smartSpeed: 1000,
                autoplay: true,
                autoplayTimeout: 5000,
                responsive: {
                    0: {
                        nav: false
                    },
                    768: {
                        nav: true
                    }
                }
            });
            $('[data-toggle="tooltip"]').tooltip();
            
            $('.enrollEvent').on('click',function(){
            	  $('.sm-loader').show();
            	});
        });

    </script>


	
		<script>
		function backFun() {
			window.history.back();
		}
	</script>


</body>

</html>


















