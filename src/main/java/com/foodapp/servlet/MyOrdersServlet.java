package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.OrderTabledaoImp;
import com.foodapp.model.OrderTable;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myOrders")
public class MyOrdersServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		if (user == null) {

			resp.sendRedirect("Login.html");
			return;

		}

		OrderTabledaoImp dao = new OrderTabledaoImp();

		List<OrderTable> orders = dao.getOrderByUserId(user.getuserid());

		req.setAttribute("orders", orders);

		RequestDispatcher rd = req.getRequestDispatcher("MyOrders.jsp");

		rd.forward(req, resp);

	}

}