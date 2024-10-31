package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAo;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Retrieve form parameters from the request
        int userId = Integer.parseInt(req.getParameter("userid"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phno = req.getParameter("phno");
        String about = req.getParameter("about");
        
        // Create a Contact object using the provided form data
        Contact c = new Contact(name, email, phno, about, userId);
        
        // Instantiate ContactDAo with a database connection
        ContactDAo dao = new ContactDAo(DbConnect.getConn());
        
        // Retrieve the session object
        HttpSession session = req.getSession();
        
        // Attempt to save the contact
        boolean isSaved = dao.saveContact(c);
        
        if (isSaved) {
            // If the contact was successfully saved, set a success message in the session
            session.setAttribute("succMsg", "Your Contact Saved.");
            resp.sendRedirect("addContact.jsp");  // Redirect to the addContact.jsp page
        } else {
            // If saving the contact failed, set a failure message in the session
            session.setAttribute("failedMsg", "Something went wrong on the server.");
            resp.sendRedirect("addContact.jsp");  // Redirect to the addContact.jsp page
        }
    }
}
