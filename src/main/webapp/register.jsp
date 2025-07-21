<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | NoteKeeper</title>
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
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: var(--dark-bg);
        color: var(--text-light);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        margin: 0;
    }
    
    .register-container {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 2rem;
    }
    
    .register-box {
        width: 100%;
        max-width: 400px;
        padding: 2.5rem;
        background: var(--darker-bg);
        border-radius: 8px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
    }
    
    .register-title {
        color: var(--neon-blue);
        text-align: center;
        margin-bottom: 2rem;
        font-size: 1.8rem;
        text-shadow: 0 0 10px rgba(0, 240, 252, 0.5);
    }
    
    .input-group {
        position: relative;
        margin-bottom: 2rem;
    }
    
    .input-line {
        width: 100%;
        padding: 0.5rem 0;
        font-size: 1rem;
        color: var(--text-light);
        border: none;
        border-bottom: 1px solid var(--text-light);
        outline: none;
        background: transparent;
    }
    
    .input-label {
        position: absolute;
        top: 10px;
        left: 0;
        font-size: 1rem;
        color: var(--text-light);
        pointer-events: none;
        transition: all 0.3s ease;
    }
    
    .input-line:focus ~ .input-label,
    .input-line:valid ~ .input-label {
        top: -15px;
        font-size: 0.8rem;
        color: var(--neon-blue);
    }
    
    .input-line:focus {
        border-bottom-color: var(--neon-blue);
    }
    
    .register-btn {
        width: 100%;
        padding: 0.8rem;
        background: transparent;
        color: var(--neon-blue);
        border: 2px solid var(--neon-blue);
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        margin-top: 1rem;
        transition: all 0.3s ease;
    }
    
    .register-btn:hover {
        background: var(--neon-blue);
        color: var(--dark-bg);
        box-shadow: 0 0 10px var(--neon-blue);
    }
    
    .login-link {
        display: block;
        text-align: center;
        margin-top: 1.5rem;
        color: var(--neon-blue);
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .login-link:hover {
        text-decoration: underline;
        text-shadow: 0 0 5px var(--neon-blue);
    }
    
    /* Alert messages */
    .alert-message {
        padding: 0.8rem;
        border-radius: 4px;
        margin-bottom: 1.5rem;
        text-align: center;
    }
    
    .alert-success {
        background-color: rgba(0, 255, 0, 0.1);
        border: 1px solid rgba(0, 255, 0, 0.3);
        color: #0f0;
    }
    
    .alert-error {
        background-color: rgba(255, 0, 0, 0.1);
        border: 1px solid rgba(255, 0, 0, 0.3);
        color: #f00;
    }
</style>
</head>
<body>
    <%@ include file="all_components/navbar.jsp"%>

    <div class="register-container">
        <div class="register-box">
            <!-- Success Message -->
            <%
            String successMsg = (String) session.getAttribute("reg-success");
            if (successMsg != null) {
            %>
            <div class="alert-message alert-success">
                <i class="fas fa-check-circle"></i> <%=successMsg%>
            </div>
            <%
            session.removeAttribute("reg-success");
            }
            %>
            
            <!-- Error Messages -->
            <%
            String errorMsg = (String) session.getAttribute("reg-failed");
            if (errorMsg != null) {
            %>
            <div class="alert-message alert-error">
                <i class="fas fa-exclamation-circle"></i> <%=errorMsg%>
            </div>
            <%
            session.removeAttribute("reg-failed");
            }
            %>
            
            <h1 class="register-title">Register</h1>
            
            <form method="post" action="UserServlet">
                <div class="input-group">
                    <input type="text" class="input-line" id="name" name="fname" required>
                    <label class="input-label" for="name">Full Name</label>
                </div>
                
                <div class="input-group">
                    <input type="email" class="input-line" id="email" name="uemail" required>
                    <label class="input-label" for="email">Email Address</label>
                </div>
                
                <div class="input-group">
                    <input type="password" class="input-line" id="password" name="upassword" required>
                    <label class="input-label" for="password">Password</label>
                </div>
                
                <button type="submit" class="register-btn">REGISTER</button>
                
                <a href="login.jsp" class="login-link">
                    Already have an account? Login here
                </a>
            </form>
        </div>
    </div>

    <%@ include file="all_components/footer.jsp"%>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</body>
</html>