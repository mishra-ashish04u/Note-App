<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.User.UserDetails"%>

<%
    UserDetails user1 = (UserDetails) session.getAttribute("userD");
    if (user1 == null) {
        session.setAttribute("login-error", "Please Login First...!!!");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome | NoteKeeper</title>
<%@ include file="all_components/allcss.jsp" %>
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
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    
    .welcome-container {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 2rem;
    }
    
    .welcome-card {
        background-color: var(--darker-bg);
        border: 1px solid rgba(160, 160, 255, 0.1);
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(100, 0, 255, 0.3);
        padding: 3rem;
        text-align: center;
        width: 100%;
        max-width: 800px;
    }
    
    .welcome-img {
        max-width: 300px;
        filter: drop-shadow(0 0 10px rgba(0, 240, 252, 0.5));
        margin-bottom: 2rem;
    }
    
    .welcome-title {
        color: var(--neon-blue);
        font-size: 2.5rem;
        margin-bottom: 1.5rem;
        text-shadow: 0 0 10px rgba(0, 240, 252, 0.5);
    }
    
    .btn-neon {
        background: transparent;
        color: var(--neon-blue);
        border: 2px solid var(--neon-blue);
        border-radius: 30px;
        padding: 0.8rem 2rem;
        font-size: 1.1rem;
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
        margin-top: 1rem;
    }
    
    .btn-neon:hover {
        background: var(--neon-blue);
        color: var(--dark-bg);
        box-shadow: 0 0 15px var(--neon-blue),
                    0 0 30px var(--neon-blue);
        transform: translateY(-3px);
    }
</style>
</head>
<body>

<%@ include file="all_components/navbar.jsp" %>

<div class="welcome-container">
    <div class="welcome-card">
        <img src="img/edit.png" class="welcome-img img-fluid mx-auto">
        <h1 class="welcome-title">START YOUR NOTES</h1>
        <a href="addNotes.jsp" class="btn-neon">
            <i class="fas fa-plus-circle mr-2"></i>ADD YOUR NOTES
        </a>
    </div>
</div>

<%@ include file="all_components/footer.jsp" %>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</body>
</html>