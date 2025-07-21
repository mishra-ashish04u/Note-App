package com.Servlet;

import com.DAO.PostDAO;
import com.Db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Integer noteId = Integer.parseInt(request.getParameter("note_id"));
            HttpSession session = request.getSession();
            Integer userId = ((com.User.UserDetails)session.getAttribute("userD")).getId();
            
            PostDAO dao = new PostDAO(DBConnect.getConn());
            boolean f = dao.deleteNote(noteId, userId);
            
            if(f) {
                session.setAttribute("updateMsg", "Note Deleted Successfully");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on server");
            }
            
            response.sendRedirect("showNotes.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}