<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="component/allCss.jsp" %>
</head>
<body style="background-color: #f7faf8;">
	<%@ include file="component/navbar.jsp" %>

	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Registration Page</h4>
						
						<%
							String sucssMsg = (String) session.getAttribute("sucssMsg");
							String errorMsg = (String) session.getAttribute("errorMsg");
							if (sucssMsg != null) {
						%>
						<p class="text-success text-center"><%= sucssMsg %></p>
						<%
							session.removeAttribute("sucssMsg"); // Clear message after displaying
							}
							if (errorMsg != null) {
						%>
						<p class="text-danger text-center"><%= errorMsg %></p>
						<%
							session.removeAttribute("errorMsg");
							}
						%>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="name">Enter Name</label>
								<input name="name" type="text" class="form-control" id="name">
							</div>
							
							<div class="form-group">
								<label for="email">Email Address</label>
								<input name="email" type="email" class="form-control" id="email">
							</div>
							
							<div class="form-group">
								<label for="password">Password</label>
								<input name="password" type="password" class="form-control" id="password">
							</div>
							
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div style="margin-top:230px">
		<%@ include file="component/footer.jsp" %>
	</div>
</body>
</html>
