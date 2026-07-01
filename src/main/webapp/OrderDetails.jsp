<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.foodapp.model.OrderTable"%>
<%@page import="com.foodapp.model.OrderItem"%>

<%@ page import="java.text.SimpleDateFormat"%>

<%
OrderTable order = (OrderTable) request.getAttribute("order");

List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");
%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy • hh:mm a");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>

<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/orderDetails.css">


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

</head>

<body>

	<!-- Navbar -->
	
	<%@page import="com.foodapp.model.Cart"%>

<%
Cart cart = (Cart)session.getAttribute("cart");

int cartCount = 0;

if(cart != null){

    cartCount = cart.getTotalItems();

}
%>
	

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

			<a href="cart" class="icon-btn cart-icon">

    <i class="fa-solid fa-cart-shopping"></i>

    <% if(cartCount > 0){ %>

        <span class="cart-badge">

            <%=cartCount > 9 ? "9+" : cartCount%>

        </span>

    <% } %>

</a>
			</a> <a href="Profile.jsp" class="icon-btn"> <i
				class="fa-solid fa-user"></i>

			</a>

		</div>

	</nav>



	<div class="orders-header">

		<h1>📋 Order Details</h1>

		<p class="order-meta">

			Order #<%=order.getOredrId()%>

			•

			<%=sdf.format(order.getOrderDate())%>

			•

			<%=order.getStatus()%>

		</p>

	</div>

	<div class="details-container">

		<%
		double subtotal = 0;

		for (OrderItem item : items) {

			subtotal += item.getItemTotal();
		%>

		<div class="item-card">

			<img src="<%=item.getImagePath()%>" class="food-img">

			<div class="item-info">

				<h3><%=item.getItemName()%></h3>

				<div
					class="food-type <%=item.getFoodType().equalsIgnoreCase("Veg") ? "veg" : "nonveg"%>">

					<%=item.getFoodType()%>

				</div>

				<p>
					Quantity :
					<%=item.getQuantity()%>
				</p>

				<p>
					₹<%=item.getPrice()%>
					×
					<%=item.getQuantity()%>
				</p>

			</div>

			<div class="item-total">

				₹<%=item.getItemTotal()%>

			</div>

		</div>
		<%
		}

		double delivery = subtotal >= 500 ? 0 : 40;

		double gst = subtotal * 0.05;

		double total = subtotal + delivery + gst;
		%>

		<div class="summary-card">

			<h2>Bill Summary</h2>

			<div class="summary-row">

				<span> Subtotal </span> <span> ₹<%=subtotal%>

				</span>

			</div>

			<div class="summary-row">

				<span> Delivery </span> <span> <%=delivery == 0 ? "FREE" : "₹" + delivery%>

				</span>

			</div>

			<div class="summary-row">

				<span> GST </span> <span> ₹<%=String.format("%.2f", gst)%>

				</span>

			</div>

			<hr>

			<div class="summary-total">

				<span> Grand Total </span> <span> ₹<%=String.format("%.2f", total)%>

				</span>

			</div>

			<a href="myOrders">

				<button class="back-btn">← Back to My Orders</button>

			</a>

		</div>



	</div>

</body>

</html>