package com.foodapp.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.foodapp.daoimpl.OrderTabledaoImp;
import com.foodapp.daoimpl.RestaurantDAOImp;
import com.foodapp.daoimpl.UserDaoImp;
import com.foodapp.model.OrderTable;
import com.foodapp.model.Restaurant;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/Login.html");
            return;
        }

        OrderTabledaoImp orderDao = new OrderTabledaoImp();
        List<OrderTable> orders = orderDao.getAllOrder();

        Map<Integer, String> userNames = new HashMap<>();
        Map<Integer, String> restaurantNames = new HashMap<>();

        UserDaoImp userDao = new UserDaoImp();
        List<User> allUsers = userDao.getAllUser();
        for (User u : allUsers) {
            userNames.put(u.getuserid(), u.getUserName());
        }

        RestaurantDAOImp restaurantDao = new RestaurantDAOImp();
        List<Restaurant> allRestaurants = restaurantDao.getAllResturant();
        for (Restaurant r : allRestaurants) {
            restaurantNames.put(r.getResturantID(), r.getName());
        }

        req.setAttribute("orders", orders);
        req.setAttribute("userNames", userNames);
        req.setAttribute("restaurantNames", restaurantNames);

        RequestDispatcher rd = req.getRequestDispatcher("/AdminOrders.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/Login.html");
            return;
        }

        String action = req.getParameter("action");

        if ("updateStatus".equals(action)) {

            int orderId = Integer.parseInt(req.getParameter("orderId"));
            String status = req.getParameter("status");

            OrderTabledaoImp orderDao = new OrderTabledaoImp();
            orderDao.udateOrderStatus(orderId, status);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/orders");
    }
}
