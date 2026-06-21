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
		
		if(user != null &&
				BCrypt.checkpw(password,
						user.getPassword())) {

			HttpSession session =
					req.getSession();

			session.setAttribute(
					"loggedInUser",
					user
			);

			resp.sendRedirect("restaurants");

		}
		else {

			resp.sendRedirect("Login.html");

		}
	
	}
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//	        throws ServletException, IOException {
//
//	    String email = req.getParameter("email");
//	    String password = req.getParameter("password");
//
//	    UserDaoImp userDaoImp = new UserDaoImp();
//
//	    User user = userDaoImp.getUserByEmail(email);
//
//	    System.out.println("User = " + user);
//
//	    if(user != null) {
//
//	        System.out.println("DB Password = " + user.getPassword());
//
//	        boolean matched = BCrypt.checkpw(password, user.getPassword());
//
//	        System.out.println("Password Matched = " + matched);
//
//	        if(matched) {
//
//	            HttpSession session = req.getSession();
//
//	            session.setAttribute("loggedInUser", user);
//
//	            resp.sendRedirect("Restaurants");
//
//	        }
//	        else {
//
//	            System.out.println("Wrong Password");
//
//	            resp.sendRedirect("Login.html");
//	        }
//
//	    }
//	    else {
//
//	        System.out.println("User Not Found");
//
//	        resp.sendRedirect("Login.html");
//
//	    }
//
//	}
}
