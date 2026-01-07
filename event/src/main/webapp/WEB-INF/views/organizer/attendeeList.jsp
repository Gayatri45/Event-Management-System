<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<HashMap> attendeeListdata = (ArrayList<HashMap>)request.getAttribute("attendeeList");  
int noOfAttendee = (Integer)request.getAttribute("noOfAttendee");   
ArrayList<HashMap> tableData = (ArrayList<HashMap>)request.getAttribute("attendeeDetails");  
int pageid = (int)request.getAttribute("page"); 
int pageSizeli = (int)request.getAttribute("pageSize"); 
int i=0;
%>
 <div class="row">
	<div class="col-lg-12">
		<div class="card">
		
		<input type="hidden" id="noOfAttendee" value="<%=noOfAttendee%>">
		<input type="hidden" id="count">
		<input type="hidden" id="activeLi">
		<input type="hidden" id="pageSizeli" value="<%=pageSizeli%>">
			<div class="card-body mt-5">
				<div class="table-responsive">
					<table id="bootstrap-data-table-export"
						class="table table-vcenter text-nowrap border-bottom"
						id="hr-table">
						<thead>
							<tr>
								<th class="border-bottom-0" width="30">Sl. No.</th>
								<th class="border-bottom-0">Attendee Name</th>
								<th class="border-bottom-0">Email</th>
								<th class="border-bottom-0">Mobile No</th>
								<th class="border-bottom-0">Event Name</th>
								<th class="border-bottom-0">Start Date</th> 
								<th class="border-bottom-0">End Date</th>
								<th class="border-bottom-0">Approval</th>
								<th class="border-bottom-0">Payment</th>
								<th class="border-bottom-0">Action</th>
							</tr>
						</thead> 
						<tbody class="popup">

							<%
							for (i = 0; i < tableData.size(); i++) {		
							%>														
							 <%	HashMap attendeeList = (HashMap) tableData.get(i);
								HashMap event = (HashMap) attendeeList.get("event");
								int attendeeApprovalStatus = (Integer) attendeeList.get("attendeeApprovalStatus");
								int paymentGatewayRequired = (Integer) attendeeList.get("payment");%>
							<tr>
								 <% if(pageid == 1){ %>  
								<td><%=(i+1) %></td>	
								 <%}else{ %>
								<td><%=(pageid - 1) * 10 + (i+1)%></td>	
								<%} %>							
								<td><%=attendeeList.get("firstName") %> <%=attendeeList.get("lastName") %></td>
								<td><%=attendeeList.get("email") %></td>
								<td><%=attendeeList.get("phoneNo") %></td>
								<td>
									 <div class="event-table-block">										
										<p class="m-0">
											<a title="Event"> <%=event.get("eventName")%>
											</a>
										</p>
									</div> 
								</td>
								<td><h6><span class="badge badge-info p-1"><%=event.get("eventStartDate")%></span></h6></td>
								<td><h6><span class="badge badge-pink p-1"><%=event.get("eventLastDate")%></span></h6></td>
								
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
								<td>
									<div class="dropdown">
										<a href="javascript:void(0)"
											class="btn btn-sm btn-outline-primary" data-toggle="dropdown"
											aria-expanded="false"><i class="ti-angle-down"></i></a>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">											
											<li><a href="/organizer/attendee/attendee-details?attendeeId=<%=attendeeList.get("attendeeId")%>"><i
													class="fa fa-file-text mr-2"></i>Details</a></li>
													
											<li><a href="/organizer/attendee/edit-attendee?attendeeId=<%=attendeeList.get("attendeeId")%>"><i
													class="ti-pencil mr-2"></i>Edit</a></li>																							
											<!-- <li><a href="javascript:void(0)" data-toggle="modal"
												data-target="#deletemodal"><i class="ti-trash mr-2"></i>Delete
											</a></li> -->
										</ul>
									</div>
								</td> 
							</tr>						
							
							<%
							}
							%> 

						</tbody>
					 </table>
				</div>
			</div>
		</div>
	</div>
