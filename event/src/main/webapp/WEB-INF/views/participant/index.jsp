<!DOCTYPE html>
<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
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
<%
HashMap participantDashboardData = (HashMap) request.getAttribute("participantDashboardData");
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
						<div class="col-lg-6">
							<div class="card shadow-none">
								<div class="stat-widget-four">
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-heading dropdown">
												<span class="cursor-pointer" data-toggle="dropdown"
													aria-expanded="false"> Total Attendee </span>
											</div>
											<h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=participantDashboardData.get("noOfAttendee")%></h4>

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
													aria-expanded="false"> Visited Attendee </span>
											</div>
											<h4 class="mb-0 mt-1 mb-2 font-weight-bold"><%=participantDashboardData.get("noOfAttendeeLog")%></h4>

										</div>
									</div>
									<div class="stat-icon bg-secondary">
										<i class="fa fa-calendar"></i>
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