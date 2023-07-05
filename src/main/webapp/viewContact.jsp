<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnection"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.crd-ho:hover {
	background-color: #ededed;
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>
	
	<%
	if (user == null) {
		session.setAttribute("invaliduser", "Please Login");
		response.sendRedirect("login.jsp");
	}
	%>
		<%
		String sucmsg =(String)session.getAttribute("succ");
		String errorms = (String) session.getAttribute("fell");
		if(sucmsg!=null){
		%>
		<div class="alert alert-success" role="alert"><%=sucmsg %></div>
		
		<%
		session.removeAttribute("succ");
		}
		if (errorms != null) {
			%>
			<p class="text-danger text-center"><%=errorms%></p>
			<%
			session.removeAttribute("fell");
			}
			%>
		
	<div class="container">
		<div class="row p-4">


			<%
			if (user != null) {

				ContactDAO dao = new ContactDAO(DbConnection.getConnection());
				List<Contact> contact = dao.getAllContacts(user.getId());

				for (Contact c : contact) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">

						<h5>
							Name :<%=c.getName()%></h5>
						<p>
							email :
							<%=c.getEmail()%></p>
						<p>
							phone :
							<%=c.getPhone()%></p>
						<p>
							About :
							<%=c.getAbout()%></p>
						<div class="text-center">
							<a href="editcontact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a>
								 <a data-toggle="modal" data-target="#exampleModalCenterok" href="delete?cid=<%=c.getId()%>"
								class="btn btn-danger btn-sm text-white">Delete</a>
								<div class="modal fade" id="exampleModalCenterok" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Alert!!!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <h6>Do you want to delete this contact</h6>
      </div>
      <div class="modal-footer text-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="delete?cid=<%=c.getId()%>"class="btn btn-primary">Yes</a>
      </div>
    </div>
  </div>
</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>
	</div>

</body>
</html>