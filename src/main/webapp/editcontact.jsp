<%@ page import="java.sql.Connection, java.util.List, com.dao.ContactDAo, com.conn.DbConnect, com.entity.Contact" %>

<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>

</head>
<body>

	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("inavlidMsg", "Login please..");
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Contact Page</h4>

						<%
			
						String errorMsg = (String) session.getAttribute("failedMsg");
                         if (errorMsg != null) {
						%>
						<p class="text-danger text-center"><%=errorMsg%></p>
						<%
				
						session.removeAttribute("failedMsg");
						}
						%>

						<form action="update" method="post">
							<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDAo dao = new ContactDAo(DbConnect.getConn());
							Contact c = dao.getContactByID(cid);
							%>
							<!-- Hidden input to store the Contact ID -->
							<input type="hidden" name="cid" value="<%= c.getId() %>">


							<div class="form-group">
								<label for="name">Enter Name</label> <input
									value="<%=c.getName()%>" name="name" type="text"
									class="form-control" id="name" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="email">Email address</label> <input
									value="<%=c.getEmail()%>" name="email" type="email"
									class="form-control" id="email" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="phone">Enter Phone Number</label> <input
									value="<%=c.getPhno()%>" type="number" class="form-control"
									id="phone" name="phno" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<textarea name="about" rows="3" placeholder="Enter About"
									class="form-control"><%=c.getAbout()%></textarea>
							</div>

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Update
									Contact</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>