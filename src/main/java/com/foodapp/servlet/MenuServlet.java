package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.MenuDAOimp;
import com.foodapp.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		MenuDAOimp menuDAOimp = new MenuDAOimp();
		List<Menu> menuByRestaurant = menuDAOimp.getMenuByRestaurant(restaurantId);
		System.out.println(
		        menuByRestaurant.size()
		);
		for(Menu menu:menuByRestaurant) {
			System.out.println(menu);
		}	
		
		req.setAttribute("menuByRestaurant", menuByRestaurant);
		
		RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp");
		rd.forward(req, resp);
		
	}
	
}
