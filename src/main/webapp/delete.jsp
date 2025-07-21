<%@page import="com.User.UserDetails"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.Db.DBConnect"%>

<%
// Check if user is logged in
UserDetails user = (UserDetails) session.getAttribute("userD");
if (user == null) {
    response.sendRedirect("login.jsp");
    session.setAttribute("login-error", "Please Login First!!..");
    return;
}

try {
    // Get note ID from request parameter
    int noteId = Integer.parseInt(request.getParameter("note_id"));
    
    // Initialize PostDAO with database connection
    PostDAO dao = new PostDAO(DBConnect.getConn());
    
    // Delete the note (method verifies user ownership)
    boolean success = dao.deleteNote(noteId, user.getId());
    
    if (success) {
        session.setAttribute("updateMsg", "Note Deleted Successfully");
    } else {
        session.setAttribute("errorMsg", "Failed to delete note or note not found");
    }
    
} catch (NumberFormatException e) {
    session.setAttribute("errorMsg", "Invalid note ID format");
} catch (Exception e) {
    e.printStackTrace();
    session.setAttribute("errorMsg", "Error deleting note: " + e.getMessage());
}

// Redirect back to show notes page
response.sendRedirect("showNotes.jsp");
%>