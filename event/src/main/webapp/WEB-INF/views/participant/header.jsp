<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
HashMap participantDetailsLogin = (HashMap) session.getAttribute("participantDetails");
%>

<div class="header fixed-top">
	<div class="container-fluid">
		<div class="row d-flex align-items-center">
			<div class="col float-left">
				<div class="hamburger sidebar-toggle">
					<span class="line"></span> <span class="line"></span> <span
						class="line"></span>
				</div>
			</div>
			<div class="float-right border-left">
				<ul>
					<li class="header-icon dib"><span class="user-avatar">
							<img src="/images/user.svg" class="avatar-img m-r-10" /> <%
						 if (participantDetailsLogin != null) {
						 %> <%=participantDetailsLogin.get("participantName")%> &nbsp;(<%
						 out.print("Participant");
						 %>) <%
						 }
						 %>
					</span>
						<div class="drop-down dropdown-profile">
							<div class="dropdown-content-body">
								<ul>
									<li><a id="profile" href="/participant/profile"><i
											class="ti-user"></i> <span>Profile </span></a></li>
									<li><a id="logout" href="/participant/logout" onclick="logoutBtn()"><i
											class="ti-power-off"></i> <span>Logout</span></a></li>
								</ul>
							</div>
						</div></li>
				</ul>
			</div>


		</div>
	</div>
</div>
