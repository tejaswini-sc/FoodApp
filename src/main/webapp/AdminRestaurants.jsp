<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.foodapp.model.Restaurant"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
	response.sendRedirect(ctx + "/Login.html");
	return;
}

List<Restaurant> allResturant = (List<Restaurant>) request.getAttribute("allResturant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Restaurants</title>
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
			<li><a href="<%=ctx%>/admin/menu">Menu</a></li>
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
		<h1>🏪 Manage Restaurants</h1>
		<p>Add, edit, and manage restaurant listings.</p>
	</section>

	<section class="admin-section">

		<div class="admin-form-card">
			<h2>Add New Restaurant</h2>

			<form action="<%=ctx%>/admin/restaurants" method="post">

				<input type="hidden" name="action" value="add">

				<div class="form-row">
					<div class="input-group">
						<label>Restaurant Name</label>
						<input type="text" name="name" required>
					</div>
					<div class="input-group">
						<label>Cuisine Type</label>
						<input type="text" name="cuisineType" required>
					</div>
				</div>

				<div class="form-row">
					<div class="input-group">
						<label>Delivery Time (minutes)</label>
						<input type="number" name="deliveryTime" min="1" required>
					</div>
					<div class="input-group">
						<label>Rating</label>
						<input type="number" name="rating" min="0" max="5" step="0.1"
							value="4.0" required>
					</div>
				</div>

				<div class="input-group">
					<label>Address</label>
					<textarea name="address" rows="2" required></textarea>
				</div>

				<div class="input-group">
					<label>Image URL</label>
					<input type="text" name="imagePath"
						placeholder="images/restaurants/example.jpg" required>
				</div>

				<div class="input-group checkbox-group">
					<label> <input type="checkbox" name="isActive" checked>
						Active
					</label>
				</div>

				<button type="submit" class="admin-btn">Add Restaurant</button>

			</form>
		</div>

		<div class="admin-table-card">
			<h2>All Restaurants</h2>

			<%
			if (allResturant == null || allResturant.isEmpty()) {
			%>

			<p class="empty-msg">No restaurants found. Add your first restaurant above.</p>

			<%
			} else {
			%>

			<div class="table-wrap">
				<table class="admin-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Image</th>
							<th>Name</th>
							<th>Cuisine</th>
							<th>Delivery</th>
							<th>Rating</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Restaurant restaurant : allResturant) {
						%>
						<tr>
							<td><%=restaurant.getResturantID()%></td>
							<td><img src="<%=ctx%>/<%=restaurant.getImagePath()%>"
								class="table-img" alt="<%=restaurant.getName()%>"></td>
							<td><%=restaurant.getName()%></td>
							<td><%=restaurant.getCuisineType()%></td>
							<td><%=restaurant.getDeliveryTime()%> min</td>
							<td>⭐ <%=restaurant.getRating()%></td>
							<td>
								<%
								if (restaurant.isActive()) {
								%>
								<span class="status-badge active">Active</span>
								<%
								} else {
								%>
								<span class="status-badge inactive">Inactive</span>
								<%
								}
								%>
							</td>
							<td class="action-cell">

								<a href="<%=ctx%>/admin/restaurants?restaurantId=<%=restaurant.getResturantID()%>"
									class="action-btn edit">Edit</a>

								<a href="<%=ctx%>/admin/menu?restaurantId=<%=restaurant.getResturantID()%>"
									class="action-btn menu">Menu</a>

								<form action="<%=ctx%>/admin/restaurants" method="post"
									class="inline-form">
									<input type="hidden" name="action" value="toggleActive">
									<input type="hidden" name="restaurantId"
										value="<%=restaurant.getResturantID()%>">
									<button type="submit" class="action-btn toggle">
										<%=restaurant.isActive() ? "Deactivate" : "Activate"%>
									</button>
								</form>

								<form action="<%=ctx%>/admin/restaurants" method="post"
									class="inline-form"
									onsubmit="return confirm('Delete this restaurant?');">
									<input type="hidden" name="action" value="delete">
									<input type="hidden" name="restaurantId"
										value="<%=restaurant.getResturantID()%>">
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
