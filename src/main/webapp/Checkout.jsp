<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.Cart"%>

<%
Cart cart = (Cart) request.getAttribute("cart");

double subtotal = cart.getTotalPrice();

double delivery = (subtotal == 0 || subtotal >= 500) ? 0 : 40;

double gst = subtotal * 0.05;

double total = subtotal + delivery + gst;
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Checkout</title>

<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/checkout.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

</head>

<body>

	<!-- NAVBAR -->

	<nav>

		<div class="logo">🍃 FoodCafe</div>

		<ul>

			<li>Home</li>

			<li>Restaurants</li>

			<li>Orders</li>

			<li>Profile</li>

		</ul>

		<div class="nav-icons">

			<div class="icon-btn">🛒</div>

			<div class="icon-btn">👤</div>

		</div>

	</nav>

	<!-- PAGE TITLE -->

	<section class="checkout-header">

		<h1>Checkout</h1>

		<p>Complete your delivery details and place your order.</p>

	</section>

	<div class="checkout-container">

		<!-- LEFT SIDE -->
		<form action="placeOrder" method="post">

			<div class="form-section">

				<div class="checkout-form">

					<h2>Delivery Details</h2>

					<div class="input-group">

						<label> Full Name </label> <input type="text" name="name" required>

					</div>

					<div class="input-group">

						<label> Phone Number </label> <input type="tel" name="phone"
							required>

					</div>

					<div class="input-group">

						<label> Delivery Address </label>

						<textarea name="address" rows="4" required></textarea>

					</div>

					<div class="input-row">

						<div class="input-group">

							<label> City </label> <input type="text" name="city" required>

						</div>

						<div class="input-group">

							<label> Pincode </label> <input type="text" name="pincode"
								required>

						</div>

					</div>

					<h2>Payment Method</h2>

					<div class="payment-box">

						<label> <input type="radio" name="payment"
							value="Cash" checked> Cash On Delivery

						</label> <label> <input type="radio" name="payment" value="UPI">

							UPI

						</label> <label> <input type="radio" name="payment" value="Card">

							Credit / Debit Card

						</label>

					</div>
				</div>
			</div>
			<!-- ORDER SUMMARY -->

			<div class="summary-card">

				<h2>Order Summary</h2>

				<div class="summary-row">

					<span>Items Total</span> <span>₹<%=String.format("%.2f", subtotal)%></span>

				</div>

				<div class="summary-row">

					<span>Delivery</span> <span> <%=delivery == 0 ? "FREE" : "₹" + String.format("%.2f", delivery)%>
					</span>

				</div>

				<div class="summary-row">

					<span>GST (5%)</span> <span>₹<%=String.format("%.2f", gst)%></span>

				</div>

				<hr>

				<div class="summary-total">

					<span>Grand Total</span> <span>₹<%=String.format("%.2f", total)%></span>

				</div>

				<button type="submit" class="place-order-btn">Place Order</button>

			</div>

		</form>

	</div>

</body>

</html>