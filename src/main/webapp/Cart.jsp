<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.Cart"%>
<%@ page import="com.foodapp.model.CartItem"%>
<%@ page import="java.util.Collection"%>

<%
Cart cart = (Cart) request.getAttribute("cart");

Collection<CartItem> items = null;

double subtotal = 0;
double delivery = 0;
double gst = 0;
double total = 0;

if (cart != null) {

	items = cart.getItems().values();

	subtotal = cart.getTotalPrice();

	delivery = (subtotal == 0 || subtotal >= 500) ? 0 : 40;

	gst = subtotal * 0.05;

	total = subtotal + delivery + gst;
}
%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Cart</title>

<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/Cart.css">

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

			<li><a href="restaurants">Restaurants</a></li>

			<li><a href="myOrders">Orders</a></li>

			<li><a href="Login.html">SignUp</a></li>

		</ul>

		<div class="nav-icons">

			<a href="cart" class="icon-btn cart-icon"> <i
				class="fa-solid fa-cart-shopping"></i> <%
 if (cartCount > 0) {
 %> <span
				class="cart-badge"> <%=cartCount%>

			</span> <%
 }
 %>

			</a> </a> <a href="Profile.jsp" class="icon-btn"> <i
				class="fa-solid fa-user"></i>

			</a>

		</div>

	</nav>




	<!-- PAGE TITLE -->

	<section class="cart-header">

		<h1>🛒 Your Cart</h1>

		<p>Review your selected delicious meals before checkout.</p>

	</section>


	<!-- MAIN CONTAINER -->

	<div class="cart-container">

		<div class="cart-items">

			<%
			if (items == null || items.isEmpty()) {
			%>

			<div class="empty-cart">

				<img src="images/empty_cart.png">

				<h2>🍽️ Nothing delicious here yet!</h2>

				<p>Browse our restaurants and add your favorite meals.</p>

				<a href="restaurants">

					<button class="shop-btn">Browse Restaurants</button>

				</a>

			</div>

			<%
			} else {

			for (CartItem item : items) {
			%>

			<div class="cart-card">

				<img src="<%=item.getImagePath()%>">

				<div class="item-details">

					<h3>

						<%=item.getName()%>

					</h3>

					<div
						class="food-type <%=item.getFoodType().equalsIgnoreCase("Veg") ? "veg" : "nonveg"%>">

						<%=item.getFoodType()%>

					</div>

					<h4>

						₹<%=String.format("%.2f", item.getPrice())%>

						<span class="each"> each </span>

					</h4>

					<p>

						Subtotal : ₹<%=String.format("%.2f", item.getPrice() * item.getQuantity())%>

					</p>

				</div>


				<div class="quantity-box">

					<!-- Minus -->

					<form action="callCartServlet" method="post">

						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="menuId" value="<%=item.getMenuId()%>">

						<input type="hidden" name="restaurantId"
							value="<%=item.getRestaurantId()%>"> <input type="hidden"
							name="quantity" value="<%=item.getQuantity() - 1%>">

						<button type="submit">-</button>

					</form>

					<span> <%=item.getQuantity()%>

					</span>

					<form action="callCartServlet" method="post">

						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="menuId" value="<%=item.getMenuId()%>">

						<input type="hidden" name="restaurantId"
							value="<%=item.getRestaurantId()%>"> <input type="hidden"
							name="quantity" value="<%=item.getQuantity() + 1%>">

						<button type="submit">+</button>

					</form>

				</div>


				<div class="remove">

					<form action="callCartServlet" method="post">

						<input type="hidden" name="action" value="delete"> <input
							type="hidden" name="menuId" value="<%=item.getMenuId()%>">

						<input type="hidden" name="restaurantId"
							value="<%=item.getRestaurantId()%>">

						<button class="remove-btn">

							<i class="fa-solid fa-trash"></i>

						</button>

					</form>

				</div>

			</div>

			<%
			}

			}
			%>

			<%
			Integer restaurantId = (Integer) session.getAttribute("restaurantId");
			%>

			<div class="continue-shopping">

				<%
				if (items != null && !items.isEmpty()) {
				%>

				<a href="menu?restaurantId=<%=restaurantId%>"> ← Continue
					Ordering </a>

				<%
				}
				%>
			</div>
		</div>


		<!-- ORDER SUMMARY -->

		<div class="summary-card">

			<h2>Order Summary</h2>

			<div class="summary-row">

				<span> Items Total </span> <span> ₹<%=String.format("%.2f", subtotal)%>

				</span>

			</div>

			<div class="summary-row">

				<span> Delivery </span> <span> <%
 String deliveryText;

 if (subtotal == 0) {
 	deliveryText = "₹0";
 } else if (delivery == 0) {
 	deliveryText = "FREE";
 } else {
 	deliveryText = "₹" + String.format("%.2f", delivery);
 }
 %> <span><%=deliveryText%></span>
				</span>

			</div>

			<div class="summary-row">

				<span> GST (5%) </span> <span> ₹<%=String.format("%.2f", gst)%>

				</span>

			</div>

			<hr>

			<div class="summary-total">

				<span> Grand Total </span> <span> ₹<%=String.format("%.2f", total)%>

				</span>

			</div>

			<a href="checkout">

				<button class="checkout-btn">Proceed To Checkout</button>

			</a>

		</div>

	</div>

</body>

</html>
