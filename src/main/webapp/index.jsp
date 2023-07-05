<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.back-img{
background: url("image/oldphoto.jpg");
width: 100%;
height: 80vh;
background-repeat: no-repeat;
background-size: cover;
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container-fluid back-img text-center text-white">
<h1>Welcome to E-phone Book</h1>
</div>
<%@include file="component/footer.jsp" %>
</body>
</html>