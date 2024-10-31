<%@page import="com.dao.UserDAO"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Contact</title>
    <%@include file="component/allCss.jsp" %>
</head>
<body>
    <%@include file="component/navbar.jsp" %>

    <%
        // Retrieve the user from the session
        User user2 = (User) session.getAttribute("user");
        if (user == null) {
            // Redirect to login if the user is not found in the session
            session.setAttribute("InvalidMsg", "Login Please..");
            response.sendRedirect("login.jsp");
            return; // Exit after redirecting
        }
    %>

    <div class="container-fluid">
        <div class="row p-2">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-success">Add Contact Page</h4>

                        <%
                            // Retrieve success and error messages from session
                            String succMsg = (String) session.getAttribute("succMsg");
                            String errorMsg = (String) session.getAttribute("failedMsg");

                            // Display success message if available
                            if (succMsg != null) {
                        %>
                        <p class="text-success text-center"><%= succMsg %></p>
                        <%
                            // Remove message from session after displaying
                            session.removeAttribute("succMsg");
                        }

                            // Display error message if available
                            if (errorMsg != null) {
                        %>
                        <p class="text-danger text-center"><%= errorMsg %></p>
                        <%
                            // Remove message from session after displaying
                            session.removeAttribute("failedMsg");
                        }
                        %>

                        <form action="addContact" method="post">
                            <%
                            if(user!=null)
                            {%>
                            <input type="hidden" value="<%= user.getId() %>" name="userid">
                            <%}
                            
                            %>
                            

                            <div class="form-group">
                                <label for="name">Enter Name</label>
                                <input name="name" type="text" class="form-control" id="name" aria-describedby="emailHelp">
                            </div>

                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp">
                            </div>

                            <div class="form-group">
                                <label for="phone">Enter Phone Number</label>
                                <input type="number" class="form-control" id="phone" name="phno" aria-describedby="emailHelp">
                            </div>

                            <div class="form-group">
                                <textarea name="about" rows="3" placeholder="Enter About" class="form-control"></textarea>
                            </div>

                            <div class="text-center mt-2">
                                <button type="submit" class="btn btn-success">Save Contact</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
