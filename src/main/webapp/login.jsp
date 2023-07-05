<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
</head>

<body style="background-color: #dedede;">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Login-In </h4>
					
				 <%
					String invaliduser=(String)session.getAttribute("invaliduser");
					if(invaliduser!=null)
					{
					%>
					<p class="text-danger text-center"><%=invaliduser %></p>
					<%
					session.removeAttribute("invaliduser");
					}%>
					
					
					<%
					String logmsg=(String)session.getAttribute("logmsg");
					if(logmsg!=null)
					{
					%>
					<p class="text-success text-center"><%=logmsg %></p>
					<%
					session.removeAttribute("logmsg");
					}%> 
					
					
					
					
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1"
									>
							</div>
								<div class="text-center">
							<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top: 140px;">
<%@include file="component/footer.jsp" %>
</div>
</body>
</html>