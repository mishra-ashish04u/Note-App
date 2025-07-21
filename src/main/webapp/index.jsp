<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | NoteKeeper</title>
<%@ include file="all_components/allcss.jsp"  %>
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
    
    .back-img {
        background: linear-gradient(rgba(10, 10, 26, 0.8), rgba(5, 5, 16, 0.9)), 
                    url('image/pencopy.jpeg');
        width: 100%;
        height: 80vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        position: relative;
    }
    
    .hero-content {
        text-align: center;
        z-index: 2;
    }
    
    .hero-title {
        color: var(--neon-blue);
        font-size: 3.5rem;
        font-weight: 700;
        text-shadow: 0 0 15px rgba(0, 240, 252, 0.7);
        margin-bottom: 2rem;
    }
    
    .btn-neon {
        background: transparent;
        color: var(--neon-blue);
        border: 2px solid var(--neon-blue);
        border-radius: 30px;
        padding: 0.8rem 2rem;
        font-size: 1.1rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
        margin: 0.5rem;
        text-decoration: none;
        display: inline-block;
    }
    
    .btn-neon:hover {
        background: var(--neon-blue);
        color: var(--dark-bg);
        box-shadow: 0 0 15px var(--neon-blue),
                    0 0 30px var(--neon-blue);
        transform: translateY(-3px);
    }
    
    .btn-neon-primary {
        background: linear-gradient(45deg, var(--neon-blue), var(--neon-purple));
        color: white;
        border: none;
    }
    
    .btn-neon-primary:hover {
        background: linear-gradient(45deg, var(--neon-purple), var(--neon-blue));
        color: white;
    }
</style>
</head>
<body>

<%@ include file="all_components/navbar.jsp"  %>

<div class="container-fluid back-img">
    <div class="hero-content">
        <h1 class="hero-title">E-NOTES: SAVE YOUR NOTES</h1>
        <div>
            <a href="login.jsp" class="btn btn-neon btn-neon-primary">
                <i class="fas fa-sign-in-alt mr-2"></i>LOGIN
            </a>
            <a href="register.jsp" class="btn btn-neon">
                <i class="fas fa-user-plus mr-2"></i>REGISTER
            </a>
        </div>
    </div>
</div>

<%@ include file="all_components/footer.jsp"  %>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</body>
</html>