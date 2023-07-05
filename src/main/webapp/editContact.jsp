<%@page import="com.conn.DbConnection"%>
<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
<%
	if (user== null) {
		session.setAttribute("invaliduser", "Please Login");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Contact Page</h4>

						<%
						String sucessmsg = (String) session.getAttribute("sucmsg");
						String errorms = (String) session.getAttribute("failmsg");
						if (sucessmsg != null) {
						%>
						<p class="text-success text-center"><%=sucessmsg%></p>
						<%
						session.removeAttribute("sucmsg");
						}
						if (errorms != null) {
						%>
						<p class="text-danger text-center"><%=errorms%></p>
						<%
						session.removeAttribute("failmsg");
						}
						%>
						<form action="update" method="post">
							<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDAO dao = new ContactDAO(DbConnection.getConnection());
							Contact c = dao.getContactByID(cid);
							%>

							<input type="hidden" value="<%=cid%>" name="cid">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter name</label> <input
									value="<%=c.getName()%>" name="name" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email address</label> <input
									value="<%=c.getEmail()%>" name="email" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone no</label> <input
									value="<%=c.getPhone()%>" name="phone" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Add About</label> <input
									value="<%=c.getAbout()%>" name="about" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Save
									Contact</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<div style="margin-top: 55px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>