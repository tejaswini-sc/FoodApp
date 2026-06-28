<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Menu"%>
<%@ page import="com.foodapp.model.Restaurant"%>
<%@ page import="com.foodapp.model.User"%>

<%
String ctx = request.getContextPath();
User user = (User) session.getAttribute("user");

if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
	response.sendRedirect(ctx + "/Login.html");
	return;
}

Menu menu = (Menu) request.getAttribute("menu");
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Menu Item</title>
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
			<li><a href="<%=ctx%>/admin/menu" class="active">Menu</a></li>
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
		<h1>✏️ Edit Menu Item</h1>
		<p>
			Updating item for
			<strong><%=restaurant.getName()%></strong>
		</p>
	</section>

	<section class="admin-section">

		<div class="admin-form-card">

			<form action="<%=ctx%>/admin/menu" method="post">

				<input type="hidden" name="action" value="update">
				<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
				<input type="hidden" name="restaurantId"
					value="<%=menu.getRestaurantId()%>">

				<div class="form-row">
					<div class="input-group">
						<label>Item Name</label>
						<input type="text" name="itemName"
							value="<%=menu.getItemName()%>" required>
					</div>
					<div class="input-group">
						<label>Category</label>
						<input type="text" name="category"
							value="<%=menu.getCategory()%>" required>
					</div>
				</div>

				<div class="input-group">
					<label>Description</label>
					<textarea name="description" rows="2" required><%=menu.getDescription()%></textarea>
				</div>

				<div class="form-row">
					<div class="input-group">
						<label>Price (₹)</label>
						<input type="number" name="price" min="0" step="0.01"
							value="<%=menu.getPrice()%>" required>
					</div>
					<div class="input-group">
						<label>Rating</label>
						<input type="number" name="rating" min="0" max="5" step="0.1"
							value="<%=menu.getRating()%>" required>
					</div>
				</div>

				<div class="form-row">
					<div class="input-group">
						<label>Food Type</label>
						<select name="foodType" required>
							<option value="Veg"
								<%="Veg".equalsIgnoreCase(menu.getFoodType()) ? "selected" : ""%>>Veg</option>
							<option value="Non-Veg"
								<%="Non-Veg".equalsIgnoreCase(menu.getFoodType()) ? "selected" : ""%>>Non-Veg</option>
						</select>
					</div>
					<div class="input-group">
						<label>Image URL</label>
						<input type="text" name="imagePath"
							value="<%=menu.getImagePath()%>" required>
					</div>
				</div>

				<div class="input-group checkbox-group">
					<label> <input type="checkbox" name="isAvailable"
						<%=menu.isAvailable() ? "checked" : ""%>> Available
					</label>
				</div>

				<div class="form-actions">
					<button type="submit" class="admin-btn">Update Menu Item</button>
					<a href="<%=ctx%>/admin/menu?restaurantId=<%=menu.getRestaurantId()%>"
						class="admin-btn outline">Cancel</a>
				</div>

			</form>

		</div>

	</section>

</body>
</html>
