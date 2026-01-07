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
<title>One Stop | Event List</title>
  <%@include file="../headercssfile.jsp" %>
<style>
/* CSS for datepicker */
.ui-datepicker {
	font-size: 18px;
}

.ui-datepicker-header {
	background-color: #f0f0f0;
}

.ui-datepicker-calendar {
	border: 1px solid #ccc;
}
/* Add more CSS styles as needed */
</style>
<%
ArrayList companyList = (ArrayList) request.getAttribute("companyList");
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
								<h1>My events</h1>
							</div>
						</div>

						<div class="col ml-auto  text-right">
							<a href="/organizer/myEvent/add-event"
								class="btn btn-success btn-sm"> <i class="ti-plus"></i> Add
								Event
							</a>
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
									<div class="row d-flex align-items-center">
										<div class="col-md-5">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Company<span
													class="requiredFiled">*</span></label>
												<div class="col-md-8">
													<select id="company" name="company"
														class="form-control select2-single" tabindex="-1"
														aria-hidden="true">
														<option value="0" selected="selected">-Select Company-</option>
														<%
														HashMap companyDetails = null;
														for (int i = 0; i < companyList.size(); i++) {
															companyDetails = (HashMap) companyList.get(i);
														%>
														<option id="company" value="<%=companyDetails.get("companyId")%>"><%=companyDetails.get("companyName")%></option>
														<%
														}
														%>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-5">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Branch<span
													class="requiredFiled">*</span></label>
												<div class="col-md-9">
													<select name="branch" id="branch" class="form-control input-default">
														<option value="0">-Select-</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group row m-b-0">
												<div class="col-md-12">
													<button type="button" onclick="loadEvent()"
														class="btn btn-warning w-100 loader-position">
														<i class="ti-filter"></i> &nbsp;Filter<span
															class="sm-loader" style="display: none"></span>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					 <div class="card" id="queryDataCard">						
						<div class="card-header">
							<h5>Select Criteria</h5>
						</div>
						<div class="row mt-2">
							<div class="col-lg col-md-6 col-sm-12">
								<div class="form-group">
									<label class="control-label">Select Category</label> <select
										name="category" id="category"
										class="form-control select2-single select2-hidden-accessible"
										tabindex="-1" aria-hidden="true">
										<option value="0" selected="selected">Select Category</option>
									</select>
								</div>
							</div>						
							<div class="col-lg col-md-6 col-sm-12">
								<div class="form-group">
									<label class="control-label">Select Venue</label> <select
										name="venue" id="venue"
										class="form-control select2-single select2-hidden-accessible"
										tabindex="-1" aria-hidden="true">
										<option value="0" selected="selected">Select Venue</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-lg col-md-6 col-sm-12">
								<div class="form-group">
									<label>Start Date</label>
									<div class="cal-icon">
										<input type="text" name="eventStartDate" id="eventStartDate"
											placeholder="" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-lg col-md-6 col-sm-12">
								<div class="form-group">
									<label>End Date</label>
									<div class="cal-icon">
										<input type="text" name="eventLastDate" id="eventLastDate"
											placeholder="" class="form-control">
									</div>
								</div>
							</div>
							
							<div class="col-lg-2">
								<label for="">&nbsp;</label>
								<button type="button" onclick="loadEventList()"
									class="btn btn-primary w-100">
									<span class="ti-search pr-2"></span> Search
								</button>
							</div>
						</div>
					</div> 
					
					<div id="queryData">
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
															<th class="border-bottom-0">Event Images</th>
															<th class="border-bottom-0">Event</th>
															<th class="border-bottom-0">Category</th>
															<th class="border-bottom-0">Audience</th>
															<th class="border-bottom-0">Start Date - End Date</th>
															<th class="border-bottom-0">Venue</th>
															<th class="border-bottom-0">Event URL</th>
															<th class="border-bottom-0">Action</th>
														</tr>
													</thead>
													<tbody class="popup">
													</tbody>
												</table>
											</div>
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
	<script src="/js/jquery.min.js"></script> 
	<!-- <script src="/js/jquery-3.5.1.min.js"></script> -->
	<script src="/js/jquery.nanoscroller.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/menubar/sidebar.js"></script>
	<script src="/js/preloader/pace.min.js"></script>
	<script src="/js/polyfill.min.js"></script>
	     <script src="/js/choices.min.js"></script>
	<script src="/js/scripts.js"></script>	
	<script src="/js/sweetalert/sweetalert.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
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
	<script src="/js/select2/select2.full.js"></script>
	<script src="/js/select2/anchor.min.js"></script>
	 <script type="text/javascript" src="/js/moment-with-locales.min.js"></script>
	<script src="/js/date-picker/jquery-ui.js"></script>
 	<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
 	<script type="text/javascript" src="/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/html5-editor/wysihtml5-0.3.0.js"></script>
    <script src="/js/html5-editor/bootstrap-wysihtml5.js"></script>
    <script src="/js/imageProfileUpload.js"></script>
 
	<script>
	$(document).ready(function () {
	    $('[data-toggle="tooltip"]').tooltip();
	}); 

		anchors.options.placement = "left";
		anchors
				.add(".container h1, .container h2, .container h3, .container h4, .container h5");
		$.fn.select2.defaults.set("theme", "bootstrap");
		var placeholder = "-Select-";
		$(".select2-single, .select2-multiple").select2({
			placeholder : placeholder,
			width : null,
			containerCssClass : ":all:",
		});
		$(".select2-single, .select2-multiple")
				.on(
						"select2:open",
						function() {
							if ($(this).parents("[class*='has-']").length) {
								var classNames = $(this).parents(
										"[class*='has-']")[0].className
										.split(/\s+/);
								for (var i = 0; i < classNames.length; ++i) {
									if (classNames[i].match("has-")) {
										$("body > .select2-container")
												.addClass(classNames[i]);
									}
								}
							}
						});
		function setTitle(ob) {
			$(ob).parent().attr("data-original-title", $(ob).val());
		}
	</script>
	
	<script>
	var dateToday = new Date();
      $('#eventStartDate').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            "format": "YYYY-MM-DD",
            //axnDate : dateToday // maxDate: (moment(new Date())) 
        });
        
        $('#eventLastDate').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            "format": "YYYY-MM-DD",
           	//minDate : dateToday // maxDate: (moment(new Date())) 
        });         
    </script>
    
	<script>
		$(document).ready(function() {
			$("#queryData").css("display", "none");
			$("#queryDataCard").css("display", "none");
		});
	</script>

	<script>
		$("#branch").on('change', function() {

			var branchId = $("#branch").val();
			if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branchId').focus();
				$("#queryData").css("display", "none");
				$("#queryDataCard").css("display", "none");
				return false;
			}
		});
	</script>

	<script>
		$("#company").on('change',function() {
			var companyId = $(this).val();
			var companyName = $('#company').find(":selected").text();
			
			$("#branch").children().remove();
			$("#companyName").val(companyName);
			$("#companyId").val(companyId);
			$("#queryData").css("display", "none"); 
			$("#queryDataCard").css("display", "none");
			//$('#branch').addClass("progress");
			//callBranch(companyId);
	
			if (companyId == 0) {
				$("#branch").children().remove();
				$("#queryData").css("display", "none");
				$("#queryDataCard").css("display", "none");
				//$('#branch').addClass("progress");
			} else {
				$('#branch').addClass("progress");
				$.ajax({
					type : 'POST',
					url : "/eventApi/getBranchList",
					data : {
						companyId : companyId
					},
					dataType : "text",
					success : function(branchMap) {
						$('#branch').removeClass("progress");
						$("#branch").children().remove();
						var parsedData = JSON.parse(branchMap);						
						
						$("#branch").append('<option value=0>-Select Branch-</option>');
						for (var i = 0; i < parsedData.length; i++) {
								$("#branch").append('<option value='+parsedData[i].branchId+'>'+ parsedData[i].branchName+ '</option>');
							
							//$("#branchId").val(parsedData[i].branchId); //for 1
							//$("#branchName").val(parsedData[i].branchName);
						}
						if(parsedData.length == 1){							
							document.getElementById("branch").selectedIndex = 1;
							$('#branch').change();							
						}
					}
				});
			}
		});
	</script>

	<script>
		function loadEvent() {

			$('.sm-loader').show();

			var companyId = $("#company").val();
			var branchId = $("#branch").val();

			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				$("#queryDataCard").css("display", "none");
				return false;
			} else if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				$("#queryDataCard").css("display", "none");
				return false;
			} else {
				
				var urls = [ '/organizer/categoryAndAudience/getCategoryList',
					'/organizer/venue/getVenueList',
					 '/organizer/myEvent/getEventTableList'];

				var requests = [];

				$.each(urls, function(index, url) {
					var request = $.ajax({
						url : url,
						method : 'POST',
						data : {
							companyId : companyId,
							branchId : branchId
						}
					});

					requests.push(request);
				});

				$.when.apply($, requests).done(function(categoryList, venueList, eventDetailsList) {

					$('.sm-loader').hide();
					$("#queryData").css("display", "block");
					$("#queryDataCard").css("display", "block");
					
					$('#table-container').html(eventDetailsList[0]);	
					
					$("#category").children().remove();
					$("#category").append('<option value='+0+'>- Select -</option>');
					for (var i = 0; i < categoryList[0].length; i++) {
						$("#category").append('<option value='+categoryList[0][i].categoryId+'>'+ categoryList[0][i].categoryName+ '</option>');
					}				
					
					$("#venue").children().remove();
					$("#venue").append('<option value='+0+'>- Select -</option>');
					for (var i = 0; i < venueList[0].length; i++) {
						$("#venue").append('<option value='+venueList[0][i].venueId+'>'+ venueList[0][i].venueName+ '</option>');
					}
					
				}).fail(function() {
					console.error("One or more requests failed");
				}); 
				
				
				/* $.ajax({
					url : '/organizer/myEvent/getEventTableList', // JSP page to fetch data
					type : 'POST',
					data : {
						companyId : companyId,
						branchId : branchId
					},
					success : function(data) {					
						$('.sm-loader').hide();
						$("#queryData").css("display", "block");
						$("#queryDataCard").css("display", "block");
						console.log(data);
						$('#table-container').html(data);
					},
					error : function() {
						alert('Error fetching data.');
					}
				}); */
			}
		}
	</script>

	<script>
		function loadEventList() {

			var companyId = $('#company').val();
			var branchId = $('#branch').val();
			var categoryId = $('#category').val();
			var venueId = $("#venue").val();
			var eventStartDate = $('#eventStartDate').val();
			var eventLastDate = $("#eventLastDate").val();

			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				return false;
			} 
			else if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				return false;
			} else {

				$.ajax({
					url : '/organizer/myEvent/getEventFilterTableList', // JSP page to fetch data
					type : 'POST',
					data : {
						companyId : companyId,
						branchId : branchId,
						categoryId : categoryId,
						venueId : venueId,
						eventStartDate : eventStartDate,
						eventLastDate : eventLastDate
					},
					success : function(data) {
						$('.sm-loader').hide();
						$("#queryData").css("display", "block");
						$('#table-container').html(data); // Update the table content
					},
					error : function() {
						alert('Error fetching data.');
					}
				});			
			}

		}
	</script>	
	
</body>

</html>