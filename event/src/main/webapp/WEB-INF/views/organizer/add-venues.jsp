<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="google-site-verification" content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
    <title>One Stop | Add Venues</title>
     <%@include file="../headercssfile.jsp" %>
<%
ArrayList companyList = (ArrayList) request.getAttribute("companyList");
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
                                <h1>Add a new venue</h1>
                            </div>
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
										<div class="col-md-6">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Company <span
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
										<div class="col-md-6">
											<div class="form-group row m-b-0">
												<label class="control-label col-md-3">Branch<span
													class="requiredFiled">*</span></label>
												<div class="col-md-9">
													<select name="branch" id="branch" onchange="loadData()"
														class="form-control input-default">
														<option value="0">-Select-</option>
													</select>
												</div>
											</div>
										</div>
										<!-- <div class="col-md-2">
											<div class="form-group row m-b-0">
												<div class="col-md-12">
													<button type="button" 
														class="btn btn-warning w-100 loader-position">
														<i class="ti-filter"></i> &nbsp;Filter<span
															class="sm-loader" style="display: none"></span>
													</button>
												</div>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card" id="queryData">
                            
                            	<form name="saveVenue" id="saveVenue">
                                    
                                    	<input type="hidden" id="companyName" name="companyName">
										<input type="hidden" id="branchName" name="branchName">
										<input type="hidden" id="companyId" name="companyId">
										<input type="hidden" id="branchId" name="branchId">
										
                                <div class="card-body">
                                    <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Name <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="venueName"
                                                       id="venueName" placeholder="name ">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Description</label>
                                                    <textarea name="description" class="form-control desc" rows="6"
                                                        placeholder="Description" id="description" spellcheck=""></textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Type <span
                                                            class="text-danger">*</span></label>
                                                            <select name="venueType.venueTypeId" id="venueType"
                                                            class="form-control select2-single select2-hidden-accessible"
                                                            required="true" tabindex="-1"
                                                            aria-hidden="true">
                                                            
                                                           </select>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Seated guests number</label>
                                                    <input type="number" class="form-control" name="seatedGuestNo"
                                                     id="seatedGuestNo" value="0" placeholder="">
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Standing guests number</label>
                                                    <input type="number" class="form-control" name="standingGuestNo"
                                                      id="standingGuestNo" value="0" placeholder=" ">
                                                </div>
                                            </div>
                                      
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Food and beverage details</label>
                                                    <textarea class="form-control" name="foodAndBeverageDetails" id="foodAndBeverageDetails" rows="2">NA</textarea>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="d-block">Contact email  <span class="text-danger">*</span><small>
                                                            <span class="text-danger">
                                                                <i class="fa fa-info-circle"></i>
                                                            </span>
                                                            This email address will be used to receive the quote requests, make sure to mention it if you want to show the quote form
                                                        </small>
                                                    </label>
                                                    <input type="text" class="form-control" name="contactEmail"
                                                       id="email" placeholder="">
                                                        <span class="error" style="color: red" id="emailError"></span>

                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Street address <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="streetAddress"
                                                       id="streetAddress" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Street address 2 </label>
                                                    <input type="text" class="form-control" name="streetAddress2"
                                                       id="streetAddress2" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>City <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="city"
                                                       id="city" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Zip / Postal code <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="postalCode"
                                                      id="postalCode"  placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>State <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="state" id="state"
                                                        placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Country <span class="text-danger">*</span></label>
                                                    
                                                    <input type="hidden" id="countryName" name="countryName">
													<input type="hidden" id="countryCode" name="countryCode">
													<input type="hidden" id="isdCode" name="isdCode" value="908">
										
                                                    <select name="countryId" id="country"
                                                    class="form-control select2-single select2-hidden-accessible"
                                                    required="required" tabindex="-1"
                                                    aria-hidden="true">
                                                    <option value="0" selected="selected">Select Country</option>                                                  
                                                    </select>
                                                </div>
                                            </div>
                                        
                                        </div>   
                                                                      
                                </div>
                                <div class="card-footer text-right mt-5">
                                    <button type="submit" class="btn btn-primary" onclick="return validateForm()">Save</button> 
                                </div>
                                  </form>
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
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        $('.desc').wysihtml5();
        $(document).ready(function () {
           // var multipleCancelButton = new Choices('.choices-multiple-remove-button', {
             //   removeItemButton: true,
                //maxItemCount: 10,
                //searchResultLimit: 10,
                //renderChoiceLimit: 10
           /// });

        });
    </script>
		
	<script>
	function loadData(){
		
		$('.sm-loader').show();
		var companyId = $("#company").val();
		var branchId = $("#branch").val();
		
		if(companyId == "0"){
			swal("Oops...", "Please Select Company Name !!", "error");
			$('#company').focus();
			$('.sm-loader').hide();		
			$("#queryData").css("display", "none");
			return false;
		}
		else if(branchId == 0){
			
			swal("Oops...", "Please Select Branch Name !!", "error");
			$('#branch').focus();
			$('.sm-loader').hide();		
			$("#queryData").css("display", "none");
			return false;
		}
		else{
			
			var urls = [ '/organizer/categoryAndAudience/getVenueTypeList',
				'/organizer/categoryAndAudience/getAudienceList',
				'/eventApi/getCountryList'];

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

			$.when.apply($, requests).done( function(venueTypeList, audienceList, countryList) {
					
					$('.sm-loader').hide();
					$("#queryData").css("display", "block");
					
					console.log(venueTypeList);
					console.log(audienceList);
					console.log(countryList);
					
					$("#venueType").children().remove();
					$("#venueType").append('<option value='+0+'>- Select -</option>');
					for (var i = 0; i < venueTypeList[0].length; i++) {
						$("#venueType").append('<option value='+venueTypeList[0][i].venueTypeId+'>'+ venueTypeList[0][i].name+ '</option>');
					} 

					$("#country").children().remove();
					$("#country").append('<option value='+0+'>- Select -</option>');
					for (var i = 0; i < countryList[0].length; i++) {
						$("#country").append('<option value='+countryList[0][i].countryId+'>'+ countryList[0][i].countryName + '</option>');
					}		
					
					$("#audienceList").children().remove();	
					for (var i = 0; i < audienceList[0].length; i++) {
					$("#audienceList").append("<div class='custom-control custom-checkbox custom-control-inline'>"+
                            "<input type='checkbox' class='custom-control-input' name='audience.audienceId' id='customCheck"+audienceList[0][i].audienceId+"' value='"+audienceList[0][i].audienceId+"'>"+
                            " <label class='custom-control-label' for='customCheck"+audienceList[0][i].audienceId+"'>"+audienceList[0][i].audienceName+"</label></div>");
					}
					
			}).fail(function() {
				console.error("One or more requests failed");
			});
		}			
	}
	
	</script>
	
	<script>
	
	$("#country").on('change', function(){
		
		var companyId = $("#company").val();
		var branchId = $("#branch").val();
		var countryId = $("#country").val();
		
		$.ajax({
			type : 'POST',
			url : '/eventApi/getCountryList',
			data : {
				companyId : companyId,
				branchId : branchId
			},
			dataType : "text",
			success : function(countryList) {
				
				var parsedData = JSON.parse(countryList);
				console.log(parsedData[0].isdCode);
				
				for (var i = 0; i < parsedData.length; i++) {
					
					if(countryId == parsedData[i].countryId){
						
						$("#isdCode").val(parsedData[i].isdCode);
						$("#countryName").val(parsedData[i].countryName);
						$("#countryCode").val(parsedData[i].countryCode);
						
					}else{
						
					}
					
				}
			}
								
			});
				
	});	
	
	</script>
	
	<script>
	
		$('#saveVenue').submit(function (event) { 
			
	        event.preventDefault();                 
	        var form = document.getElementById('saveVenue'); 
	        var formData = new FormData(form); 
	        
	        console.log(formData);
	       
	        $.ajax({ 
	            url: '/organizer/venue/saveVenue', 
	            method: 'POST', 
	            data: formData, 
	            processData: false, 
	            contentType: false, 
	            success: function (response) {
	            	
	            	if(response.code == 1){
	            		swal("Yay !...", response.message, "success");	            		
	            		setTimeout(function () {	            	
	                        window.location.href = '/organizer/venue/my-venues';
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
	                //location.reload();	
	                return false;
	            } 
	        }); 
	    }); 
	
	</script>

	<script>	
		function validateForm(){
			
			var companyId = $("#company").val();
			var branchId = $("#branch").val();
			var venueName = $("#venueName").val();
			var venueType = $("#venueType").val();
			var contactEmail = $("#email").val();			
			var streetAddress = $("#streetAddress").val();
			var city = $("#city").val();
			var postalCode = $("#postalCode").val();
			var state = $("#state").val();
			var country = $("#country").val();			
			
			if (companyId == "0") {
				swal("Oops...", "Please Select Company Name !!", "error");
				$('#companyId').focus();
				return false;
			}
			if (branchId == "0") {
				swal("Oops...", "Please Select Branch Name !!", "error");
				$('#branch').focus();
				return false;
			}
			if (venueName == "" || venueName == null) {
				swal("Oops...", "Please Enter Venue Name !!", "error");
				$('#venueName').focus();
				return false;
			}
			if (venueType == "0") {
				swal("Oops...", "Please Select Venue Type !!", "error");
				$('#venueType').focus();
				return false;
			}			
			if (contactEmail == "" || contactEmail == null) {
				swal("Oops...", "Please Enter Email !!", "error");
				$('#contactEmail').focus();
				return false;
			}
			if (streetAddress == "" || streetAddress == null) {
				swal("Oops...", "Please Enter Address !!", "error");
				$('#streetAddress').focus();
				return false;
			}
			if (city == "" || city == null) {
				swal("Oops...", "Please Enter City !!", "error");
				$('#city').focus();
				return false;
			}
			if (postalCode == "" || postalCode == null) {
				swal("Oops...", "Please Enter Postal Code !!", "error");
				$('#postalCode').focus();
				return false;
			}
			if (state == "" ||  state == null) {
				swal("Oops...", "Please Enter State !!", "error");
				$('#state').focus();
				return false;
			}	
			if (country == "0") {
				swal("Oops...", "Please Select Country !!", "error");
				$('#country').focus();
				return false;
			}
		}
	
	</script>
	
		<script>
	
	$('#email').keyup(function() {
		var email = $('#email').val();
		isValidEmail(email);
	});

	function isValidEmail(email) {
		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		if (emailRegex.test(email)) {
			$("#emailError").text("");
		} else {
			$("#emailError").text("Invalid email format");
			return false;
		}
	}

	$('#phoneNo').keyup(function() {
		var phoneNo = $('#phoneNo').val();
		isValidPhoneNo(phoneNo);
	});

	function isValidPhoneNo(phoneNo) {
		var phoneRegex = /^\d{10}$/;

		if (!phoneRegex.test(phoneNo)) {
			$("#phoneError").text("Invalid length");
			return false;
		} else {
			$("#phoneError").text("");
		}
	}
	
	</script>
</body>

</html>