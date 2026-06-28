<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Restaurant"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
	response.sendRedirect(ctx + "/Login.html");
	return;
}

Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Restaurant</title>
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
			<li><a href="<%=ctx%>/admin/restaurants" class="active">Restaurants</a></li>
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
		<h1>✏️ Edit Restaurant</h1>
		<p>Update restaurant details.</p>
	</section>

	<section class="admin-section">

		<div class="admin-form-card">

			<form action="<%=ctx%>/admin/restaurants" method="post">

				<input type="hidden" name="action" value="update">
				<input type="hidden" name="restaurantId"
					value="<%=restaurant.getResturantID()%>">

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
						<label>Rating</label>
						<input type="number" name="rating" min="0" max="5" step="0.1"
							value="<%=restaurant.getRating()%>" required>
					</div>
				</div>

				<div class="input-group">
					<label>Address</label>
					<textarea name="address" rows="2" required><%=restaurant.getAddress()%></textarea>
				</div>

				<div class="input-group">
					<label>Image URL</label>
					<input type="text" name="imagePath"
						value="<%=restaurant.getImagePath()%>" required>
				</div>

				<div class="input-group checkbox-group">
					<label> <input type="checkbox" name="isActive"
						<%=restaurant.isActive() ? "checked" : ""%>> Active
					</label>
				</div>

				<div class="form-actions">
					<button type="submit" class="admin-btn">Update Restaurant</button>
					<a href="<%=ctx%>/admin/restaurants" class="admin-btn outline">Cancel</a>
				</div>

			</form>

		</div>

	</section>

</body>
</html>
