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

Integer totalOrders = (Integer) request.getAttribute("totalOrders");
Integer pendingOrders = (Integer) request.getAttribute("pendingOrders");
Integer deliveredOrders = (Integer) request.getAttribute("deliveredOrders");
Double totalRevenue = (Double) request.getAttribute("totalRevenue");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner Dashboard</title>
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
            <li><a href="<%=ctx%>/restaurant/dashboard" class="active">Dashboard</a></li>
            <li><a href="<%=ctx%>/restaurant/profile">My Restaurant</a></li>
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
        <h1>🏪 Restaurant Dashboard</h1>
        <p>Welcome back, <%=user.getUserName()%> 👋</p>
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

        <div class="admin-form-card" style="display: flex; gap: 30px; align-items: center; flex-wrap: wrap;">
            <%
            String imgPath = restaurant.getImagePath();
            if (imgPath != null && !imgPath.isEmpty()) {
            %>
            <img src="<%=ctx%>/<%=imgPath%>" alt="<%=restaurant.getName()%>"
                style="width: 160px; height: 160px; object-fit: cover; border-radius: 16px;">
            <%
            }
            %>
            <div style="flex: 1; min-width: 200px;">
                <h2 style="font-size: 28px; margin-bottom: 6px;"><%=restaurant.getName()%></h2>
                <p style="color: #777; margin-bottom: 4px;">🍽️ <%=restaurant.getCuisineType()%></p>
                <p style="color: #777; margin-bottom: 4px;">📌 <%=restaurant.getAddress()%></p>
                <p style="color: #777; margin-bottom: 4px;">⏱ <%=restaurant.getDeliveryTime()%> min</p>
                <p style="color: #777;">⭐ <%=restaurant.getRating()%></p>
            </div>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon purple">
                    <i class="fa-solid fa-box"></i>
                </div>
                <h3><%=totalOrders != null ? totalOrders : 0%></h3>
                <p>Total Orders</p>
            </div>

            <div class="stat-card">
                <div class="stat-icon orange">
                    <i class="fa-solid fa-clock"></i>
                </div>
                <h3><%=pendingOrders != null ? pendingOrders : 0%></h3>
                <p>Pending Orders</p>
            </div>

            <div class="stat-card">
                <div class="stat-icon teal">
                    <i class="fa-solid fa-circle-check"></i>
                </div>
                <h3><%=deliveredOrders != null ? deliveredOrders : 0%></h3>
                <p>Delivered Orders</p>
            </div>

            <div class="stat-card">
                <div class="stat-icon gold">
                    <i class="fa-solid fa-indian-rupee-sign"></i>
                </div>
                <h3>₹<%=String.format("%.2f", totalRevenue != null ? totalRevenue : 0)%></h3>
                <p>Total Revenue</p>
            </div>
        </div>

        <div class="quick-links">
            <h2>Quick Actions</h2>
            <div class="link-row">
                <a href="<%=ctx%>/restaurant/profile" class="admin-btn">🏪 My Restaurant</a>
                <a href="<%=ctx%>/restaurant/menu" class="admin-btn">🍽️ My Menu</a>
                <a href="<%=ctx%>/restaurant/orders" class="admin-btn outline">📦 My Orders</a>
            </div>
        </div>

    </section>

    <%
    }
    %>

</body>
</html>
