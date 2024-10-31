package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get email and password from request
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        // Initialize UserDAO with the database connection
        UserDAO dao = new UserDAO(DbConnect.getConn());

        // Call the updated loginUser method with two arguments
        User u = dao.loginUser(email, pass);
        HttpSession session = req.getSession();
        
        if (u != null) {
            // Store the user object in session if login is successful
//            System.out.println("User Is Available" + u);
        	session.setAttribute("user", u);
            resp.sendRedirect("index.jsp"); 
        } else {
            // If login fails, forward the request back to login page with error message
//           System.out.println("User is not Available" + u);
        	session.setAttribute("invalidMsg", "Invalid Email & Password");
            resp.sendRedirect("login.jsp");
        }
    }
}
