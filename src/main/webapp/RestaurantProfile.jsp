<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Restaurant"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"owner".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect(ctx + "/Login.html");
    return;
}

Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Restaurant</title>
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
            <span class="logo-icon">🍃</span> <span>FoodCafe Owner</span>
        </div>

        <ul>
            <li><a href="<%=ctx%>/restaurant/dashboard">Dashboard</a></li>
            <li><a href="<%=ctx%>/restaurant/profile" class="active">My Restaurant</a></li>
            <li><a href="<%=ctx%>/restaurant/menu">My Menu</a></li>
            <li><a href="<%=ctx%>/restaurant/orders">My Orders</a></li>
            <li><a href="<%=ctx%>/restaurants">View Site</a></li>
        </ul>

        <div class="nav-icons">
            <span class="admin-user">👋 <%=user.getUserName()%></span>
            <a href="<%=ctx%>/logout" class="icon-btn" title="Logout"> <i
                class="fa-solid fa-right-from-bracket"></i>
            </a>
        </div>

    </nav>

    <section class="admin-header">
        <h1>🏪 My Restaurant</h1>
        <p>View and update your restaurant details.</p>
    </section>

    <%
    if (restaurant == null) {
    %>

    <section class="admin-section">
        <div class="admin-table-card" style="text-align: center; padding: 60px 30px;">
            <div style="font-size: 64px; margin-bottom: 20px;">🏪</div>
            <h2 style="margin-bottom: 12px;">No Restaurant Assigned</h2>
            <p style="color: #777; font-size: 16px; max-width: 500px; margin: 0 auto;">
                No restaurant has been assigned to your account yet.
                Please contact the administrator.
            </p>
        </div>
    </section>

    <%
    } else {
    %>

    <section class="admin-section">

        <div class="admin-form-card">

            <form action="<%=ctx%>/restaurant/profile" method="post">

                <div class="form-row">
                    <div class="input-group">
                        <label>Restaurant Name</label>
                        <input type="text" name="name"
                            value="<%=restaurant.getName()%>" required>
                    </div>
                    <div class="input-group">
                        <label>Cuisine Type</label>
                        <input type="text" name="cuisineType"
                            value="<%=restaurant.getCuisineType()%>" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Delivery Time (minutes)</label>
                        <input type="number" name="deliveryTime" min="1"
                            value="<%=restaurant.getDeliveryTime()%>" required>
                    </div>
                    <div class="input-group">
                        <label>Address</label>
                        <input type="text" name="address"
                            value="<%=restaurant.getAddress()%>" required>
                    </div>
                </div>

                <div class="input-group">
                    <label>Image URL</label>
                    <input type="text" name="imagePath"
                        value="<%=restaurant.getImagePath() != null ? restaurant.getImagePath() : ""%>" required>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Rating (view only)</label>
                        <input type="text"
                            value="⭐ <%=restaurant.getRating()%>" readonly
                            style="background: #f5f5f5; cursor: not-allowed;">
                    </div>
                    <div class="input-group">
                        <label>Status (view only)</label>
                        <input type="text"
                            value="<%=restaurant.isActive() ? "Active" : "Inactive"%>" readonly
                            style="background: #f5f5f5; cursor: not-allowed;">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="admin-btn">Update Restaurant</button>
                    <a href="<%=ctx%>/restaurant/dashboard" class="admin-btn outline">Cancel</a>
                </div>

            </form>

        </div>

    </section>

    <%
    }
    %>

</body>
</html>
