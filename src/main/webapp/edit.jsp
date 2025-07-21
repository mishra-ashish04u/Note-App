<%@page import="com.User.Post"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.User.UserDetails"%>

<%
// Check login
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
    response.sendRedirect("login.jsp");
    session.setAttribute("login-error", "Please Login First!!..");
    return;
}

// Get note details
Post p = null;
String errorMsg = null;

try {
    int noteId = Integer.parseInt(request.getParameter("note_id"));
    PostDAO dao = new PostDAO(DBConnect.getConn());
    p = dao.getNoteById(noteId, user1.getId());
    
    if(p == null) {
        errorMsg = "Note not found";
        session.setAttribute("errorMsg", errorMsg);
        response.sendRedirect("showNotes.jsp");
        return;
    }
} catch (Exception e) {
    e.printStackTrace();
    errorMsg = "Invalid note ID";
    session.setAttribute("errorMsg", errorMsg);
    response.sendRedirect("showNotes.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note | NoteKeeper</title>
<%@ include file="all_components/allcss.jsp"%>
<style>
    :root {
        --neon-blue: #0ff0fc;
        --neon-purple: #9600ff;
        --dark-bg: #0a0a1a;
        --darker-bg: #050510;
        --text-light: #e0e0ff;
    }
    
    body {
        background-color: var(--dark-bg);
        color: var(--text-light);
    }
    
    h1 {
        color: var(--neon-blue);
        text-shadow: 0 0 10px rgba(0, 240, 252, 0.5);
        font-weight: 700;
        margin-bottom: 2rem;
    }
    
    .form-control {
        background-color: var(--darker-bg);
        border: 1px solid rgba(160, 160, 255, 0.2);
        color: var(--text-light);
        border-radius: 5px;
    }
    
    .form-control:focus {
        background-color: var(--darker-bg);
        border-color: var(--neon-blue);
        box-shadow: 0 0 0 0.2rem rgba(0, 240, 252, 0.25);
        color: white;
    }
    
    label {
        color: var(--neon-blue);
        font-weight: 500;
        margin-bottom: 0.5rem;
    }
    
    textarea.form-control {
        min-height: 200px;
        resize: vertical;
    }
    
    .btn-neon {
        background: linear-gradient(45deg, var(--neon-blue), var(--neon-purple));
        border: none;
        color: white;
        font-weight: 600;
        padding: 0.8rem 2rem;
        border-radius: 30px;
        box-shadow: 0 0 15px rgba(0, 240, 252, 0.4);
        transition: all 0.3s ease;
    }
    
    .btn-neon:hover {
        transform: translateY(-3px);
        box-shadow: 0 0 25px rgba(0, 240, 252, 0.6);
    }
    
    .btn-outline-neon {
        background: transparent;
        color: var(--neon-blue);
        border: 2px solid var(--neon-blue);
        padding: 0.8rem 2rem;
        border-radius: 30px;
        transition: all 0.3s ease;
    }
    
    .btn-outline-neon:hover {
        background: rgba(0, 240, 252, 0.1);
        color: var(--text-light);
    }
    
    .alert {
        border-radius: 5px;
        margin-bottom: 1.5rem;
    }
    
    .alert-danger {
        background-color: rgba(255, 0, 0, 0.1);
        border: 1px solid rgba(255, 0, 0, 0.3);
        color: #ff0000;
    }
</style>
</head>
<body>

<%@ include file="all_components/navbar.jsp"%>

<div class="container py-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h1 class="text-center">EDIT NOTE</h1>
            
            <%-- Display error messages --%>
            <%
                errorMsg = (String)session.getAttribute("errorMsg");
                if(errorMsg != null) { %>
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-circle mr-2"></i><%= errorMsg %>
                    </div>
            <% 
                    session.removeAttribute("errorMsg");
                }
            %>
            
            <form action="EditServlet" method="post">
                <input type="hidden" name="note_id" value="<%= p.getId() %>">
                
                <div class="form-group mb-4">
                    <label>TITLE</label>
                    <input type="text" class="form-control" name="title" 
                           value="<%= p.getTitle() %>" required>
                </div>
                
                <div class="form-group mb-4">
                    <label>CONTENT</label>
                    <textarea class="form-control" name="content" rows="10" required><%= p.getContent() %></textarea>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-neon mr-3">
                        <i class="fas fa-save mr-2"></i>SAVE CHANGES
                    </button>
                    <a href="showNotes.jsp" class="btn btn-outline-neon">
                        <i class="fas fa-times mr-2"></i>CANCEL
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="all_components/footer.jsp"%>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</body>
</html>