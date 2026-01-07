<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="google-site-verification" content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
    <title>One Stop | Edit Participant</title>
     <%@include file="../headercssfile.jsp" %>
<%
HashMap participantDetails = (HashMap) request.getAttribute("participantDetails");
ArrayList<HashMap> eventList = (ArrayList<HashMap>) request.getAttribute("eventList");
HashMap participantEvent = (HashMap) participantDetails.get("event");
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
                                <h1>Update Participant Details</h1>
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
                            <div class="card" id="">
                            
                            	<form name="saveParticipant" id="saveParticipant">
                                    
                                    <input type="hidden" id="companyName" name="companyName" value="<%=participantDetails.get("companyName")%>"> 
									<input type="hidden" id="branchName" name="branchName" value="<%=participantDetails.get("branchName")%>"> 
									<input type="hidden" id="companyId" name="companyId" value="<%=participantDetails.get("companyId")%>"> 
									<input type="hidden" id="branchId" name="branchId" value="<%=participantDetails.get("branchId")%>"> 								
									<input type="hidden" id="participantId" name="participantId" value="<%=participantDetails.get("participantId")%>">
									<%-- <input type="hidden" id="profilePic" name="profilePic" value="<%=participantDetails.get("profilePic")%>"> --%>
										
                                <div class="card-body">
                                   
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Participant's Name <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="participantName"
                                                     value="<%=participantDetails.get("participantName")%>"  id="participantName" placeholder="name">
                                                </div>
                                            </div>                                          

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Event <span
                                                            class="text-danger">*</span></label>
                                                            <select name="event.eventId" id="event"
                                                            class="form-control select2-single select2-hidden-accessible"
                                                            required="required" tabindex="-1"
                                                            aria-hidden="true">
                                                            
                                                           <%
														for (int i = 0; i < eventList.size(); i++) {
															HashMap event = (HashMap) eventList.get(i);
														%>

														<%
														if (event.get("eventId").equals(participantEvent.get("eventId"))) {
														%>
														<option value="<%=event.get("eventId")%>"
															selected="selected"><%=event.get("eventName")%></option>
														<%
														} else {
														%>
														<option value="<%=event.get("eventId")%>"><%=event.get("eventName")%></option>
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
                                                    <label>Stall Name <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="stallName"
                                                     id="stallName" value="<%=participantDetails.get("stallName")%>"  placeholder=" ">
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label>Stall Description</label>
                                                    <textarea class="form-control" name="stallDescription"
                                                      id="stallDescription" rows="2"><%=participantDetails.get("stallDescription")%></textarea>
                                                </div>
                                            </div>                                                                               
                                        
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="d-block">Participant Email  <span class="text-danger">*</span>
                                                    </label>
                                                    <input type="text" class="form-control" name="participantEmail" readonly="readonly"
                                                       id="participantEmail" data-toggle="tooltip"
																title="Registered Email Address(login Id) cannot Change." value="<%=participantDetails.get("participantEmail")%>">

                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="d-block">Participant Mobile No <span class="text-danger">*</span>
                                                    </label>
                                                    <input type="number" class="form-control" name="participantPhoneNo"
                                                       id="participantPhoneNo" placeholder="" value="<%=participantDetails.get("participantPhoneNo")%>">

                                                </div>
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Participant Address </label>
                                                    <textarea class="form-control" name="participantAddress"
                                                       id="participantAddress" placeholder=""><%=participantDetails.get("participantAddress")%></textarea>
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
	
		//$('[data-toggle="tooltip"]').tooltip();
	
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
			
			$.ajax({
				type : 'POST',
				url : "/organizer/myEvent/getEventList",
				data : {
					companyId : companyId,
					branchId : branchId
				},
				dataType : "text",
				success : function(eventDetailsList) {
					
					var parsedData = JSON.parse(eventDetailsList);
					
					$('.sm-loader').hide();
					$("#queryData").css("display", "block");

					$("#event").children().remove();
					$("#event").append('<option value='+0+'>- Select -</option>');
					for (var i = 0; i < parsedData.length; i++) {
						$("#event").append('<option value='+parsedData[i].eventId+'>'+ parsedData[i].eventName+ '</option>');
					} 

				}

			});			
		}			
	}
	
	</script>
		
	<script>
	
		$('#saveParticipant').submit(function (event) { 
			
	        event.preventDefault();                 
	        var form = document.getElementById('saveParticipant'); 
	        var formData = new FormData(form); 	        
	       
	        $.ajax({ 
	            url: '/organizer/participant/saveParticipant', 
	            method: 'POST', 
	            data: formData, 
	            processData: false, 
	            contentType: false, 
	            success: function (response) {
	            	
	            	if(response.code == 1){
	            		swal("Yay !...", response.message, "success");	            		
	            		setTimeout(function () {	            	
	                        window.location.href = '/organizer/participant/participant-list';
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
			var participantName = $("#participantName").val();
			var event = $("#event").val();
			var participantEmail = $("#participantEmail").val();
			var stallName = $("#stallName").val();
			var participantPhoneNo = $("#participantPhoneNo").val();			
			
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
			if (participantName == "" || participantName == null) {
				swal("Oops...", "Please Enter Participant's Name !!", "error");
				$('#participantName').focus();
				return false;
			}
			if (event == "0") {
				swal("Oops...", "Please Select Event !!", "error");
				$('#event').focus();
				return false;
			}	
			if (stallName == "" || stallName == null) {
				swal("Oops...", "Please Enter Stall's Name !!", "error");
				$('#stallName').focus();
				return false;
			}
			if (participantEmail == "" || participantEmail == null) {
				swal("Oops...", "Please Enter Participant Email !!", "error");
				$('#participantEmail').focus();
				return false;
			}		
			if (participantPhoneNo == "" || participantPhoneNo == null) {
				swal("Oops...", "Please Enter Participant Mobile No !!", "error");
				$('#participantPhoneNo').focus();
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