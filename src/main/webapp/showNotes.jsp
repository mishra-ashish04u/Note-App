<%@page import="com.DAO.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.User.Post" %>
<%@page import="com.User.UserDetails"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
    response.sendRedirect("login.jsp");
    session.setAttribute("login-error", "Please Login First!!..");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Notes | NoteKeeper</title>
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
    
    .notes-header {
        color: var(--neon-blue);
        text-shadow: 0 0 10px rgba(0, 240, 252, 0.5);
        margin: 2rem 0;
        text-align: center;
    }
    
    .note-card {
        background-color: var(--darker-bg);
        border: 1px solid rgba(160, 160, 255, 0.1);
        border-radius: 8px;
        transition: all 0.3s ease;
        height: 100%;
        display: flex;
        flex-direction: column;
    }
    
    .note-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    }
    
    .card-body {
        flex: 1;
    }
    
    .card-title {
        color: var(--neon-blue);
        margin-bottom: 1rem;
        font-weight: 600;
    }
    
    .card-text {
        color: var(--text-light);
        margin-bottom: 1.5rem;
        white-space: pre-wrap;
    }
    
    .note-date {
        color: rgba(224, 224, 255, 0.7);
        font-size: 0.9rem;
    }
    
    .card-footer {
        background-color: rgba(160, 160, 255, 0.05);
        border-top: 1px solid rgba(160, 160, 255, 0.1);
    }
    
    .btn-neon-danger {
        background: transparent;
        color: #ff6b6b;
        border: 1px solid #ff6b6b;
        transition: all 0.3s ease;
    }
    
    .btn-neon-danger:hover {
        background: #ff6b6b;
        color: var(--dark-bg);
        box-shadow: 0 0 10px #ff6b6b;
    }
    
    .btn-neon-primary {
        background: transparent;
        color: var(--neon-blue);
        border: 1px solid var(--neon-blue);
        transition: all 0.3s ease;
    }
    
    .btn-neon-primary:hover {
        background: var(--neon-blue);
        color: var(--dark-bg);
        box-shadow: 0 0 10px var(--neon-blue);
    }
    
    .alert-success {
        background-color: rgba(0, 255, 0, 0.1);
        border-color: #00ff00;
        color: #00ff00;
    }
</style>
</head>
<body>

<%@ include file="all_components/navbar.jsp"%>

<div class="container py-5">
    <h1 class="notes-header">MY NOTES</h1>
    
    <%-- Success message display --%>
    <%
        String msg = (String)session.getAttribute("updateMsg");
        if(msg != null) { %>
            <div class="alert alert-success text-center">
                <i class="fas fa-check-circle mr-2"></i><%= msg %>
            </div>
    <% 
            session.removeAttribute("updateMsg");
        } 
    %>
    
    <div class="row">
    <%
        if(user1!=null){
            PostDAO ob=new PostDAO(DBConnect.getConn());
            List<Post> post=ob.getData(user1.getId());
            for(Post po : post){
    %>
        <div class="col-md-4 mb-4">
            <div class="note-card">
                <div class="card-body p-4">
                    <h4 class="card-title"><%=po.getTitle() %></h4>
                    <p class="card-text"><%= po.getContent() %></p>
                    <p class="note-date">Posted on: <%= po.getPdate() %></p>
                </div>
                <div class="card-footer text-center p-3">
                    <a href="delete.jsp?note_id=<%= po.getId() %>" 
                       class="btn btn-neon-danger btn-sm mr-2"
                       onclick="return confirm('Are you sure you want to delete this note?');">
                       <i class="fas fa-trash-alt mr-1"></i>Delete
                    </a>
                    <a href="edit.jsp?note_id=<%= po.getId() %>" 
                       class="btn btn-neon-primary btn-sm">
                       <i class="fas fa-edit mr-1"></i>Edit
                    </a>
                </div>
            </div>
        </div>
    <%
            }
        }
    %>
    </div>
</div>

<%@ include file="all_components/footer.jsp"%>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</body>
</html>