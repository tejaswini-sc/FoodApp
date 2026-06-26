package com.foodapp.servlet;

import java.io.IOException;

import com.foodapp.daoimpl.MenuDAOimp;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callCartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		Integer newResturantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		if (cart == null || restaurantId == null || !restaurantId.equals(newResturantId)) {
		
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newResturantId);
			
		
		}
		
		String action = req.getParameter("action");
		if(action.equals("add")) {
			addItemToCart(req,cart);
		}
		else if(action.equals("update")) {
			updateCart(req,cart);
		}
		else if(action.equals("delete")) {
			removeItemFromcart(req,cart);
		}
		resp.sendRedirect("cart");
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {

		int menuId=Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		MenuDAOimp menuDAOimp = new MenuDAOimp();
		Menu menu = menuDAOimp.getMenu(menuId);

		System.out.println("Food Type = " + menu.getFoodType());
		System.out.println("Image = " + menu.getImagePath());
		System.out.println("Menu = " + menu.getItemName());
		
		if(menu!=null) {
			CartItem cartItem = new CartItem(menuId, menu.getRestaurantId(), menu.getItemName(),menu.getPrice(), quantity,menu.getImagePath(),menu.getFoodType());
			cart.addItem(cartItem);
		}
		
	}
	
	private void removeItemFromcart(HttpServletRequest req, Cart cart) {
		
		HttpSession session = req.getSession();

		int menuId = Integer.parseInt(req.getParameter("menuId"));

	    cart.removeItem(menuId);
	    if(cart.getItems().isEmpty()) {
	        session.removeAttribute("restaurantId");
	    }
	}

	private void updateCart(HttpServletRequest req, Cart cart) {
		 		
			HttpSession session = req.getSession();
		    
		    int menuId = Integer.parseInt(req.getParameter("menuId"));

		    int quantity = Integer.parseInt(req.getParameter("quantity"));

		    cart.updateItem(menuId, quantity);
		    if(cart.getItems().isEmpty()) {
		        session.removeAttribute("restaurantId");
		    }
	}

	
}
