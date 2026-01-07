<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page errorPage="error-page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>One Stop | CompanySetUp</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Company Setup</title>
<!-- ================= Favicon ================== -->
<!-- Standard -->
<link rel="shortcut icon" href="/images/32x32.png">
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144" href="/images/144x144.png">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114" href="/images/114x114.png">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72" href="/images/72x72.png">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57" href="/images/57x57.png">
<!-- Styles -->
<link href="/css/select2/select2.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/select2/select2-bootstrap.css">
<link rel="shortcut icon" href="/images/favicon.svg">

<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144" href="/images/144x144.png">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114" href="/images/114x114.png">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72" href="/images/72x72.png">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57" href="/images/57x57.png">
<!-- Styles -->
<link href="/css/font-awesome.min.css" rel="stylesheet">
<!--<link href="${pageContext.request.contextPath}/css/line-awesome/line-awesome.css" rel="stylesheet">-->
<link href="/css/themify-icons.css" rel="stylesheet">
<link href="/css/data-table/buttons.bootstrap.min.css" rel="stylesheet" />
<link href="/css/menubar/sidebar.css?v=1.7" rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/sweetalert/sweetalert.css" rel="stylesheet">
<link href="/css/helper.css" rel="stylesheet">
<link href="/css/style.css?v=1.25" rel="stylesheet">
<link href="/css/core.css?v=1.27" rel="stylesheet">
<link href="/css/_themify.scss" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"
	integrity="sha512-bztGAvCE/3+a1Oh0gUro7BHukf6v7zpzrAb3ReWAVrt+bVNNphcl2tDTKCBr5zk7iEDmQ2Bv401fX3jeVXGIcA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"
	integrity="sha512-4WpSQe8XU6Djt8IPJMGD9Xx9KuYsVCEeitZfMhPi8xdYlVA5hzRitm0Nt1g2AZFS136s29Nq4E4NVvouVAVrBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<%
