<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>One Stop | Venue Type</title>
     <%@include file="../headercssfile.jsp" %>
<%
ArrayList companyList = (ArrayList) request.getAttribute("companyList");
%>
    

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
                                <h1>Venue Type</h1>
                            </div>
                        </div>
                        
                        <div
							class="col-md-6 ml-auto text-sm-left text-md-right text-lg-right">
							<a class="btn btn-success btn-sm m-b-10 m-l-5"
								onclick="addExamTypeFunc()"><i class="ti-plus"></i> Add Venue
								Type</a>
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
													<select id="company" name="company" required="true"
														class="form-control select2-single" tabindex="-1"
														aria-hidden="true">
														<option value="0" selected="selected">-Select Company-</option>
														<%
														HashMap companyDetails = null;
														for (int i = 0; i < companyList.size(); i++) {
															companyDetails = (HashMap) companyList.get(i);
														%>
														<option id="company"
															value="<%=companyDetails.get("companyId")%>"><%=companyDetails.get("companyName")%></option>
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
													<select name="branch" id="branch"
														class="form-control input-default">
														<option value="0">-Select-</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group row m-b-0">
												<div class="col-md-12">
													<button type="button" onclick="loadVenueType()"
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
                
                <div id="queryData"> 
                <div id="table-container">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											<table id="bootstrap-data-table-export"
												class="table table-vcenter text-nowrap border-bottom"
												id="hr-table">
												<thead>
													<tr>
														<th class="border-bottom-0" width="30">Sl.</th>														
														<th class="border-bottom-0">Venue Type Name</th>														
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
    
    <!-- Add Venue Type -->
	<div class="modal fade" id="ModalVenueType" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Venue Type</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form id="saveVenueType"  name="saveVenueType"
					enctype="multipart/form-data">
					<div class="modal-body">
						<div class="row">
						<div class="col-md-12">
											<div class="form-group row">
												<label class="control-label col-md-3">Company<span
													class="requiredFiled">*</span></label>
												<div class="col-md-8">
													<select id="companyDetails1" name="companyId" required="true"
														class="form-control select2-single" tabindex="-1"
														aria-hidden="true">
														<option value="0" selected="selected">-Select Company-</option>
														<%
														HashMap companyDetails1 = null;
														for (int i = 0; i < companyList.size(); i++) {
															companyDetails1 = (HashMap) companyList.get(i);
														%>
														<option id="companyDetails"
															value="<%=companyDetails1.get("companyId")%>"><%=companyDetails1.get("companyName")%></option>
														<%
														}
														%> 
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Branch<span
													class="requiredFiled">*</span></label>
												<div class="col-md-8">
													<select name="branchId" id="branchDetails1"
														class="form-control input-default">
														<option value="0">Select</option>
													</select>
												</div>
											</div>
										</div>	
							 <input type="hidden" id="companyNameDetails" name="companyName">
							<input type="hidden" id="branchNameDetails" name="branchName">
										
							<div class="col-md-12">
								<div class="form-group">
									<label>Venue Type Name </label> <input type="text"
										class="form-control" placeholder="" value="" id="name"
										name="name" maxlength="20">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success"
							onclick="return validateVenueType()">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
    <!-- Update Venue Type -->
	<div class="modal fade" id="venueTypeModalEdit" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form id="editSaveVenueType" name="editSaveVenueType"
					enctype="multipart/form-data">
					<div class="modal-body">
						<div class="row">
							<input type="hidden" id="editCompanyName" name="companyName">
							<input type="hidden" id="editBranchName" name="branchName"> <input
								type="hidden" id="editCompanyId" name="companyId"> <input
								type="hidden" id="editBranchId" name="branchId">
								<input type="hidden" id="editVenueTypeId" name="venueTypeId">

								<div class="col-md-12">
								<div class="form-group">
									<label>Venue Type Name </label> <input type="text"
										class="form-control" placeholder="" value="" id="editName"
										name="name" maxlength="20">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success"
							onclick="return validateVenueType1()">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
    
    <!-- jquery vendor -->

  <%@include file="../footerjsfile.jsp" %>
	

	<script>
		$(document).ready(function() {
			$("#queryData").css("display", "none");			
		});
	</script>

	<script>
		$("#branch").on('change', function() {
	
			var branchId = $("#branch").val();
			if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branchId').focus();
				$("#queryData").css("display", "none");
				return false;
			}
		});
	</script>
	
    <script>
		function addExamTypeFunc() {

			/* var companyId = $('#companyId').val();
			var branchId = $('#branch').val();

			if (companyId == "0" || companyId == "") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				return false;
			}
			if (branchId == "0" || branchId == "") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				return false;
			} else { */
				$('#ModalVenueType').modal('toggle');
		/* 	} */

		}
	</script>

		<script>
		$("#companyDetails1").on('change',function() {
			var companyId = $(this).val();
			var companyName = $('#companyDetails1').find(":selected").text();
	
			$("#companyNameDetails").val(companyName);
			//$("#companyId").val(companyId);
			//$("#queryData").css("display", "none");
			//$('#branch').addClass("progress");
			//callBranch(companyId);
	
			if (companyId == 0) {
				$("#branchDetails1").children().remove();
				//$("#queryData").css("display", "none");
				//$('#branch').addClass("progress");
			} else {

				$('#branchDetails1').addClass("progress");
				$.ajax({
					type : 'POST',
					url : "/eventApi/getBranchList",
					data : {
						companyId : companyId
					},
					dataType : "text",
					success : function(branchMap) {
						$('#branchDetails1').removeClass("progress");
						$("#branchDetails1").children().remove();
						var parsedData = JSON.parse(branchMap);
						console.log(parsedData);
						$("#branchDetails1").append('<option value=0>-Select Branch-</option>');
						for (var i = 0; i < parsedData.length; i++) {
							console.log(parsedData[i].branchName);
								$("#branchDetails1").append('<option value='+parsedData[i].branchId+'>'+ parsedData[i].branchName+ '</option>');
							
							$("#branchNameDetails").val(parsedData[i].branchName);							
						}
						if(parsedData.length == 1){							
							document.getElementById("branchDetails1").selectedIndex = 1;
							$('#branchDetails1').change();							
						}
					}
				});
			}
		});
	</script>
	
	<script>
	
		$('#saveVenueType').submit(function (event) { 
	        event.preventDefault();                 
	        var form = document.getElementById('saveVenueType'); 
	        var formData = new FormData(form); 
	       
	        $.ajax({ 
	            url: '/organizer/categoryAndAudience/saveVenueType', 
	            method: 'POST', 
	            data: formData, 
	            processData: false, 
	            contentType: false, 
	            success: function (response) {
	            	
	            	if(response.code == 1){
	            		swal("Yay !...", response.message, "success");	            		
	            		setTimeout(function () {	
	            			//$('#ModalVenueType').modal('toggle');
	            			location.reload();		   
	                    }, 2000);             		
	            	}
	            	else{
	            		 swal("Oops...", response.message, "error");
	            		/*  setTimeout(function () {
	            			 location.reload();		                       
	                     }, 2000); */
	            	}	            	
	            }, 
	            error: function (xhr, status, error) {                   	
	                console.error(error); 
	                swal("Oops...", "Something Went Wrong", "error");	
	              //  location.reload();	
	                return false;
	            } 
	        }); 
	    }); 
	
	</script>
	
	<script>
		function loadVenueType() {

			$('.sm-loader').show();

			var companyId = $("#company").val();
			var branchId = $("#branch").val();

			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				return false;
			} else if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				$('.sm-loader').hide();
				$("#queryData").css("display", "none");
				return false;
			} else {

				$.ajax({
					url : '/organizer/categoryAndAudience/getVenueTypeTableList', // JSP page to fetch data
					type : 'POST',
					data : {
						companyId : companyId,
						branchId : branchId
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
	
	<script>	
		function validateVenueType(){
			
			var companyId = $("#companyDetails").val();
			var branchId = $("#branchDetails").val();
			var name = $("#name").val();			
			
			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyDetails').focus();
				return false;
			}
			if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branchDetails').focus();
				return false;
			}
			if (name == "" || name == null) {
				swal("Oops...", "Please Enter Venue Type Name !!", "error");
				$('#name').focus();
				return false;
			}
		}
		
	</script>

	<script>
		function editVenueTypeFunc(venueTypeId) {

			var companyId = $('#companyId').val();
			var branchId = $('#branch').val();

			if (companyId == "0" || companyId == "") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				return false;
			}
			if (branchId == "0" || branchId == "") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				return false;
			} else {
								
				$.ajax({
					type : 'POST',
					url : "/organizer/categoryAndAudience/getVenueTypeById",
					data : {
						venueTypeId : venueTypeId
					},
					dataType : "text",
					success : function(venueType) {

						var parsedData = JSON.parse(venueType);
						console.log(parsedData);	
						$('#venueTypeModalEdit').modal('toggle');
						
						$("#editCompanyId").val(parsedData.companyId);
						$("#editBranchId").val(parsedData.branchId);
						$("#editCompanyName").val(parsedData.companyName);
						$("#editBranchName").val(parsedData.branchName);
						$("#editVenueTypeId").val(venueTypeId);
						$("#editName").val(parsedData.name);

					}

				});				
			
			}

		}
	</script>
	
	<script>	
		function validateVenueType1(){
			
			var companyId = $("#editCompanyId").val();
			var branchId = $("#editBranchId").val();
			var name = $("#editName").val();			
			
			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#editCompanyId').focus();
				return false;
			}
			if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#editBranchId').focus();
				return false;
			}
			if (name == "" || name == null) {
				swal("Oops...", "Please Enter Venue Type Name !!", "error");
				$('#editName').focus();
				return false;
			}
		}
		
	</script>
	
	<script>
	
		$('#editSaveVenueType').submit(function (event) { 
	        event.preventDefault();                 
	        var form = document.getElementById('editSaveVenueType'); 
	        var formData = new FormData(form); 
	       
	        $.ajax({ 
	            url: '/organizer/categoryAndAudience/saveVenueType', 
	            method: 'POST', 
	            data: formData, 
	            processData: false, 
	            contentType: false, 
	            success: function (response) {
	            	
	            	if(response.code == 1){
	            		swal("Yay !...", response.message, "success");	            		
	            		setTimeout(function () {		            			
	            			location.reload();		   
	                    }, 2000);             		
	            	}
	            	else{
	            		 swal("Oops...", response.message, "error");
	            		 /* setTimeout(function () {
	            			 location.reload();		                       
	                     }, 2000); */
	            	}	            	
	            }, 
	            error: function (xhr, status, error) {                   	
	                console.error(error); 
	                swal("Oops...", "Something Went Wrong", "error");	
	               // location.reload();	
	                return false;
	            } 
	        }); 
	    }); 
	
	</script>

</body>

</html>