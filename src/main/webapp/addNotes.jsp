<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.User.UserDetails"%>

<!-- Code Start for(This page will not be open without login -->
<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
    session.setAttribute("login-error", "Please Login First!!..");
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note | NoteKeeper</title>
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
        padding-top: 60px; /* Add space for fixed navbar */
    }
    
    .add-note-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 2rem 15px;
    }
    
    .add-note-header {
        color: var(--neon-blue);
        text-shadow: 0 0 10px rgba(0, 240, 252, 0.5);
        font-weight: 700;
        margin-bottom: 2rem;
        text-align: center;
    }
    
    .add-note-form .form-control {
        background-color: var(--darker-bg);
        border: 1px solid rgba(160, 160, 255, 0.2);
        color: var(--text-light);
        border-radius: 5px;
    }
    
    .add-note-form .form-control:focus {
        background-color: var(--darker-bg);
        border-color: var(--neon-blue);
        box-shadow: 0 0 0 0.2rem rgba(0, 240, 252, 0.25);
        color: white;
    }
    
    .add-note-form label {
        color: var(--neon-blue);
        font-weight: 500;
        margin-bottom: 0.5rem;
    }
    
    .add-note-form textarea.form-control {
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
        margin-top: 1rem;
        box-shadow: 0 0 15px rgba(0, 240, 252, 0.4);
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    
    .btn-neon:hover {
        transform: translateY(-3px);
        box-shadow: 0 0 25px rgba(0, 240, 252, 0.6);
    }
    
    .add-note-alert {
        border-radius: 5px;
        margin-top: 1.5rem;
    }
    
    .add-note-alert.alert-success {
        background-color: rgba(0, 255, 0, 0.1);
        border-color: #00ff00;
        color: #00ff00;
    }
    
    .add-note-alert.alert-danger {
        background-color: rgba(255, 0, 0, 0.1);
        border-color: #ff0000;
        color: #ff0000;
    }
</style>
</head>
<body>

<%@ include file="all_components/navbar.jsp"%>

<div class="add-note-container">
    <h1 class="add-note-header">ADD YOUR NOTE</h1>
    <div class="row">
        <div class="col-md-12">
            <form action="AddNotes" method="post" class="add-note-form">
                <div class="form-group">
                    <%
                    UserDetails us = (UserDetails) session.getAttribute("userD");
                    if (us != null) {
                    %>
                    <input type="hidden" name="uid" class="form-control"
                        value="<%=us.getId()%>">
                    <%
                    }
                    %>
                </div>

                <div class="form-group">
                    <label>ENTER TITLE</label>
                    <input type="text" name="title" class="form-control" placeholder="Enter your note title" required>
                </div>
                
                <div class="form-group">
                    <label>CONTENT</label>
                    <textarea name="content" rows="12" class="form-control" placeholder="Write your note content here..." required></textarea>
                </div>

                <button type="submit" class="btn btn-neon">
                    <i class="fas fa-plus-circle mr-2"></i>ADD NOTE
                </button>
                
                <% 
                    String successMsg = (String)session.getAttribute("successMsg");
                    if(successMsg != null) { %>
                        <div class="add-note-alert alert-success mt-3">
                            <i class="fas fa-check-circle mr-2"></i><%= successMsg %>
                        </div>
                <% 
                        session.removeAttribute("successMsg");
                    } 
                    
                    String errorMsg = (String)session.getAttribute("errorMsg");
                    if(errorMsg != null) { %>
                        <div class="add-note-alert alert-danger mt-3">
                            <i class="fas fa-exclamation-circle mr-2"></i><%= errorMsg %>
                        </div>
                <% 
                        session.removeAttribute("errorMsg");
                    }
                %>
            </form>
        </div>
    </div>
</div>

<%@ include file="all_components/footer.jsp"%>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</body>
</html>