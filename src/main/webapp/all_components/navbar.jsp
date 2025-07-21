<%@page import="com.User.UserDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoteKeeper</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    :root {
        --neon-blue: #0ff0fc;
        --neon-purple: #9600ff;
        --dark-bg: #0a0a1a;
        --darker-bg: #050510;
        --text-light: #e0e0ff;
    }
    
    .navbar-neon {
        background-color: var(--dark-bg);
        border-bottom: 1px solid rgba(160, 160, 255, 0.1);
        box-shadow: 0 0 15px rgba(100, 0, 255, 0.2);
    }
    
    .navbar-brand-neon {
        font-weight: 700;
        font-size: 1.5rem;
        color: var(--neon-blue) !important;
        text-shadow: 0 0 8px rgba(0, 240, 252, 0.4);
    }
    
    .nav-link-neon {
        color: var(--text-light) !important;
        font-weight: 500;
        padding: 0.5rem 1rem !important;
        transition: all 0.3s ease;
    }
    
    .nav-link-neon:hover {
        color: var(--neon-blue) !important;
        text-shadow: 0 0 8px rgba(0, 240, 252, 0.4);
    }
    
    .btn-neon {
        border: 2px solid var(--neon-blue);
        color: var(--neon-blue) !important;
        border-radius: 4px;
        font-weight: 500;
        margin-left: 0.5rem;
        transition: all 0.3s ease;
    }
    
    .btn-neon:hover {
        background-color: rgba(0, 240, 252, 0.1);
        color: white !important;
    }
    
    .user-section {
        margin-left: auto;
        display: flex;
        align-items: center;
        position: relative;
    }
    
    .user-greeting {
        color: var(--text-light);
        margin-right: 1rem;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .user-greeting:hover {
        color: var(--neon-blue) !important;
        text-shadow: 0 0 8px rgba(0, 240, 252, 0.4);
    }
    
    .profile-popup {
        position: absolute;
        top: 100%;
        right: 0;
        background-color: var(--darker-bg);
        border: 1px solid rgba(160, 160, 255, 0.2);
        border-radius: 8px;
        padding: 1.5rem;
        width: 280px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        z-index: 1000;
        display: none;
    }
    
    .profile-popup.show {
        display: block;
        animation: fadeIn 0.3s ease;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .profile-header {
        display: flex;
        align-items: center;
        margin-bottom: 1rem;
        padding-bottom: 1rem;
        border-bottom: 1px solid rgba(160, 160, 255, 0.1);
    }
    
    .profile-icon {
        font-size: 2.5rem;
        color: var(--neon-blue);
        margin-right: 1rem;
    }
    
    .profile-name {
        font-weight: 600;
        color: white;
        margin-bottom: 0.2rem;
    }
    
    .profile-email {
        font-size: 0.9rem;
        color: var(--text-light);
        opacity: 0.8;
    }
    
    .profile-stats {
        display: flex;
        justify-content: space-between;
        margin: 1rem 0;
    }
    
    .stat-item {
        text-align: center;
    }
    
    .stat-value {
        font-weight: 600;
        color: var(--neon-blue);
        font-size: 1.2rem;
    }
    
    .stat-label {
        font-size: 0.8rem;
        color: var(--text-light);
        opacity: 0.7;
    }
    
    .profile-actions {
        margin-top: 1rem;
    }
    
    .profile-btn {
        display: block;
        width: 100%;
        padding: 0.5rem;
        text-align: center;
        background: rgba(160, 160, 255, 0.1);
        color: var(--text-light);
        border-radius: 4px;
        margin-bottom: 0.5rem;
        transition: all 0.3s ease;
    }
    
    .profile-btn:hover {
        background: rgba(0, 240, 252, 0.2);
        color: white;
        text-decoration: none;
    }
    
    .profile-btn i {
        margin-right: 0.5rem;
    }
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-neon">
  <div class="container">
    <a class="navbar-brand-neon" href="index.jsp">
      <i class="fas fa-book-open mr-2"></i>NoteKeeper
    </a>
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNeon">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNeon">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item <%= request.getRequestURI().endsWith("/index.jsp") ? "active-neon" : "" %>">
          <a class="nav-link-neon" href="index.jsp">Home</a>
        </li>
        <li class="nav-item <%= request.getRequestURI().endsWith("/addNotes.jsp") ? "active-neon" : "" %>">
          <a class="nav-link-neon" href="addNotes.jsp">Add Note</a>
        </li>
        <li class="nav-item <%= request.getRequestURI().endsWith("/showNotes.jsp") ? "active-neon" : "" %>">
          <a class="nav-link-neon" href="showNotes.jsp">Show Notes</a>
        </li>
      </ul>
      
      <div class="user-section">
        <%
        UserDetails user = (UserDetails) session.getAttribute("userD");
        if(user != null) {
        %>
          <div class="user-greeting" id="profileToggle">
            <i class="fas fa-user-circle mr-1"></i><%= user.getName() %>
          </div>
          
          <div class="profile-popup" id="profilePopup">
            <div class="profile-header">
              <div class="profile-icon">
                <i class="fas fa-user-astronaut"></i>
              </div>
              <div>
                <div class="profile-name"><%= user.getName() %></div>
                <div class="profile-email"><%= user.getEmail() %></div>
              </div>
            </div>
            
            <div class="profile-stats">
              <div class="stat-item">
                <div class="stat-value">24</div>
                <div class="stat-label">Notes</div>
              </div>
              <div class="stat-item">
                <div class="stat-value">5</div>
                <div class="stat-label">Categories</div>
              </div>
              <div class="stat-item">
                <div class="stat-value">3</div>
                <div class="stat-label">Stars</div>
              </div>
            </div>
            
            <div class="profile-actions">
              <a href="#" class="profile-btn">
                <i class="fas fa-cog"></i> Account Settings
              </a>
              <a href="#" class="profile-btn">
                <i class="fas fa-moon"></i> Dark Mode
              </a>
              <a href="LogoutServlet" class="profile-btn">
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
            </div>
          </div>
          
          <a href="LogoutServlet" class="btn btn-neon">
            <i class="fas fa-sign-out-alt mr-1"></i>Logout
          </a>
        <% } else { %>
          <a href="login.jsp" class="btn btn-neon">
            <i class="fas fa-sign-in-alt mr-1"></i>Login
          </a>
          <a href="register.jsp" class="btn btn-neon">
            <i class="fas fa-user-plus mr-1"></i>Register
          </a>
        <% } %>
      </div>
    </div>
  </div>
</nav>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script>
    // Profile popup toggle
    document.getElementById('profileToggle').addEventListener('click', function(e) {
        e.stopPropagation();
        document.getElementById('profilePopup').classList.toggle('show');
    });
    
    // Close popup when clicking outside
    document.addEventListener('click', function() {
        document.getElementById('profilePopup').classList.remove('show');
    });
    
    // Prevent popup from closing when clicking inside it
    document.getElementById('profilePopup').addEventListener('click', function(e) {
        e.stopPropagation();
    });
</script>
</body>
</html>