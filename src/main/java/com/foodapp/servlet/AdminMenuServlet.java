package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.MenuDAOimp;
import com.foodapp.daoimpl.RestaurantDAOImp;
import com.foodapp.model.Menu;
import com.foodapp.model.Restaurant;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/menu")
public class AdminMenuServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		 System.out.println("AdminMenuServlet Loaded");
		if (!isAdmin(req, resp)) {
			return;
		}

		String menuIdParam = req.getParameter("menuId");
		String restaurantIdParam = req.getParameter("restaurantId");

		MenuDAOimp menuDao = new MenuDAOimp();
		RestaurantDAOImp restaurantDao = new RestaurantDAOImp();

		if (menuIdParam != null && !menuIdParam.isEmpty()) {

			int menuId = Integer.parseInt(menuIdParam);

			Menu menu = menuDao.getMenu(menuId);

			if (menu == null) {
				resp.sendRedirect(req.getContextPath() + "/admin/menu");
				return;
			}

			Restaurant restaurant = restaurantDao.getResturant(menu.getRestaurantId());

			req.setAttribute("menu", menu);
			req.setAttribute("restaurant", restaurant);

			RequestDispatcher rd = req.getRequestDispatcher("/AdminEditMenu.jsp");
			rd.forward(req, resp);
			return;
		}

		List<Restaurant> allResturant = restaurantDao.getAllResturant();
		req.setAttribute("allResturant", allResturant);

		if (restaurantIdParam != null && !restaurantIdParam.isEmpty()) {

			int restaurantId = Integer.parseInt(restaurantIdParam);

			Restaurant restaurant = restaurantDao.getResturant(restaurantId);

			if (restaurant == null) {
				resp.sendRedirect(req.getContextPath() + "/admin/menu");
				return;
			}

			List<Menu> menuByRestaurant = menuDao.getMenuByRestaurant(restaurantId);

			req.setAttribute("restaurant", restaurant);
			req.setAttribute("menuByRestaurant", menuByRestaurant);
		}

		RequestDispatcher rd = req.getRequestDispatcher("/AdminMenu.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (!isAdmin(req, resp)) {
			return;
		}

		String action = req.getParameter("action");
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

		MenuDAOimp menuDao = new MenuDAOimp();

		if ("add".equals(action)) {

			Menu menu = buildMenuFromRequest(req);
			menu.setRestaurantId(restaurantId);
			menu.setAvailable("on".equals(req.getParameter("isAvailable")));

			menuDao.addMenu(menu);

		} else if ("update".equals(action)) {

			int menuId = Integer.parseInt(req.getParameter("menuId"));

			Menu existing = menuDao.getMenu(menuId);

			if (existing != null) {

				Menu menu = buildMenuFromRequest(req);
				menu.setMenuId(menuId);
				menu.setRestaurantId(restaurantId);
				menu.setAvailable("on".equals(req.getParameter("isAvailable")));

				menuDao.updateMenu(menu);
			}

		} else if ("delete".equals(action)) {

			int menuId = Integer.parseInt(req.getParameter("menuId"));
			menuDao.deleteMenu(menuId);

		} else if ("toggleAvailable".equals(action)) {

			int menuId = Integer.parseInt(req.getParameter("menuId"));

			Menu menu = menuDao.getMenu(menuId);

			if (menu != null) {
				menu.setAvailable(!menu.isAvailable());
				menuDao.updateMenu(menu);
			}
		}

		resp.sendRedirect(req.getContextPath() + "/admin/menu?restaurantId=" + restaurantId);
	}

	private Menu buildMenuFromRequest(HttpServletRequest req) {

		Menu menu = new Menu();

		menu.setItemName(req.getParameter("itemName"));
		menu.setDescription(req.getParameter("description"));
		menu.setPrice(Double.parseDouble(req.getParameter("price")));
		menu.setCategory(req.getParameter("category"));
		menu.setImagePath(req.getParameter("imagePath"));
		menu.setFoodType(req.getParameter("foodType"));
		menu.setRating(Float.parseFloat(req.getParameter("rating")));

		return menu;
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
