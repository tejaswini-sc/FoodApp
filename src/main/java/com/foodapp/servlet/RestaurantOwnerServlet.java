package com.foodapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.foodapp.daoimpl.UserDaoImp;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/restaurantOwners")
public class RestaurantOwnerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User admin = (User) session.getAttribute("user");

        if (admin == null || !"admin".equalsIgnoreCase(admin.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/Login.html");
            return;
        }

        String editUserId = req.getParameter("editUserId");

        if (editUserId != null && !editUserId.isEmpty()) {

            UserDaoImp userDao = new UserDaoImp();
            User owner = userDao.getUser(Integer.parseInt(editUserId));

            if (owner != null && "owner".equalsIgnoreCase(owner.getRole())) {
                req.setAttribute("editOwner", owner);
            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/restaurantOwners");
                return;
            }
        }

        UserDaoImp userDao = new UserDaoImp();
        List<User> allUsers = userDao.getAllUser();
        List<User> owners = new ArrayList<>();

        for (User u : allUsers) {
            if ("owner".equalsIgnoreCase(u.getRole())) {
                owners.add(u);
            }
        }

        req.setAttribute("owners", owners);

        RequestDispatcher rd = req.getRequestDispatcher("/RestaurantOwners.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User admin = (User) session.getAttribute("user");

        if (admin == null || !"admin".equalsIgnoreCase(admin.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/Login.html");
            return;
        }

        String action = req.getParameter("action");

        if ("add".equals(action)) {

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String address = req.getParameter("address");

            String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));
            User owner = new User(name, hashpw, email, address, "owner");

            UserDaoImp userDao = new UserDaoImp();
            userDao.addUser(owner);

        } else if ("update".equals(action)) {

            int userId = Integer.parseInt(req.getParameter("userId"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String address = req.getParameter("address");
            String password = req.getParameter("password");

            UserDaoImp userDao = new UserDaoImp();
            User existing = userDao.getUser(userId);

            if (existing != null) {

                existing.setUserName(name);
                existing.setEmail(email);
                existing.setAddress(address);

                if (password != null && !password.trim().isEmpty()) {
                    existing.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
                }

                userDao.updateUser(existing);
            }

        } else if ("delete".equals(action)) {

            int userId = Integer.parseInt(req.getParameter("userId"));

            UserDaoImp userDao = new UserDaoImp();
            userDao.deleteUser(userId);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/restaurantOwners");
    }
}
