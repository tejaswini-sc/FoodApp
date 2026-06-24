<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.foodapp.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Restaurants</title>

<link rel="stylesheet" href="css/restaurant.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet"

href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

<body>


<!-- Navbar -->

<nav>

<div class="logo">

🍃 FoodCafe

</div>

<ul>

<li>Home</li>

<li>Restaurants</li>

<li>Orders</li>

<li>Profile</li>

</ul>

<div class="nav-icons">

<div class="icon-btn">

<i class="fa-solid fa-cart-shopping"></i>

</div>

<div class="icon-btn">

<i class="fa-solid fa-user"></i>

</div>

</div>

</nav>


<!-- Hero Section -->

<section class="hero">

<div class="hero-left">

<div class="tag">

🔥 Trending Near You

</div>

<h1>

DISCOVER

DELICIOUS

FOOD

</h1>

<p>

Order from your favourite restaurants and enjoy premium meals.

</p>

<div class="search-box">

<input type="text"

placeholder="Search restaurants...">

<button>

Search

</button>

</div>

</div>

<div class="hero-right">

<div class="food-cluster">

<div class="food center">

🍽️

</div>

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

<div class="chip">

🍕 Pizza

</div>

<div class="chip">

🍔 Burger

</div>

<div class="chip">

🍜 Asian

</div>

<div class="chip">

☕ Cafe

</div>

<div class="chip">

🥗 Healthy

</div>

</section>


<!-- Restaurant Title -->

<section class="restaurant-title">

<h2>

🔥 Popular Restaurants

</h2>

<p>

Explore restaurants from different cuisines.

</p>

</section>


<!-- Restaurant Section -->
<section class="restaurants">

<%

List<Restaurant> allResturant=

(List<Restaurant>)

request.getAttribute("allResturant");

for(Restaurant restaurant : allResturant)

{

%>

<div class="card">

<div class="heart">

<i class="fa-regular fa-heart"></i>

</div>

<div class="image-box">

<img src="<%=restaurant.getImagePath()%>">

</div>

<h3>

<%=restaurant.getName()%>

</h3>

<p>

<%=restaurant.getCuisineType()%>

</p>

<div class="details">

<span>

⭐ <%=restaurant.getRating()%>

</span>

<span>

⏱ <%=restaurant.getDeliveryTime()%> min

</span>

</div>

<a href="menu?restaurantId=<%=restaurant.getResturantID()%>">

<button>

View Menu

</button>

</a>

</div>

<%

}

%>

</section>

<footer>

<div class="footer-container">

<div class="footer-left">

<h2>🍃 FoodCafe</h2>

<p>

Crafting delicious experiences one meal at a time.

</p>

</div>

<div class="footer-links">

<h3>Quick Links</h3>

<ul>

<li>Home</li>

<li>Restaurants</li>

<li>Orders</li>

<li>Profile</li>

</ul>

</div>

<div class="footer-contact">

<h3>Contact</h3>

<p>📍 Karnataka, India</p>

<p>📧 foodcafe@gmail.com</p>

<p>📞 +91 9876543210</p>

</div>

</div>

<hr>

<p class="copyright">

© 2026 FoodCafe | Made with ❤️

</p>

</footer>



</body>

</html>
