<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="google-site-verification"
	content="W1jhS5NLR7iqJHcsxuSckI2KAVDQmanxghMSMo57aFI" />
<title>One Stop | Check IN Scan</title>
 <%@include file="../headercssfile.jsp" %>

<style>
#reader {
	width: 600px;
}
</style>

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
								<h1>CHECK-IN Scanner</h1>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="container-fluid">
				<section id="main-content">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body mt-5">

									<h3>Check IN Scan</h3>
									<hr>
									<div class="row justify-content-center">
										<div id="reader" class="col-lg-6"></div>
									</div>
									
									<br><br>

									<div class="row justify-content-center">
										<button type="button" class="btn btn-success"
											onclick="scanqrPass()">
											<i class="fa fa-qrcode"></i> Scan
										</button>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>


	<script src="/js/qr.js"></script>
	<%@include file="../footerjsfile.jsp" %>
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<script>
		var onestopCodeScanner = new Html5QrcodeScanner("reader", {
			fps : 10,
			qrbox : 250
		});

		function scanqrPass() {
			onestopCodeScanner.render(onScanSuccess, onScanError);
		}

		function onScanError(errorMessage) {
			// Handle Scan Error 
			alert("error");
		}

		function onScanSuccess(qrCodeMessage) {
			console.log(qrCodeMessage);

			$.ajax({
				type : 'POST',
				url : "/organizer/scanner/checkInAttendee",
				data : {
					qrCodeMessage : qrCodeMessage
				},
				dataType : "text",
				success : function(checkInAttendee) {
					
					var response = JSON.parse(checkInAttendee);
					console.log(response);
					
					if(response.code == 1){
	            		swal("Yay !...", response.message, "success");	            		
	            		 setTimeout(function () {	            	
	            			 location.reload();		
	                    }, 4000);             		
	            	}
	            	else{
	            		 swal("Oops...", response.message, "error");
	            		 setTimeout(function () {
	            			 location.reload();		                       
	                     }, 4000); 
	            	} 
				}
			});
		}
	</script>


</body>

</html>