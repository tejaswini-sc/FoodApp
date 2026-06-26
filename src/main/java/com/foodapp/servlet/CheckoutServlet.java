package com.foodapp.servlet;

import java.io.IOException;

import com.foodapp.model.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if(cart == null || cart.getItems().isEmpty()){

            resp.sendRedirect("cart");

            return;
        }

        req.setAttribute("cart", cart);

        RequestDispatcher rd =
                req.getRequestDispatcher("Checkout.jsp");

        rd.forward(req, resp);

    }
}