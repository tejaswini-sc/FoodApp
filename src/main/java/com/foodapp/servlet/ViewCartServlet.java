package com.foodapp.servlet;

import java.io.IOException;

import com.foodapp.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class ViewCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {

            cart = new Cart();

            session.setAttribute("cart", cart);

        }

        req.setAttribute("cart", cart);

        req.getRequestDispatcher("Cart.jsp")
                .forward(req, resp);
    }
}