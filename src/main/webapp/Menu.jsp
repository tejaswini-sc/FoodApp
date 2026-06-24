<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.foodapp.model.Menu" %>
    
    
    <%@ page import="com.foodapp.model.Restaurant"%>
    
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Menu</title>

<link rel="stylesheet" href="css/common.css">

<link rel="stylesheet" href="css/Menu.css">
<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"

href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

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

🛒

</div>

<div class="icon-btn">

👤

</div>

</div>

</nav>

<%

Restaurant restaurant=

(Restaurant)

request.getAttribute("restaurant");

%>

<!-- Hero -->

<section class="menu-hero">

<div class="tag">

🍽️ Chef's Recommendation

</div>

<h1>

Find Your

Favourite Meal

</h1>

<p>

Freshly prepared meals crafted with premium ingredients.

</p>

<div class="menu-search">

<input

type="text"

placeholder="Search dishes...">

</div>

<div class="restaurant-name">

🍽️ <%=restaurant.getName()%>

</div>

</section>

<!-- Menu Items -->

<section class="menu-container">

<% List<Menu> menuByRestaurant=(List<Menu>)request.getAttribute("menuByRestaurant"); 
	for(Menu menu:menuByRestaurant){
		%>
<div class="food-card">

<div class="image-box">

<img src="<%=menu.getImagePath()%>">

</div>

<div class="food-info">

<div class="food-top">

<span class="category">

<%=menu.getCategory()%>

</span>

<div class="heart">

<i class="fa-regular fa-heart"></i>

</div>

</div>

<h3>

<%=menu.getItemName()%>

</h3>

<div class="food-meta">

<span class="food-type">

<%=menu.getFoodType()%>

</span>

<span class="food-rating">

⭐ <%=menu.getRating()%>

</span>

</div>

<p>

<%=menu.getDescription()%>

</p>

<div class="price-row">

<h4>

₹<%=menu.getPrice()%>

</h4>

<button>

Add To Cart

</button>

</div>

</div>

</div>
		
		<%
	}
	
%>


</section>

<footer>

<div class="footer-container">

<div class="footer-left">

<h2>

🍃 FoodCafe

</h2>

<p>

Crafting delicious experiences one meal at a time.

</p>

</div>

<div class="footer-links">

<h3>

Quick Links

</h3>

<ul>

<li>

Home

</li>

<li>

Restaurants

</li>

<li>

About

</li>

<li>

Contact

</li>

</ul>

</div>

</div>

<hr>

<p class="copyright">

© 2026 FoodCafe | Made with ❤️

</p>

</footer>

</body>

</html>