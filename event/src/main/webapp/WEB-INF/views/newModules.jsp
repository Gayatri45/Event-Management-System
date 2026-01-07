<%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
<%@page import="java.util.HashMap"%>
<%@page import='java.util.List'%>
<%@page import='java.util.Map'%>

<li class="nav-item dropdown"><a class="nav-link"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img
							src="/images/menu.svg">
					</a>
						<ul class="dropdown-menu dropdown-menu-right ModuleWidth">
							
							
	<div class='drop-down ModuleWidth w-100'>
		<div class='dropdown-content-heading border-bottom'>
			<h5 class='text-left'>Apps</h5>
		</div>
		<div class='ModuleScroll'>
			<div class='dropdown-content-body p-3'>
				<div class='row'>

					<%
					List<Map<String, Object>> moduleList = null;
					Map<String, Object> userMap1 = (Map<String, Object>) session.getAttribute("userMap");

					if (userMap1 == null)
						userMap1 = new HashMap<>();
					if (userMap1.containsKey("moduleList"))
						moduleList = (List<Map<String, Object>>) userMap1.get("moduleList");
					if (moduleList != null)
						for (Map<String, Object> module : moduleList) {
							//out.print(module+"</br>");
							String x = "https://www.onestop.global/moduleController?modeAccessKey=" + (Integer) module.get("moduleId");
							// x.replaceAll('\'', '');
							String y = MyUrl.profilePicPath + "/modules/" + (String) module.get("modulelLogo");

							if (module.containsKey("moduleId") && ((Integer) module.get("moduleId")) == 24) {

						if (module.containsKey("userType") && ((Integer) module.get("userType")) == 1) {
							{

								if (module.containsKey("expDate") || (module.containsKey("pricingStatus")
										&& (((String) module.get("pricingStatus")).equals("Free")
												|| ((String) module.get("pricingStatus")).equals("disabledBox")))) {
					%>
					<div class='col-sm-4'>
						<div class="ModuleBox">
							<a href='<%=x%>' data-toggle="tooltip">
								<div class='module-icon'>
									<img class='img-fluid' src='<%=y%>'
										alt='<%=(String) module.get("altMsg")%>'>

								</div>
								<div class='ModuleTitle'>
									<%=(String) module.get("moduleName")%>
								</div>
							</a>
						</div>
					</div>
					<%
					} else {
					%>
					<div class='col-sm-4'>
						<div class="ModuleBox">
							<a href='<%=MyUrl.subscribe%>' data-toggle='tooltip'>
								<div class='module-icon'>

									<img class='img-fluid' src='<%=y%>'
										alt='<%=(String) module.get("altMsg")%>'>


								</div>
								<div class='ModuleTitle'>
									<%=(String) module.get("moduleName")%>
								</div>
							</a>
						</div>
					</div>
					<%
					}
					}
					}
					} else if (module.containsKey("moduleAction") && !((String) module.get("moduleAction")).equals("#")) {
					%>


					<%
					if (module.containsKey("expDate")
							|| (module.containsKey("pricingStatus") && (((String) module.get("pricingStatus")).equals("Free")))) {
					%>
					<div class='col-sm-4'>
						<div class="ModuleBox">
							<a href="<%=(String) module.get("moduleAction")%>"
								data-toggle="tooltip">
								<div class='module-icon'>
									<img class='img-fluid' src='<%=y%>'
										alt='<%=(String) module.get("altMsg")%>'>


								</div>
								<div class='ModuleTitle'><%=(String) module.get("moduleName")%>
								</div>
							</a>
						</div>
					</div>
					<%
					} else {
					%>
					<div class='col-sm-4'>
						<div class="ModuleBox">
							<a href='<%=MyUrl.subscribe%>' data-toggle='tooltip'>
								<div class='module-icon'>
									<img class='img-fluid' src='<%=y%>'
										alt='<%=(String) module.get("altMsg")%>'>
								</div>
								<div class='ModuleTitle'><%=(String) module.get("moduleName")%></div>
							</a>
						</div>
					</div>
					<%
					}
					} else {
					%>

					<%
					if (module.containsKey("expDate")
							|| (module.containsKey("pricingStatus") && (((String) module.get("pricingStatus")).equals("Free")))) {
					%>
					
					<div class='col-sm-4'>
						<div class="ModuleBox">
							<a href='<%=x%>' data-toggle="tooltip">
								<div class='module-icon'>
									<img class='img-fluid' src='<%=y%>'
										alt='<%=(String) module.get("altMsg")%>'>
								</div>
								<div class='ModuleTitle'><%=(String) module.get("moduleName")%>
								</div>
							</a>
						</div>
					</div>
					<%
					} else {
					%>
					<div class='col-sm-4'>
						<div class="ModuleBox">
							<a href='https://www.onestop.global/subscribe'
								data-toggle='tooltip'>
								<div class='module-icon'>
									<img class='img-fluid' src='<%=y%>'
										alt='<%=(String) module.get("altMsg")%>'>
								</div>
								<div class='ModuleTitle'><%=(String) module.get("moduleName")%>
								</div>
							</a>
						</div>
					</div>
					<%
					}
					}
					}
					%>
				</div>
			</div>

		</div>
	</div>
	</ul></li>