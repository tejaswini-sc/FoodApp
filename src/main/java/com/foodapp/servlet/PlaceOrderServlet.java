package com.foodapp.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import com.foodapp.daoimpl.OrderTabledaoImp;
import com.foodapp.daoimpl.OrderItemDAOImp;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.OrderItem;
import com.foodapp.model.OrderTable;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		Cart cart = (Cart) session.getAttribute("cart");

		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		if (user == null) {

			resp.sendRedirect("Login.html");

			return;
		}

		if (cart == null || cart.getItems().isEmpty()) {

			resp.sendRedirect("cart");

			return;
		}

		String paymentMethod = req.getParameter("payment");

		OrderTable order = new OrderTable();

		order.setUserId(user.getuserid());

		order.setResturantId(restaurantId);

		
		
		order.setOrderDate(new Timestamp(System.currentTimeMillis()));

		// Calculate Grand Total
		double subtotal = cart.getTotalPrice();

		double delivery = subtotal >= 500 ? 0 : 40;

		double gst = subtotal * 0.05;

		double grandTotal = subtotal + delivery + gst;

		order.setTotalAmount((float) grandTotal);

		order.setStatus("Pending");

		order.setPaymentMethod(paymentMethod);
		
		
		OrderTabledaoImp dao = new OrderTabledaoImp();

		int orderId = dao.addOrder(order);

		System.out.println("Generated Order ID = " + orderId);

		if (orderId == 0) {
			System.out.println("Order insert failed.");
			return;
		}

		OrderItemDAOImp orderItemDAO = new OrderItemDAOImp();

		for (CartItem item : cart.getItems().values()) {

			OrderItem orderItem = new OrderItem();

			orderItem.setOrderId(orderId);

			orderItem.setMenuId(item.getMenuId());

			orderItem.setQuantity(item.getQuantity());

			orderItem.setItemTotal(item.getPrice() * item.getQuantity());

			orderItemDAO.addOrderItem(orderItem);
		}

		cart.clearCart();

		session.removeAttribute("restaurantId");

		session.setAttribute("cart", new Cart());

		resp.sendRedirect("OrderSuccess.jsp");

	}

}