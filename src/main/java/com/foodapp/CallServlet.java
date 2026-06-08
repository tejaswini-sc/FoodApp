package com.foodapp;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CallServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("Servlet Called");

        String name = req.getParameter("UserName");

        resp.setContentType("text/html");

        PrintWriter out = resp.getWriter();
        out.println("" + name + " this is your first JEE project</h6>");
    }
}