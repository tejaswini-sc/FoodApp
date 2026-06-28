<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
	response.sendRedirect(ctx + "/Login.html");
	return;
}

int totalRestaurants = (Integer) request.getAttribute("totalRestaurants");
int totalUsers = (Integer) request.getAttribute("totalUsers");
int totalOrders = (Integer) request.getAttribute("totalOrders");
int pendingOrders = (Integer) request.getAttribute("pendingOrders");
int deliveredOrders = (Integer) request.getAttribute("deliveredOrders");
int todayOrders = (Integer) request.getAttribute("todayOrders");
double todayRevenue = (Double) request.getAttribute("todayRevenue");
double totalRevenue = (Double) request.getAttribute("totalRevenue");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
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
			<li><a href="<%=ctx%>/admin/dashboard" class="active">Dashboard</a></li>
			<li><a href="<%=ctx%>/admin/restaurants">Restaurants</a></li>
			<li><a href="<%=ctx%>/admin/orders">Orders</a></li>
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
		<h1>📊 Admin Dashboard</h1>
		<p>Overview of your FoodCafe platform.</p>
	</section>

	<section class="stats-grid">

		<div class="stat-card">
			<div class="stat-icon green">
				<i class="fa-solid fa-store"></i>
			</div>
			<h3><%=totalRestaurants%></h3>
			<p>Total Restaurants</p>
		</div>

		<div class="stat-card">
			<div class="stat-icon blue">
				<i class="fa-solid fa-users"></i>
			</div>
			<h3><%=totalUsers%></h3>
			<p>Total Users</p>
		</div>

		<div class="stat-card">
			<div class="stat-icon purple">
				<i class="fa-solid fa-box"></i>
			</div>
			<h3><%=totalOrders%></h3>
			<p>Total Orders</p>
		</div>

		<div class="stat-card">
			<div class="stat-icon orange">
				<i class="fa-solid fa-clock"></i>
			</div>
			<h3><%=pendingOrders%></h3>
			<p>Pending Orders</p>
		</div>

		<div class="stat-card">
			<div class="stat-icon teal">
				<i class="fa-solid fa-circle-check"></i>
			</div>
			<h3><%=deliveredOrders%></h3>
			<p>Delivered Orders</p>
		</div>

		<div class="stat-card">
			<div class="stat-icon pink">
				<i class="fa-solid fa-calendar-day"></i>
			</div>
			<h3><%=todayOrders%></h3>
			<p>Today's Orders</p>
		</div>

		<div class="stat-card">
			<div class="stat-icon gold">
				<i class="fa-solid fa-indian-rupee-sign"></i>
			</div>
			<h3>₹<%=String.format("%.2f", todayRevenue)%></h3>
			<p>Today's Revenue</p>
		</div>

		<div class="stat-card">
			<div class="stat-icon dark">
				<i class="fa-solid fa-chart-line"></i>
			</div>
			<h3>₹<%=String.format("%.2f", totalRevenue)%></h3>
			<p>Total Revenue</p>
		</div>

	</section>

	<section class="quick-links">
		<h2>Quick Actions</h2>
		<div class="link-row">
			<a href="<%=ctx%>/admin/restaurants" class="admin-btn">Manage Restaurants</a>
			<a href="<%=ctx%>/admin/orders" class="admin-btn outline">Manage Orders</a>
		</div>
	</section>

</body>
</html>