HashMap userMap = (HashMap) session.getAttribute("userMap");
HashMap companyData = (HashMap) session.getAttribute("ResponseFor1");
List countryList = (List) session.getAttribute("countryList");
List stateList = (List) session.getAttribute("stateList");
List timeZoneList = (List) session.getAttribute("timeZoneList");
List fiscalYearsList = (List) session.getAttribute("fiscalYearsList");
%>
<form action="${pageContext.request.contextPath}/updateCompany1"
	method="post" enctype="multipart/form-data">
	<input type="hidden" id="companyName" name="companyName"
		value=<%=userMap.get("firstName") + "" + userMap.get("lastName")%>>
	<input type="hidden" id="email" name="logedEmail"
		value=<%=userMap.get("email")%>> <input type="hidden"
		id="email1" name="email" value=<%="abcltd@gmail.com"%>> <input
		type="hidden" id="bankBranch" name="bankBranch" value=<%="Delhi"%>>
	<input type="hidden" id="ifscCode" name="ifscCode" value=<%="qq"%>>
	<input type="hidden" id="bankName" name="bankName" value=<%="SBI"%>>
	<input type="hidden" id="accountNo" name="accountNo"
		value=<%="345435"%>> <input type="hidden" id="swiftCode"
		name="swiftCode" value=<%="sdfg"%>> <input type="hidden"
		id="accountCurrency" name="accountCurrency" value=<%="INR"%>>
	<input type="hidden" id="branchName" name="branchName"
		value=<%="Main Branch"%>> <input type="hidden" id="panNo"
		name="panNo" value=<%=""%>> <input type="hidden" id="tanNo"
		name="tanNo" value=<%=""%>> <input type="hidden" id="branchId"
		name="branchId" value=<%=1%>> <input type="hidden"
		id="tucValue" name="tucValue" value=<%=""%>> <input
		type="hidden" id="addressName" name="addressName" value=<%=""%>>
	<input type="hidden" id="contactPerson" name="contactPerson"
		value=<%=""%>> <input type="hidden" id="contactNo"
		name="contactNo" value=<%=userMap.get("mobile")%>> <input
		type="hidden" id="addressType" name="addressType" value=<%=""%>>
	<input type="hidden" id="phoneNo" name="phoneNo"
		value=<%=userMap.get("mobile")%>> <input type="hidden"
		id="panNo" name="panNo"> <input type="hidden"
		name="companyCode" id="companyCode"
		value=<%=userMap.get("companyCode")%>> <input type="hidden"
		id="tanNo" name="tanNo"> <input type="hidden" id="token"
		name="token" value=<%=userMap.get("token")%>>

	<div
		class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
		<div class="nano">
			<div class="nano-content position-relative">
				<div class="logo">
					<a class="float-left" href="javascript:void(0)"> <img
						src="/images/logo.svg" alt="logo" />
					</a>
				</div>
				<ul>
					<li class="label active"><%=userMap.get("firstName")%> <%=userMap.get("lastName")%></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/companySetUp"> <i
							class="fa fa-address-card-o"></i> Set Up
					</a></li>
					<li>
						<div>
							<i class="fa fa-power-off"></i>
							<button id="${pageContext.request.contextPath}/logout"
								onclick="logout()" type="button">Logout</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<section id="main-content" class="m-b-30">
					<div class="row">
						<div class="col-lg-12">


							<div class="card">
								<div class="card-body">
									<div class="form-validation">
										<input name="com" type="hidden"
											value="<%=userMap.get("companyStatus")%>" id="compStatus">
										<input type="hidden" id="comp_Id" name="companyId"
											value="<%=userMap.get("companyId")%>">

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Individual/Company Name <span
														style="color: red">*</span></label>
													<div class="input-group">

														<div class="input-group-append">
															<span class="input-group-text"> </span> <input
																type="text" class="form-control" id="CName"
																placeholder="Company name" name="Company Name"
																value=<%=userMap.get("firstName") + " " + userMap.get("lastName")%>
																readonly="readonly"> <a
																href="${pageContext.request.contextPath}/#"
																data-toggle="tooltip"
																title="Individual/Company/Business Name"
																data-original-title=""> </a>

														</div>
													</div>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Your/Business Location <span
														style="color: red">*</span></label> <br> <select
														id="countryName" name="countryId">
														<option selected disabled>Country Name</option>

														<%
														HashMap countryDetails = null;
														for (int i = 0; i < countryList.size(); i++) {
															countryDetails = (HashMap) countryList.get(i);
														%>
														<option value=<%=countryDetails.get("countryId")%>>
															<%=countryDetails.get("countryName")%>
														</option>
														<%
														}
														%>
													</select> <input type="hidden" name="countryId"
														value=<%=countryDetails.get("countryId")%>>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Address/Street <span style="color: red">*</span></label>
													<input type="text" class="form-control" id="address"
														placeholder="Address" name="address">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>City <span style="color: red">*</span></label> <input
														type="text" class="form-control" id="city"
														placeholder="City" name="city">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>State <span style="color: red">*</span></label> <select
														name="stateId" id="state"
														class="form-control select2-single">
														<option selected disabled>Choose your State</option>

														<%
														HashMap stateDetails = null;
														for (int i = 0; i < stateList.size(); i++) {
															stateDetails = (HashMap) stateList.get(i);
														%>
														<option value=<%=stateDetails.get("stateId")%>>
															<%=stateDetails.get("stateName")%>
														</option>
														<%
														}
														%>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Pin/Zip Code <span style="color: red">*</span></label>
													<input type="text" id="pin" class="form-control"
														placeholder="Zip/Pin Code" name="pincode" maxlength="8">
												</div>
											</div>
										</div>
										<div class="row d-flex align-items-center">
											<div class="col-md-12">
												<h3 class="card-title m-t-15">Region And Tax Setting</h3>
												<hr>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Logo <span style="color: red">*</span></label> <input
														id="file" name="companyLogo" class="form-control"
														type="file" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Pin/Zip Code <span style="color: red">*</span></label>
													<input type="text" id="pin" class="form-control"
														placeholder="Zip/Pin Code" name="pincode" maxlength="8">
												</div>
											</div>
										</div>


										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Currency <span style="color: red">*</span></label>
													<div class="input-group">
														<input type="text" class="form-control" readonly
															name="currency" id="currency"
															value=<%=countryDetails.get("countryCurrency")%>>
														<div class="input-group-append">
															<span class="input-group-text"> <a
																href="${pageContext.request.contextPath}/#"
																data-toggle="tooltip" title="Base Currency"
																data-original-title=""> <i class="fa fa-money"></i>
															</a>
															</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Time Zone <span style="color: red">*</span></label>
													<select name="timeZone" id="user_time_zone"
														class="form-control select2-single" required>
														<option selected disabled>Choose Your Timezone</option>

														<%
														HashMap timeZoneDetails = null;
														for (int i = 0; i < timeZoneList.size(); i++) {
															timeZoneDetails = (HashMap) timeZoneList.get(i);
														%>
														<option value=<%=timeZoneDetails.get("gmtOffset")%>>
															<%=timeZoneDetails.get("timeZone")%>

														</option>

														<%
														}
														%>
													</select>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Fiscal Year <span style="color: red">*</span></label>
													<select name="fiscalYear"
														class="form-control select2-single" id="fiscal">
														<option selected disabled>Choose Fiscal Year</option>

														<%
														HashMap fiscalYearsDetails = null;
														for (int i = 0; i < fiscalYearsList.size(); i++) {
															fiscalYearsDetails = (HashMap) fiscalYearsList.get(i);
														%>
														<option value=<%=fiscalYearsDetails.get("fyId")%>>
															<%=fiscalYearsDetails.get("fyName")%>
														</option>
														<%
														}
														%>

													</select>

												</div>
											</div>
											<div class="col-md-6" id="hst">
												<div class="form-group">
													<label>Taxation Type <span style="color: red">*</span></label>
													<div class="input-group">
														<select name="taxationType" id="taxType"
															class="form-control input-default">
															<%-- <%
															//JSONArray jsonArray = result1.getJSONArray("taxationTypeList");

															for (int i = 0; i < jsonArray.length(); i++) {
																JSONObject jsonObject2 = jsonArray.getJSONObject(i);
															%>

															<option value=<%=jsonObject2.getInt("ttId")%>><%=jsonObject2.getString("ttName")%></option>
															<%
															}
															%> --%>
														</select>
														<div class="input-group-append">

															<span class="input-group-text"> <a
																href="${pageContext.request.contextPath}/#"
																data-toggle="tooltip" title=""
																data-original-title="If Taxation Type set  GST, then invoice will be  'Tax Invoice' otherwise invoice will be 'Bill of Supply'.">
																	<i class="fa-thin fa-money-check"></i>
															</a>
															</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6 displayNone" id="gstDisplay">
												<div class="form-group">
													<label>GSTIN /Tax No</label> <input
														title="GSTIN/HST/TAX No" id="gst" type="text"
														class="form-control" placeholder="GST/HST No/Tax No"
														name="gstin" maxlength="15" onblur="chkGst(this)">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="footer fixedfoot">
								<img id="progress" src="/images/indicator.gif" alt="Loding..."
									style="display: none" />

								<button type="submit" class="btn btn-success m-r-10"
									id="saveBtn">
									<i class="fa-sharp fa-solid fa-floppy-disk"></i> Save
								</button>

							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript" src="./jquery-1.11.1.min.js"></script>

