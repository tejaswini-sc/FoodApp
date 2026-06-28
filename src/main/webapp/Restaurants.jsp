<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.foodapp.model.Restaurant"%>
<%@ page import="java.time.LocalTime"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Restaurants</title>

<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/restaurant.css">



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

			<li><a href="Login.html">SignUp</a></li>

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
				<%
				User user = (User) session.getAttribute("user");
				%>
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
						My Profile </a>
						<%
						if (user != null && "admin".equalsIgnoreCase(user.getRole())) {
						%>
					<a href="<%=request.getContextPath()%>/admin/dashboard"> ⚙️ Admin Dashboard </a>
						<%
						}
						%>
					<a href="<%=request.getContextPath()%>/logout"> 🚪 Logout </a>

				</div>

			</div>
		</div>

	</nav>

	<%
	String greeting = "";

	int hour = LocalTime.now().getHour();

	if (hour < 12) {

		greeting = "☀️ Good Morning";

	} else if (hour < 17) {

		greeting = "🌤 Good Afternoon";

	} else {

		greeting = "🌙 Good Evening";

	}

	String username = "";

	if (user != null) {

		username = user.getUserName(); // change if your getter is different

	}
	%>
	<!-- Hero Section -->

	<section id="home" class="hero">

		<div class="hero-left">

			<div class="tag">🔥 Trending Near You</div>

			<%
			if (user != null) {
			%>

			<div class="welcome">

				<%=greeting%>,
				<%=username%>
				👋

			</div>

			<%
			}
			%>

			<h1>DISCOVER DELICIOUS FOOD</h1>

			<p>Order from your favourite restaurants and enjoy premium meals.

			</p>

			<div class="search-box">

				<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
					id="searchInput" placeholder="Search restaurants...">
			</div>

		</div>

		<div class="hero-right">

			<div class="food-cluster">

				<div class="food center">🍽️</div>

				<div class="food top">

					<img src="images/menu/margherita_pizza.jpg">

				</div>

				<div class="food left">

					<img src="images/menu/whopper_burger.jpg">

				</div>

				<div class="food right">

					<img src="images/menu/greek_salad.jpg">

				</div>

				<div class="food bottom-left">

					<img src="images/menu/cold_coffee.jpg">

				</div>

				<div class="food bottom-right">

					<img src="images/menu/california_roll.jpg">

				</div>

			</div>

		</div>
	</section>


	<section class="categories">

		<div class="chip">🍕 Pizza</div>

		<div class="chip">🍔 Burger</div>

		<div class="chip">🍜 Asian</div>

		<div class="chip">☕ Cafe</div>

		<div class="chip">🥗 Healthy</div>

	</section>


	<!-- Restaurant Title -->

	<section class="restaurant-title">

		<h2>🔥 Popular Restaurants</h2>

		<p>Explore restaurants from different cuisines.</p>

	</section>


	<!-- Restaurant Section -->
	<section id="restaurant" class="restaurants">

		<%
		List<Restaurant> allResturant =

				(List<Restaurant>) request.getAttribute("allResturant");

		for (Restaurant restaurant : allResturant)

		{
		%>

		<div class="card restaurant-card">
			<div class="heart">

				<i class="fa-regular fa-heart"></i>

			</div>

			<div class="image-box">

				<img src="<%=restaurant.getImagePath()%>">

			</div>

			<h3 class="restaurant-name">

				<%=restaurant.getName()%>

			</h3>

			<p class="restaurant-cuisine">

				<%=restaurant.getCuisineType()%>

			</p>

			<div class="details">

				<span> ⭐ <%=restaurant.getRating()%>

				</span> <span> ⏱ <%=restaurant.getDeliveryTime()%> min

				</span>

			</div>

			<a href="menu?restaurantId=<%=restaurant.getResturantID()%>">

				<button>View Menu</button>

			</a>

		</div>

		<%
		}
		%>

		<h2 id="noResult" style="display: none">No restaurants found 🍽️

		</h2>

	</section>

	<footer>

		<div class="footer-container">

			<div class="footer-about">

				<h2>🍃 FoodCafe</h2>

				<p>Crafting delicious experiences, one meal at a time.</p>

			</div>

			<div class="footer-links">

				<h3>Quick Links</h3>

				<a href="restaurants#home">Home</a> <a href="restaurants#restaurant">Restaurants</a>

				<a href="myOrders">Orders</a>

			</div>

			<div class="footer-contact">

				<h3>Contact</h3>

				<p>📧 support@foodcafe.com</p>

				<p>📞 +91 XXXXX XXXXX</p>

			</div>

			<div class="footer-social">

				<h3>Follow Us</h3>

				<a href="#">📷 Instagram</a> <a href="#">💼 LinkedIn</a> <a href="#">💻
					GitHub</a>

			</div>

		</div>

		<hr>

		<p class="copyright">© 2026 FoodCafe. All Rights Reserved.</p>

	</footer>
	<script>

const searchInput = document.getElementById("searchInput");
const cards = document.querySelectorAll(".restaurant-card");

searchInput.addEventListener("keyup", function () {

    let search = this.value.toLowerCase();

    cards.forEach(function(card){

        let name = card.querySelector(".restaurant-name").textContent.toLowerCase();
        let cuisine = card.querySelector(".restaurant-cuisine").textContent.toLowerCase();

        console.log("Searching:", search);
        console.log("Restaurant:", name);

        if(name.includes(search) || cuisine.includes(search)){

            console.log("MATCH");

            card.style.display = "";

        }else{

            console.log("HIDE");

            card.style.display = "none";

        }

    });

});

</script>
</body>

</html>