</div> 

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<script>
$(document).ready(function(){  
	<%-- $("#bootstrap-data-table-export_info").text("Showing "+(((<%=pageid%> - 1) * <%=pageSizeli%>)+1)+" to "+((<%=pageid%>) * <%=pageSizeli%>)+" of "+<%=noOfAttendee%>+" entries"); --%>
	var startNo = (((<%=pageid%> - 1) * <%=pageSizeli%>)+1);
	var lastNo = (startNo+<%=i%>) - 1;
	$("#bootstrap-data-table-export_info").text("Showing "+startNo+" to "+lastNo+" of "+<%=noOfAttendee%>+" entries");		
}); 	
</script> 

<script>
$(document).ready(function(){
		
	let count = 1;
	let c = 1;
 	let id; 	
 	var pageid = <%=pageid%>;
 	var pageSizeli = <%=pageSizeli%>;
 	var noOfAttendee = <%=noOfAttendee%>; 
	
 	$("#bootstrap-data-table-export_next").removeClass('disabled');
 	
	$("#bootstrap-data-table-export_wrapper").find('div#bootstrap-data-table-export_paginate ul li').each(function() {				       				
		 id = $(this).attr('id');			
		
		if (!id){
       		id = count;	  
       		$(this).attr('onclick', 'loadData(' + c + ', ' + pageSizeli + ');');
       		$(this).removeClass('active');
       		$(this).find('a').attr('id', "c"+id);	
       		count++;							
		}		
		$(this).attr('id', id);	
		 
		});	
					
	  	var totalPagination = noOfAttendee/pageSizeli;				
		var parts = totalPagination.toString().split('.');
		var integerPart = parts[0]; // "3"
		var decimalPart = parts[1]; // "7"
	
		if(decimalPart > 0){	
		   for(var a =0; a < integerPart; a++){	
			   
			   	var clonedLi = $("#1").clone();				  
			 	clonedLi.attr('id', (c+1));
			 	clonedLi.attr('onclick', 'loadData(' + (c+1) + ', ' + pageSizeli + ');');
				clonedLi.find('a').attr('id', "c"+(c+1)).text(c+1);					
				$("#"+c).after(clonedLi);
				c++;			
		   }			  	 
		}else{
			--integerPart;		
		   for(var a =0; a < integerPart; a++){		
				   
			   	var clonedLi = $("#1").clone();					  
			 	clonedLi.attr('id', (c+1));
			 	clonedLi.attr('onclick', 'loadData(' + (c+1) + ', ' + pageSizeli + ');');
				clonedLi.find('a').attr('id', "c"+(c+1)).text(c+1);		
				$("#"+c).after(clonedLi);
				c++;			
			}			   	
		}	
		
		$("#count").val(c);
		
		$("#"+pageid).addClass('active');		
		
		if(pageid > 1){
			$("#bootstrap-data-table-export_previous").removeClass('disabled');
	 	}
		
		var activeItems = $('.pagination li.active');

	    var activeItemText = 0;
	    activeItems.each(function() {
	       	activeItemText = $(this).text();
	       	$("#activeLi").val(activeItemText);
	    });
	    
	    $("#bootstrap-data-table-export_previous").on('click', function(){	
	    	--activeItemText;
			loadData(activeItemText, pageSizeli);
		});
	    
	    if(pageid == c){
	    	$("#bootstrap-data-table-export_next").addClass('disabled');
	    }
	    
	    $("#bootstrap-data-table-export_next").on('click', function(){
			++activeItemText;
			loadData(activeItemText, pageSizeli);
		});
	    	    	  	  
	    /* $('[name="bootstrap-data-table-export_length"]').on('change', function(){		
			var pSize = $('[name="bootstrap-data-table-export_length"]').val();
			loadData(pageid, pSize);	
		});  */
});
</script>
