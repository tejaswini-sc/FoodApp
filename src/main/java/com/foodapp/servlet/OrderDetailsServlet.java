package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.MenuDAOimp;
import com.foodapp.daoimpl.OrderItemDAOImp;
import com.foodapp.daoimpl.OrderTabledaoImp;
import com.foodapp.model.Menu;
import com.foodapp.model.OrderItem;
import com.foodapp.model.OrderTable;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int orderId = Integer.parseInt(req.getParameter("orderId"));

		OrderTabledaoImp orderDao = new OrderTabledaoImp();

		OrderItemDAOImp itemDao = new OrderItemDAOImp();

		OrderTable order = orderDao.getOrderById(orderId);

		List<OrderItem> items = itemDao.getOrderItemsByOrderId(orderId);

		MenuDAOimp menuDAO = new MenuDAOimp();

		for (OrderItem item : items) {

			Menu menu = menuDAO.getMenu(item.getMenuId());

			if (menu != null) {

				item.setItemName(menu.getItemName());

				item.setImagePath(menu.getImagePath());

				item.setFoodType(menu.getFoodType());

				item.setPrice(menu.getPrice());

			}

		}

		req.setAttribute("order", order);

		req.setAttribute("items", items);

		RequestDispatcher rd = req.getRequestDispatcher("OrderDetails.jsp");

		rd.forward(req, resp);

	}

}