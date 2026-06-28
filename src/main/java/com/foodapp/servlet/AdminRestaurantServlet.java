package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.RestaurantDAOImp;
import com.foodapp.model.Restaurant;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/restaurants")
public class AdminRestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (!isAdmin(req, resp)) {
			return;
		}

		String restaurantIdParam = req.getParameter("restaurantId");

		RestaurantDAOImp restaurantDao = new RestaurantDAOImp();

		if (restaurantIdParam != null && !restaurantIdParam.isEmpty()) {

			int restaurantId = Integer.parseInt(restaurantIdParam);

			Restaurant restaurant = restaurantDao.getResturant(restaurantId);

			if (restaurant == null) {
				resp.sendRedirect(req.getContextPath() + "/admin/restaurants");
				return;
			}

			req.setAttribute("restaurant", restaurant);

			RequestDispatcher rd = req.getRequestDispatcher("/AdminEditRestaurant.jsp");
			rd.forward(req, resp);
			return;
		}

		List<Restaurant> allResturant = restaurantDao.getAllResturant();

		req.setAttribute("allResturant", allResturant);

		RequestDispatcher rd = req.getRequestDispatcher("/AdminRestaurants.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (!isAdmin(req, resp)) {
			return;
		}

		String action = req.getParameter("action");

		RestaurantDAOImp restaurantDao = new RestaurantDAOImp();

		if ("add".equals(action)) {

			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");

			Restaurant restaurant = buildRestaurantFromRequest(req);
			restaurant.setAdminUserId(user.getuserid());
			restaurant.setActive("on".equals(req.getParameter("isActive")));

			restaurantDao.addRestaurant(restaurant);

		} else if ("update".equals(action)) {

			int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

			Restaurant existing = restaurantDao.getResturant(restaurantId);

			if (existing != null) {

				Restaurant restaurant = buildRestaurantFromRequest(req);
				restaurant.setResturantID(restaurantId);
				restaurant.setAdminUserId(existing.getAdminUserId());
				restaurant.setActive("on".equals(req.getParameter("isActive")));

				restaurantDao.updateResturant(restaurant);
			}

		} else if ("delete".equals(action)) {

			int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
			restaurantDao.deleteResturant(restaurantId);

		} else if ("toggleActive".equals(action)) {

			int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

			Restaurant restaurant = restaurantDao.getResturant(restaurantId);

			if (restaurant != null) {
				restaurant.setActive(!restaurant.isActive());
				restaurantDao.updateResturant(restaurant);
			}
		}

		resp.sendRedirect(req.getContextPath() + "/admin/restaurants");
	}

	private Restaurant buildRestaurantFromRequest(HttpServletRequest req) {

		Restaurant restaurant = new Restaurant();

		restaurant.setName(req.getParameter("name"));
		restaurant.setCuisineType(req.getParameter("cuisineType"));
		restaurant.setDeliveryTime(Integer.parseInt(req.getParameter("deliveryTime")));
		restaurant.setAddress(req.getParameter("address"));
		restaurant.setRating(Double.parseDouble(req.getParameter("rating")));
		restaurant.setImagePath(req.getParameter("imagePath"));

		return restaurant;
	}

	private boolean isAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
			resp.sendRedirect(req.getContextPath() + "/Login.html");
			return false;
		}

		return true;
	}
}
