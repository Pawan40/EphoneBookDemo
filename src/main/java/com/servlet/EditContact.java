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

@WebServlet("/update")
public class EditContact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int cid= Integer.parseInt(req.getParameter("cid"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String about=req.getParameter("about");
		
		Contact c =new Contact();
		c.setId(cid);
		c.setName(name);
		c.setEmail(email);
		c.setPhone(phone);
		c.setAbout(about);
		ContactDAO dao=new ContactDAO(DbConnection.getConnection());
		HttpSession session=req.getSession();
		boolean f=dao.updateContact(c);
		if(f)
		{
			session.setAttribute("sucmsg", "Update Saved Successfully!!");
			resp.sendRedirect("viewContact.jsp");
		}else {
			session.setAttribute("failmsg", "Update Not Saved..Try later");
			resp.sendRedirect("editcontact.jsp?cid="+cid);
		}
		
		
		
		
	}
		
}