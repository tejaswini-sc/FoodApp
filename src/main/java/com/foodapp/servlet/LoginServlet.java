package com.foodapp.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.foodapp.daoimpl.UserDaoImp;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDaoImp userDaoImp = new UserDaoImp();
		User user = userDaoImp.getUserByEmail(email);

		if (user != null && BCrypt.checkpw(password, user.getPassword())) {

			HttpSession session = req.getSession();

			session.setAttribute("user", user);
			resp.sendRedirect("restaurants");

		} else {

			resp.sendRedirect("Login.html");

		}

	}
}