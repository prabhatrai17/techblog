/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prabhatrai
 */
public class LoginServlet extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
        res.setContentType("text/html");
        PrintWriter out= res.getWriter();
        String email=req.getParameter("email");
        email=email.trim();
        
        String password = req.getParameter("password");
        password=password.trim();
        
//        out.println(email);
//        out.println("<br>");
//        out.println(password);
        System.out.println("login servlet");
        UserDao userDao=new UserDao(ConnectionProvider.getConnection());
        System.out.println("got user or not result below  ");
//        System.out.println(userDao.getUserByEmailPass(email, password));
//        System.out.println(userDao.getUserByEmailPass(email, password)==null);
        User user=userDao.getUserByEmailPass(email, password);
        if(user!=null){
        out.println("<div> <h3>"+user+"</h3> </div>");
        HttpSession session= req.getSession(true);
        session.setAttribute("currentuser", user);
        res.sendRedirect("home.jsp");
        }
        else
        {
            Message m= new Message("Incorrect detail, Try Again","error","alert-danger");
            HttpSession s= req.getSession();
            s.setAttribute("msg", m);
            res.sendRedirect("login.jsp");
            out.println("<h1>incorrect info</h1>");
            out.println("<h2>try again</h2>");
        }
        
        
    }
    
}