<!--<script src="assets/js/jquery-3.5.1.min.js"></script>-->
<script type="text/javascript" src="<c:url value="/js/popper.min.js" />"></script>
<script type="text/javascript" src="/popper.min.js"></script>
<script type="text/javascript" src="/bootstrap.min.js"></script>
<script src="/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="/polyfill.min.js"></script>
<script type="text/javascript" src="/core.js?v=10.81"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		if ($('#user_time_zone').find('option').size() === 2) {
			$('#user_time_zone').prop("selectedIndex", 1).val();
		}
		$('[data-toggle="tooltip"]').tooltip();
		if ('${erpMap.countryId}' === '99') {
			$('#hst').removeClass('displayNone');
		} else {
			$('#hst').addClass('displayNone');
		}
	});

	function setTaxation(obj) {
		if ($(obj).val() === '3') {
			$('#gstDisplay').addClass('displayNone');
		} else {
			$('#gstDisplay').removeClass('displayNone');
		}
	}
	$('#compProfile')
			.submit(
					function(event) {
						event.preventDefault();
						event.returnValue = false;
						if ($('#compName').val() === ""
								|| $('#compName').val() === null) {
							sweetAlert(
									"Oops...",
									"Company/Individual Name is required !!",
									"warning");
							return false;
						}
						if ($('#country').val() === '0') {
							swal("Oops...",
									"Please Select Your Location !!",
									"warning");
							return false;
						}
						if ($('#address').val() === ""
								|| $('#address').val() === null) {
							sweetAlert("Oops...", "Address is required !!",
									"warning");
							return false;
						}
						if ($('#city').val() === ""
								|| $('#city').val() === null) {
							sweetAlert("Oops...", "City is required !!",
									"warning");
							return false;
						}
						if ($('#state').val() === '0') {
							swal("Oops...", "Please Select Your State !!",
									"warning");
							return false;
						}
						if ($('#pin').val() === ""
								|| $('#pin').val() === null) {
							sweetAlert("Oops...",
									"Pin/Zip Code is required !!",
									"warning");
							return false;
						}
						if ($('#curr').val() === ""
								|| $('#curr').val() === null) {
							sweetAlert("Oops...",
									"Currency is required !!", "warning");
							return false;
						}
						if ($('#user_time_zone').val() === '0') {
							swal("Oops...", "Please Select Time Zone!!",
									"warning");
							return false;
						}
						if ($('#fiscal').val() === '0') {
							swal(
									"Oops...",
									"Please Select Fiscal (Financial) Year !!",
									"warning");
							return false;
						}
						$('#progress').show();
						$.post("updateCompProfile", $('form#compProfile')
								.serialize(), function(data) {
							$('#progress').hide();
							if ($(data).find('.errorMessage').size() > 0) {
								swal("Oops...", $(data).find(
										'.errorMessage').text(), "error");
							} else {
								swal({
									title : "",
									text : $(data).find('.actionMessage')
											.text(),
									type : "success",
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Ok!!"
								}, function() {
									swal("Success !!", $(data).find(
											'.actionMessage').text(),
											"success");
								});
								$('.swal2-confirm').click(function() {
									window.location = 'home';
								});
							}
						});
					});
	</script>
