<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.foodapp.model.Menu" %>
    
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Menu</title>

<link rel="stylesheet" href="Menu.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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

</nav>



<!-- Hero -->

<section class="hero">

<h1>Today's Special Menu</h1>

<p>Handcrafted meals prepared with fresh ingredients.</p>

<input type="text" placeholder="Search food items...">

</section>



<!-- Menu Items -->

<section class="menu-container">

<% List<Menu> menuByRestaurant=(List<Menu>)request.getAttribute("menuByRestaurant"); 
	for(Menu menu:menuByRestaurant){
		%>
		<div class="food-card">

		<img src="<%=menu.getImagePath()%>">
		

		<h3><%=menu.getItemName() %></h3>

		<p><%=menu.getDescription() %></p>

		<span class="category"><%=menu.getCategory() %></span>

		<div class="bottom">

		<h4>₹<%=menu.getPrice() %></h4>

		<button>Add To Cart</button>

		</div>

		</div>
		
		<%
	}
	
%>


</section>

</body>

</html>