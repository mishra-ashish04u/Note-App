<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
    :root {
        --neon-blue: #0ff0fc;
        --neon-purple: #9600ff;
        --dark-bg: #0a0a1a;
        --darker-bg: #050510;
        --text-light: #e0e0ff;
    }
    
    .footer {
        background-color: var(--darker-bg);
        border-top: 1px solid rgba(160, 160, 255, 0.1);
        padding: 2rem 0;
        margin-top: 3rem;
    }
    
    .footer-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
    }
    
    .footer-text {
        color: var(--text-light);
        margin: 0.5rem 0;
        font-size: 0.9rem;
    }
    
    .footer-text.neon {
        color: var(--neon-blue);
        text-shadow: 0 0 5px rgba(0, 240, 252, 0.5);
        font-weight: 500;
    }
    
    .footer-links {
        display: flex;
        justify-content: center;
        gap: 1.5rem;
        margin: 1rem 0;
    }
    
    .footer-link {
        color: var(--text-light);
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .footer-link:hover {
        color: var(--neon-blue);
        text-shadow: 0 0 5px var(--neon-blue);
    }
    
    .footer-social {
        display: flex;
        gap: 1rem;
        margin: 1rem 0;
    }
    
    .social-icon {
        color: var(--text-light);
        font-size: 1.2rem;
        transition: all 0.3s ease;
    }
    
    .social-icon:hover {
        color: var(--neon-blue);
        transform: translateY(-3px);
    }
    
    .footer-copyright {
        color: var(--text-light);
        font-size: 0.8rem;
        opacity: 0.7;
        margin-top: 1rem;
    }
</style>
</head>
<body>
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <p class="footer-text neon">NoteKeeper - Your Digital Notebook</p>
                <p class="footer-text">Never forget an idea again with our secure note-taking platform</p>
                
                <div class="footer-links">
                    <a href="#" class="footer-link">About Us</a>
                    <a href="#" class="footer-link">Privacy Policy</a>
                    <a href="#" class="footer-link">Terms of Service</a>
                    <a href="#" class="footer-link">Contact</a>
                </div>
                
                <div class="footer-social">
                    <a href="#" class="social-icon"><i class="fab fa-github"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-linkedin"></i></a>
                </div>
                
                <p class="footer-copyright">
                    &copy; 2025 NoteKeeper by Team Alpha. All rights reserved.<br>
                    Made with <i class="fas fa-heart" style="color: #ff0000;"></i> for developers
                </p>
            </div>
        </div>
    </footer>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</body>
</html>