<%@page import="com.onestop.codeitsoft.event.services.Secquirity"%>
    <%@page import="com.onestop.codeitsoft.event.myurl.MyUrl"%>
        <%@page import="java.util.Map"%>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.net.URLEncoder"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <div class="logo">
                <a href="/">
                    <img src="/images/logo.svg" class="img-fluid" alt="logo" />
                </a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"
                aria-controls="collapsibleNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse" id="collapsibleNavbar">
            <%Map<String, Object> userMap1 = (Map<String, Object>) session.getAttribute("userMap"); %>
           
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a> </li>
                    <li class="nav-item"><a class="nav-link" href="https://www.onestop.global/homePage"
                            target="_blank">About Us </a> </li>
                            
                    <!-- LOCAL SIGNIN -->
                    <!-- <li class="nav-item"><a class="nav-link" href="/signin">Sign In</a> </li> -->
                    
                    <jsp:useBean id="staticService" class="com.onestop.codeitsoft.event.services.MyStaticService" />

					<c:choose>
						<c:when test="${session.userMap != null}">
							<%-- <%@include file="module.jsp"%> --%>
						  <li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle active" href="#"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span><%=(String)userMap1.get("firstName") %></span>&nbsp;
									<span><%=(String)userMap1.get("lastName") %></span>
							</a>
								<div class="dropdown-menu dropdown-profile"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" id="logout" onclick="logoutBtn()">
										<span><i class="fa fa-power-off" aria-hidden="true"></i>
											Logout</span>
									</a>

								</div></li>  
								 <jsp:include page="newModules.jsp"/> 
						</c:when>
						<c:when
							test="${staticService.getMyLoggedSession(cookie['osuser_uuid'].getValue(), cookie['osuser_sec'].getValue())==true}">
						 <%Map userMap = (Map)session.getAttribute("userMap"); %> 
							
							<%-- <%@include file="module.jsp"%> --%>
							 <li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle active" href="#"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span><%=userMap.get("firstName")%></span>&nbsp;
									<span><%=userMap.get("lastName") %></span>
							</a>

								<div class="dropdown-menu dropdown-profile"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" id="logout" onclick="logoutBtn()">
										<span><i class="fa fa-power-off" aria-hidden="true"></i>
											Logout</span>
									</a>
								</div></li>
								 <jsp:include page="newModules.jsp"/> 
						</c:when>
						<c:otherwise>
								<!-- LIVE SIGNIN -->
								 <%-- <jsp:include page="newModules.jsp"/> --%>
								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle active"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>Sign In</span>
							</a>

								<div class="dropdown-menu dropdown-profile"
									aria-labelledby="navbarDropdownMenuLink">
									<ul>
									<li>
									<a class="nav-link"
								href="<%=MyUrl.loginUrl%>/login?appname=ship&appurl=<%=Secquirity.encode(MyUrl.eventurl+"/loginUserr")%>">Organizer
									</a></li>
									<li>
									<a class="nav-link" href="/participant/login">Participant</a></li>									
									</ul>
								</div></li>
								 
							   <%-- <li class="nav-item"><a class="nav-link"
									href="<%=MyUrl.loginUrl%>/login?appname=ship&appurl=<%=Secquirity.encode(MyUrl.schoolurl+"/admin/loginUserr")%>">Sign
									In</a></li> --%>
									
							 <li class="nav-item"><a class="nav-link"
								href="<%=MyUrl.loginUrl%>/signup" target="_blank">Sign Up</a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div>
        </div>
    </nav>