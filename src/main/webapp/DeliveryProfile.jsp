<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"deliveryAgent".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect(ctx + "/Login.html");
    return;
}

User profileUser = (User) request.getAttribute("profileUser");
String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link rel="stylesheet" href="<%=ctx%>/css/common.css">
<link rel="stylesheet" href="<%=ctx%>/css/admin.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
    href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
    rel="stylesheet">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>

    <nav class="admin-nav">

        <div class="logo">
            <span class="logo-icon">🍃</span> <span>FoodCafe Delivery</span>
        </div>

        <ul>
            <li><a href="<%=ctx%>/delivery/dashboard">Dashboard</a></li>
            <li><a href="<%=ctx%>/delivery/profile" class="active">My Profile</a></li>
            <li><a href="<%=ctx%>/restaurants">View Site</a></li>
        </ul>

        <div class="nav-icons">
            <span class="admin-user">&#128075; <%=user.getUserName()%></span>
            <a href="<%=ctx%>/logout" class="icon-btn" title="Logout"> <i
                class="fa-solid fa-right-from-bracket"></i>
            </a>
        </div>

    </nav>

    <section class="admin-header">
        <h1>&#128100; My Profile</h1>
        <p>View and update your account information.</p>
    </section>

    <%
    if (message != null) {
    %>
    <section class="admin-section">
        <div class="success-message"
            style="background: #d4edda; color: #155724; padding: 12px 20px; border-radius: 8px; font-weight: 500;">
            <%=message%>
        </div>
    </section>
    <%
    }
    %>

    <section class="admin-section">

        <div class="admin-form-card">
            <h2>Edit Profile</h2>

            <form action="<%=ctx%>/delivery/profile" method="post">

                <div class="input-group">
                    <label>User ID</label>
                    <input type="text" value="<%=profileUser.getuserid()%>" disabled>
                </div>

                <div class="input-group">
                    <label>Name</label>
                    <input type="text" name="name"
                        value="<%=profileUser.getUserName()%>" required>
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <input type="email" name="email"
                        value="<%=profileUser.getEmail()%>" required>
                </div>

                <div class="input-group">
                    <label>Address</label>
                    <textarea name="address" rows="3" required><%=profileUser.getAddress()%></textarea>
                </div>

                <div class="input-group">
                    <label>Role</label>
                    <input type="text" value="<%=profileUser.getRole()%>" disabled>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="password"
                        placeholder="Leave blank to keep current">
                </div>

                <div class="form-actions">
                    <button type="submit" class="admin-btn">Update Profile</button>
                </div>

            </form>
        </div>

    </section>

</body>
</html>
