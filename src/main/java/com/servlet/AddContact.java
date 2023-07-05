package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnection;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userid = Integer.parseInt(req.getParameter("userid"));
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String about=req.getParameter("about");
		
		Contact c =new Contact(name,email,phone,about,userid);
		ContactDAO dao=new ContactDAO(DbConnection.getConnection());
		
		HttpSession session=req.getSession();
		boolean f=dao.saveContact(c);
		if(f)
		{
			session.setAttribute("sucmsg", "Contact Saved Successfully!!");
			resp.sendRedirect("addContact.jsp");
		}else {
			session.setAttribute("failmsg", "Contact Not Saved..");
			resp.sendRedirect("addContact.jsp");
		}
	}
		
}