<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
<style type="text/css">
.back-img{
	background: url("img/phone.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	 
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>


	<div class="container-fluid back-img text-center text-success">
	<h1>Welcome to PhoneBook App</h1>
	</div>
<%@include file="component/footer.jsp" %>
</body>
</html>