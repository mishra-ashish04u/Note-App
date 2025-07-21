package com.Servlet;

import com.DAO.PostDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try {
            // Validate user is logged in
            UserDetails user = (UserDetails) session.getAttribute("userD");
            if(user == null) {
                session.setAttribute("login-error", "Session expired. Please login again.");
                response.sendRedirect("login.jsp");
                return;
            }

            // Get parameters
            Integer noteId = Integer.parseInt(request.getParameter("note_id"));
            String title = request.getParameter("title").trim();
            String content = request.getParameter("content").trim();
            
            // Validate input
            if(title.isEmpty() || content.isEmpty()) {
                session.setAttribute("errorMsg", "Title and content cannot be empty");
                response.sendRedirect("edit.jsp?note_id=" + noteId);
                return;
            }
            
            // Update note
            PostDAO dao = new PostDAO(DBConnect.getConn());
            boolean success = dao.updateNote(noteId, title, content, user.getId());
            
            if(success) {
                session.setAttribute("updateMsg", "Note Updated Successfully");
            } else {
                session.setAttribute("errorMsg", "Failed to update note");
            }
            
        } catch (NumberFormatException e) {
            session.setAttribute("errorMsg", "Invalid note ID");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Server error: " + e.getMessage());
        }
        
        response.sendRedirect("showNotes.jsp");
    }
}