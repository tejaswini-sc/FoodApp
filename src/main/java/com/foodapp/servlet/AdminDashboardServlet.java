package com.foodapp.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import com.foodapp.daoimpl.OrderTabledaoImp;
import com.foodapp.daoimpl.RestaurantDAOImp;
import com.foodapp.daoimpl.UserDaoImp;
import com.foodapp.model.OrderTable;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		System.out.println("AdminDashboardServlet doGet()");
		 System.out.println("AdminDashboardServlet Loaded");
		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {

			resp.sendRedirect(req.getContextPath() + "/Login.html");
			return;
		}

		RestaurantDAOImp restaurantDao = new RestaurantDAOImp();
		UserDaoImp userDao = new UserDaoImp();
		OrderTabledaoImp orderDao = new OrderTabledaoImp();

		int totalRestaurants = restaurantDao.getAllResturant().size();
		int totalUsers = userDao.getAllUser().size();
		List<OrderTable> orders = orderDao.getAllOrder();

		int totalOrders = orders.size();
		int pendingOrders = 0;
		int deliveredOrders = 0;
		int todayOrders = 0;
		double todayRevenue = 0;
		double totalRevenue = 0;

		LocalDate today = LocalDate.now();

		for (OrderTable order : orders) {

			totalRevenue += order.getTotalAmount();

			String status = order.getStatus();

			if (status != null && status.equalsIgnoreCase("Pending")) {
				pendingOrders++;
			}

			if (status != null && status.equalsIgnoreCase("Delivered")) {
				deliveredOrders++;
			}

			Timestamp orderDate = order.getOrderDate();

			if (orderDate != null) {

				LocalDate orderLocalDate = orderDate.toLocalDateTime().toLocalDate();

				if (orderLocalDate.equals(today)) {

					todayOrders++;
					todayRevenue += order.getTotalAmount();
				}
			}
		}

		req.setAttribute("totalRestaurants", totalRestaurants);
		req.setAttribute("totalUsers", totalUsers);
		req.setAttribute("totalOrders", totalOrders);
		req.setAttribute("pendingOrders", pendingOrders);
		req.setAttribute("deliveredOrders", deliveredOrders);
		req.setAttribute("todayOrders", todayOrders);
		req.setAttribute("todayRevenue", todayRevenue);
		req.setAttribute("totalRevenue", totalRevenue);

		RequestDispatcher rd = req.getRequestDispatcher("/AdminDashboard.jsp");
		rd.forward(req, resp);
	}
}