<script type="text/javascript">
	function logout(){
		 MyLogoutDiv=document.getElementById("logout");
		MyLogoutDiv.onclick =function(){
      	alert('loging out');
      	  
  		fetch("${pageContext.request.contextPath}/logout", {
  			  method: 'POST',
  			  body:JSON.stringify( {
          			"logedEmail":document.getElementById("email").value,
      				 "token":document.getElementById("token").value
      				  }),
        		  dataType:'
      		    
  			  })
  			  .then(function(data)
  			  {
  				  return data.text();
  			})
  			.then(function){
  				alert);
  				window.logistics(${pageContext.request.contextPath}/loginUser","_self");

  			})
  			
  			.catch(error => console.error('Error:', error)); 
		}}; 

	
	</script>
<script>
	function save1(){
		alert("alert called");
	$.ajax({
		  type: "POST",
		  url: "${pageContext.request.contextPath}/updateCompany1",
		  data:  {
						"email" : "abcltd@gmail.com ",
					  "logedEmail ":document.getElementById("email").value,
						"token ":document.getElementById("token").value,
						"companyLogo ":document.getElementById("companyLogo").value,
						"phoneNo ":1234567,
						"currency ":document.getElementById("currency").value,
						"bankName": "SBI", 
						"bankBranch ":"Delhi ",  
						"ifscCode ":"qq ",
						"companyCode":document.getElementById("companyCode").value,
						"accountNo": "345435",
						"swiftCode": "sdfg",
						"accountCurrency": "INR",
						"timeZone": document.getElementById("user_time_zone").value,
						"companyName": document.getElementById("companyName").value,
						"branchName": "Main Branch",
						"panNo": "",
						"tanNo": "",
						"companyId ":document.getElementById("comp_Id").value,
						"taxationType": document.getElementById("taxType").value,
						"branchId": 1,
						"fiscalYear": document.getElementById("fiscal".value),
						"directorFileName": "",
						"partnerDeedFileName": "",
						"moaFileName": "",
						"aoaFileName": "",
						"gstFileFileName": "",
						"panFileFileName": "", 
						"dinFileName ":"",
						"dsignatureFileName": "",
						"tanFileFileName": "",
						"vatFileFileName": "",
						"regisFileName": "",
						"boardFileName": "",
						"addressType": "",
						"addProofFileName": "",
						"coiFileName": "",
						"trademarkFileName": "",
						"cancelChequeFileName": "", 
						"passbookFileName ":"",
						"letterHeadFileName": "",
						"bcardFileName": "",
						"address":document.getElementById("address").value,
						"city":document.getElementById("city").value,
						"pincode": document.getElementById("pin").value,
						"tucValue": "",
						"gstin": document.getElementById("gst").value,
						"addressName": "",
						"contactPerson":"",
						"contactNo":123123123,
						"countryId":document.getElementById("countryName").value,
						"stateId":document.getElementById("state").value
					},
					headers:{
						"Content-Type":"multipart/form-data"
					},
		  success: function(msg){
		        document.open();
		        document.write(msg);
		        document.close();
		  },
		  error: function(XMLHttpRequest, textStatus, errorThrown) {
		     alert("some error");
		  }
		});
	}
	
	</script>
</body>
</html>
