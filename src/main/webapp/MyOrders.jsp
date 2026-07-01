<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.foodapp.model.OrderTable"%>

<%
List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orders");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Orders</title>

<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/myOrders.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

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

			<li><a href="Login.html">SignUp</a></li>

		</ul>

		<div class="nav-icons">

			<a href="cart" class="icon-btn cart-icon"> <i
				class="fa-solid fa-cart-shopping"></i> <%
 if (cartCount > 0) {
 %> <span
				class="cart-badge"><%=cartCount > 9 ? "9+" : cartCount%>

			</span> <%
 }
 %>

			</a> </a> <a href="Profile.jsp" class="icon-btn"> <i
				class="fa-solid fa-user"></i>

			</a>

		</div>


	</nav>


	<div class="orders-header">

		<h1>📦 My Orders</h1>

		<p>Track all your previous food orders.</p>

	</div>

	<div class="orders-container">

		<%
		if (orders == null || orders.isEmpty()) {
		%>

		<div class="empty-orders">

			<img src="images/no_orders.gif">

			<h2>No Orders Yet</h2>

			<p>Looks like you haven't placed any orders.</p>

			<a href="restaurants">

				<button class="browse-btn">Browse Restaurants</button>

			</a>

		</div>

		<%
		} else {

		for (OrderTable order : orders) {
		%>

		<div class="order-card">

			<div class="order-left">

				<h2>

					Order #<%=order.getOredrId()%>

				</h2>

				<p>

					📅
					<%=order.getOrderDate()%>

				</p>

			</div>

			<div class="order-middle">

				<span
					class="status <%=order.getStatus().toLowerCase().replace(" ", "-")%>">
					<%=order.getStatus()%>
				</span> </span>

			</div>

			<div class="order-right">

				<h2>

					₹<%=String.format("%.2f", order.getTotalAmount())%>

				</h2>

				<a href="orderDetails?orderId=<%=order.getOredrId()%>">

					<button class="details-btn">View Details</button>

				</a>

			</div>

		</div>

		<%
		}
		}
		%>

		<footer>

			<div class="footer-container">

				<div class="footer-left">

					<h2>🍃 FoodCafe</h2>

					<p>Crafting delicious experiences one meal at a time.</p>

				</div>

			</div>

			<hr>

			<p class="copyright">© 2026 FoodCafe | Made with ❤️</p>

		</footer>
</body>

</html>


</div>