<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="google-site-verification" content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
    <title>One Stop | Edit Venues</title>
   <%@include file="../headercssfile.jsp" %>
  
<%
HashMap venueDetails = (HashMap) request.getAttribute("venueDetails");
ArrayList<HashMap> countryList = (ArrayList<HashMap>) request.getAttribute("countryList");
ArrayList<HashMap> venueTypeList = (ArrayList<HashMap>) request.getAttribute("venueTypeList");
HashMap eventVenueType = (HashMap) venueDetails.get("venueType");

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
                                <h1>Edit Venue</h1>
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
                            <div class="card" id="queryData">
                            
                            	<form name="saveVenue" id="saveVenue">
                                    
                                    	<input type="hidden" id="companyName" name="companyName" value="<%=venueDetails.get("companyName")%>">
										<input type="hidden" id="branchName" name="branchName" value="<%=venueDetails.get("branchName")%>">
										<input type="hidden" id="companyId" name="companyId" value="<%=venueDetails.get("companyId")%>">
										<input type="hidden" id="branchId" name="branchId"  value="<%=venueDetails.get("branchId")%>">
										<input type="hidden" id="venueId" name="venueId"  value="<%=venueDetails.get("venueId")%>">
										
                                <div class="card-body">
                                   
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Name <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="venueName"
                                                       id="venueName" placeholder="name" value="<%=venueDetails.get("venueName")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Description</label>
                                                    <textarea name="description" class="form-control desc" rows="6"
                                                        placeholder="" id="description" spellcheck=""><%=venueDetails.get("description")%>
                                                    </textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Type <span
                                                            class="text-danger">*</span></label>
                                                            <select name="venueType.venueTypeId" id="venueType"
                                                            class="form-control select2-single select2-hidden-accessible"
                                                            required="required" tabindex="-1"
                                                            aria-hidden="true">
                                                            <%
														for (int i = 0; i < venueTypeList.size(); i++) {
															HashMap venueType = (HashMap) venueTypeList.get(i);
														%>

														<%
														if (venueType.get("venueTypeId").equals(eventVenueType.get("venueTypeId"))) {
														%>
														<option value="<%=venueType.get("venueTypeId")%>"
															selected="selected"><%=venueType.get("name")%></option>
														<%
														} else {
														%>
														<option value="<%=venueType.get("venueTypeId")%>"><%=venueType.get("name")%></option>
														<%
														}
														%>

														<%
														}
														%>
                                                           </select>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Seated guests number</label>
                                                    <input type="number" class="form-control" name="seatedGuestNo"
                                                     id="seatedGuestNo"  placeholder=" " value="<%=venueDetails.get("seatedGuestNo")%>">
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Standing guests number</label>
                                                    <input type="number" class="form-control" name="standingGuestNo"
                                                      id="standingGuestNo"  placeholder=" "  value="<%=venueDetails.get("standingGuestNo")%>">
                                                </div>
                                            </div>
                                      
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Food and beverage details</label>
                                                    <textarea class="form-control" name="foodAndBeverageDetails" 
                                                    id="foodAndBeverageDetails" rows="2"><%=venueDetails.get("foodAndBeverageDetails")%></textarea>
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
                                                       id="contactEmail" placeholder="" value="<%=venueDetails.get("contactEmail")%>">

                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Street address <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="streetAddress"
                                                       id="streetAddress" placeholder="" value="<%=venueDetails.get("streetAddress")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Street address 2 </label>
                                                    <input type="text" class="form-control" name="streetAddress2"
                                                       id="streetAddress2" placeholder="" value="<%=venueDetails.get("streetAddress2")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>City <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="city"
                                                       id="city" placeholder="" value="<%=venueDetails.get("city")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Zip / Postal code <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="postalCode"
                                                      id="postalCode"  placeholder="" value="<%=venueDetails.get("postalCode")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>State <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="state" id="state"
                                                        placeholder="" value="<%=venueDetails.get("state")%>">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Country <span class="text-danger">*</span></label>
                                                    
                                                    <input type="hidden" id="countryName" name="countryName" value="<%=venueDetails.get("countryName")%>">
													<input type="hidden" id="countryCode" name="countryCode" value="<%=venueDetails.get("countryCode")%>">
													<input type="hidden" id="isdCode" name="isdCode" value="<%=venueDetails.get("isdCode")%>">
										
                                                    <select name="countryId" id="country"
                                                    class="form-control select2-single select2-hidden-accessible"
                                                    required="required" tabindex="-1"
                                                    aria-hidden="true">
                                                   	<%
														for (int i = 0; i < countryList.size(); i++) {
															HashMap country = (HashMap) countryList.get(i);
														%>

														<%
														if (country.get("countryId").equals(venueDetails.get("countryId"))) {
														%>
														<option value="<%=country.get("countryId")%>"
															selected="selected"><%=country.get("countryName")%></option>
														<%
														} else {
														%>
														<option value="<%=country.get("countryId")%>"><%=country.get("countryName")%></option>
														<%
														}
														%>

														<%
														}
														%>                                                  
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
			var contactEmail = $("#contactEmail").val();
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
		function backFun() {
			window.history.back();
		}
	</script>

</body>

</html>