<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Successful</title>

<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/orderSuccess.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<%@page import="com.foodapp.model.Cart"%>
<%
Cart cart = (Cart) session.getAttribute("cart");
int cartCount = 0;
if (cart != null) {
    cartCount = cart.getTotalItems();
}
%>

<!-- Navbar -->

	<nav>

		<div class="logo">

			<span class="logo-icon">🍃</span> <span>FoodCafe</span>

		</div>
		<ul>

			<li><a href="restaurants#home">Home</a></li>

			<li><a href="restaurants#restaurant">Restaurants</a></li>

			<li><a href="myOrders">Orders</a></li>

			<li><a href="login">SignUp</a></li>

		</ul>

		<div class="nav-icons">

			<a href="cart" class="icon-btn cart-icon"> <i
				class="fa-solid fa-cart-shopping"></i> <%
 if (cartCount > 0) {
 %> <span class="cart-badge"><%=cartCount > 9 ? "9+" : cartCount%>
				</span> <%
 }
 %>

			</a> <a href="Profile.jsp" class="icon-btn"> <i
				class="fa-solid fa-user"></i>

			</a>

		</div>

	</nav>



	<div class="success-container">

		<div class="success-card">

			<div class="success-icon">

				<i class="fa-solid fa-circle-check"></i>

			</div>

			<h1>Order Placed Successfully!</h1>

			<p>Thank you for ordering with FoodCafe ❤️</p>

			<div class="delivery-box">

				<h3>Estimated Delivery</h3>

				<h2>25 - 30 Minutes</h2>

			</div>

			<div class="status-box">

				<h3>Current Status</h3>

				<p>👨‍🍳 Preparing Your Food</p>

			</div>

			<div class="btn-group">

				<a href="restaurants">

					<button class="home-btn">Back To Home</button>

				</a> <a href="myOrders">

					<button class="order-btn">My Orders</button>

				</a>

			</div>

		</div>

	</div>

</body>

</html>