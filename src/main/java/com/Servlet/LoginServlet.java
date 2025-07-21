package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.DAO;
import com.Db.DBConnect;
import com.User.UserDetails;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		DAO dao=new DAO(DBConnect.getConn());
		
		UserDetails user= dao.loginUser(us);
		if(user!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("userD", user);
			response.sendRedirect("welcome.jsp");
		}
		else {
			HttpSession session=request.getSession();
			session.setAttribute("login-failed", "Invalid User or Password..!!");
			response.sendRedirect("login.jsp");
		}
		
	}

}