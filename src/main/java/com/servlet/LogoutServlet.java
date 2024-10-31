package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Invalidate the current session to remove all attributes
        HttpSession session = req.getSession(false); // Use false to avoid creating a new session if one doesn't exist
        if (session != null) {
            session.removeAttribute("user");  // Remove "user" attribute from session
            session.invalidate();  // Invalidate the session (optional but recommended to fully clear the session)
        }
        
        // Create a new session to set a logout message
        HttpSession newSession = req.getSession(true);  // Create a new session
        newSession.setAttribute("logMsg", "Logout Successfully.");

        // Redirect to login page after logout
        resp.sendRedirect("login.jsp");
    }
}
