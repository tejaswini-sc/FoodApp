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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
		@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			String userName = req.getParameter("userName");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String address = req.getParameter("address");
			String role = req.getParameter("role");
			
			String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));
			User user = new User(userName, hashpw, email, address, role);
			UserDaoImp userDaoImp = new UserDaoImp();
			int res = userDaoImp.addUser(user);
			
			if(res==1) {
				resp.sendRedirect("Login.html");
			}
			else {
				resp.sendRedirect("Register.html");
			}
	}
}
