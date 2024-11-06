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

@WebServlet("/update")
public class EditContact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // Ensure that 'cid' is fetched from the request
	    String cidStr = req.getParameter("cid");
	    if (cidStr == null || cidStr.isEmpty()) {
	        HttpSession session = req.getSession();
	        session.setAttribute("failedMsg", "Contact ID is missing.");
	        resp.sendRedirect("editcontact.jsp"); // Redirect to the edit page with an error message
	        return;
	    }
	    
	    int cid = Integer.parseInt(cidStr); // Now you are sure 'cid' is not null
	    String name = req.getParameter("name");
	    String email = req.getParameter("email");
	    String phno = req.getParameter("phno");
	    String about = req.getParameter("about");
	    
	    Contact c = new Contact();
	    c.setId(cid); // Set the ID here
	    c.setName(name);
	    c.setEmail(email);
	    c.setPhno(phno);
	    c.setAbout(about);
	    
	    ContactDAo dao = new ContactDAo(DbConnect.getConn());
	    HttpSession session = req.getSession();
	    
	    boolean isSaved = dao.updateContact(c);
	    
	    if (isSaved) {
	        session.setAttribute("succMsg", "Your Contact Updated.");
	        resp.sendRedirect("viewContact.jsp");  
	    } else {
	        session.setAttribute("failedMsg", "Something went wrong on the server.");
	        resp.sendRedirect("editcontact.jsp?cid="+cid);  
	    }
	}
}
