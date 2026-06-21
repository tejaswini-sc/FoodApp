package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.RestaurantDAOImp;
import com.foodapp.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantsServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDAOImp restaurant = new RestaurantDAOImp();
		
		List<Restaurant> allResturant = restaurant.getAllResturant();
		
		req.setAttribute("allResturant", allResturant);
		RequestDispatcher rd = req.getRequestDispatcher("Restaurants.jsp");
		rd.forward(req, resp);
	}

}
