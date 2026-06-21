<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.foodapp.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Restaurants</title>

<link rel="stylesheet" href="Restaurants.css">

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



<!-- Hero Section -->

<section class="hero">

<h1>Discover Flavors Crafted With Love</h1>

<p>Fresh ingredients, premium taste and unforgettable dining experiences.</p>

<input type="text" placeholder="Search restaurants...">

</section>


<!-- Restaurant Section -->
<section class="restaurants">

<%
List<Restaurant> allResturant = (List<Restaurant>)request.getAttribute("allResturant");
for(Restaurant restarunt : allResturant)
{
	%>
	
	<div class="card">

	<img src="<%=restarunt.getImagePath()%>">

	<h3><%=restarunt.getName() %></h3>

	<p> <%=restarunt.getCuisineType() %></p>

	<div class="info">

	<span><%= restarunt.getRating() %></span>

	<span><%= restarunt.getDeliveryTime() %>min</span>

	</div>

	<a href="menu?restaurantId=<%=restarunt.getResturantID()%>"><button>View Menu</button></a>

	</div>
<%
}

%>
<!-- Restaurant Section -->

</section>

</body>

</html>
