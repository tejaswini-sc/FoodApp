<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User admin = (User) session.getAttribute("user");

if (admin == null || !"admin".equalsIgnoreCase(admin.getRole())) {
    response.sendRedirect(ctx + "/Login.html");
    return;
}

List<User> owners = (List<User>) request.getAttribute("owners");
User editOwner = (User) request.getAttribute("editOwner");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Owners</title>
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
            <span class="logo-icon">🍃</span> <span>FoodCafe Admin</span>
        </div>

        <ul>
            <li><a href="<%=ctx%>/admin/dashboard">Dashboard</a></li>
            <li><a href="<%=ctx%>/admin/restaurants">Restaurants</a></li>
            <li><a href="<%=ctx%>/admin/menu">Menu</a></li>
            <li><a href="<%=ctx%>/admin/orders">Orders</a></li>
            <li><a href="<%=ctx%>/admin/restaurantOwners" class="active">Restaurant Owners</a></li>
            <li><a href="<%=ctx%>/restaurants">View Site</a></li>
        </ul>

        <div class="nav-icons">
            <span class="admin-user">👋 <%=admin.getUserName()%></span>
            <a href="<%=ctx%>/logout" class="icon-btn" title="Logout"> <i
                class="fa-solid fa-right-from-bracket"></i>
            </a>
        </div>

    </nav>

    <section class="admin-header">
        <h1>👤 Restaurant Owners</h1>
        <p>Manage restaurant owner accounts.</p>
    </section>

    <section class="admin-section">

        <%
        if (editOwner != null) {
        %>

        <div class="admin-form-card">
            <h2>Edit Restaurant Owner</h2>

            <form action="<%=ctx%>/admin/restaurantOwners" method="post">

                <input type="hidden" name="action" value="update">
                <input type="hidden" name="userId"
                    value="<%=editOwner.getuserid()%>">

                <div class="form-row">
                    <div class="input-group">
                        <label>Full Name</label> <input type="text" name="name"
                            value="<%=editOwner.getUserName()%>" required>
                    </div>
                    <div class="input-group">
                        <label>Email</label> <input type="email" name="email"
                            value="<%=editOwner.getEmail()%>" required>
                    </div>
                </div>

                <div class="input-group">
                    <label>Password (leave blank to keep current)</label> <input
                        type="password" name="password" placeholder="Enter new password">
                </div>

                <div class="input-group">
                    <label>Address</label>
                    <textarea name="address" rows="2" required><%=editOwner.getAddress()%></textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="admin-btn">Update Owner</button>
                    <a href="<%=ctx%>/admin/restaurantOwners"
                        class="admin-btn outline">Cancel</a>
                </div>

            </form>
        </div>

        <%
        } else {
        %>

        <div class="admin-form-card">
            <h2>Add New Restaurant Owner</h2>

            <form action="<%=ctx%>/admin/restaurantOwners" method="post">

                <input type="hidden" name="action" value="add">

                <div class="form-row">
                    <div class="input-group">
                        <label>Full Name</label> <input type="text" name="name" required>
                    </div>
                    <div class="input-group">
                        <label>Email</label> <input type="email" name="email" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Password</label> <input type="password" name="password"
                            required>
                    </div>
                    <div class="input-group">
                        <label>Address</label>
                        <textarea name="address" rows="2" required></textarea>
                    </div>
                </div>

                <button type="submit" class="admin-btn">Add Owner</button>

            </form>
        </div>

        <%
        }
        %>

        <div class="admin-table-card">
            <h2>All Restaurant Owners</h2>

            <%
            if (owners == null || owners.isEmpty()) {
            %>

            <p class="empty-msg">No restaurant owners found. Add your first owner above.</p>

            <%
            } else {
            %>

            <div class="table-wrap">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Created</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (User owner : owners) {
                        %>
                        <tr>
                            <td><%=owner.getuserid()%></td>
                            <td><%=owner.getUserName()%></td>
                            <td><%=owner.getEmail()%></td>
                            <td><%=owner.getAddress()%></td>
                            <td><%=owner.getCreatedDate() != null ? owner.getCreatedDate() : "-"%></td>
                            <td class="action-cell">

                                <a href="<%=ctx%>/admin/restaurantOwners?editUserId=<%=owner.getuserid()%>"
                                    class="action-btn edit">Edit</a>

                                <form action="<%=ctx%>/admin/restaurantOwners" method="post"
                                    class="inline-form"
                                    onsubmit="return confirm('Delete this restaurant owner?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="userId"
                                        value="<%=owner.getuserid()%>">
                                    <button type="submit" class="action-btn delete">Delete</button>
                                </form>

                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>

            <%
            }
            %>

        </div>

    </section>

</body>
</html>
