<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {

	response.sendRedirect("Login.html");
	return;

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/profile.css">



<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">


</head>
<body>
<%@page import="com.foodapp.model.Cart"%>
	<%@page import="com.foodapp.model.User"%>
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

			<li><a href="#home">Home</a></li>

			<li><a href="#restaurant">Restaurants</a></li>

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

			</a>
			<div class="profile-menu">

				<a href="#" class="icon-btn"> <i class="fa-solid fa-user"></i>

				</a>
				
				<div class="dropdown">

					<div class="user-name">

						<%
						if (user != null) {
						%>

						👋 Hi,
						<%=user.getUserName()%>

						<%
						} else {
						%>

						👋 Welcome Guest

						<%
						}
						%>

					</div>

					<a href="myOrders"> 📦 My Orders </a> <a href="Profile.jsp"> 👤
						My Profile </a> <a href="logout"> 🚪 Logout </a>

				</div>

			</div>
		</div>

	</nav>

	<section class="profile-container">

		<div class="profile-card">

			<div class="profile-avatar">

				<i class="fa-solid fa-user"></i>

			</div>

			<h2><%=user.getUserName()%></h2>

			<p>FoodCafe User</p>

			<div class="profile-info">

				<div class="info-box">

					<span>📧 Email</span>

					<p><%=user.getEmail()%></p>

				</div>

				

				<div class="info-box">

					<span>🏠 Address</span>

					<p><%=user.getAddress()%></p>

				</div>

			</div>

			<div class="profile-actions">

				<a href="myOrders" class="btn"> 📦 My Orders </a> <a href="logout"
					class="btn logout"> 🚪 Logout </a>

			</div>

		</div>

	</section>

</body>
</html>