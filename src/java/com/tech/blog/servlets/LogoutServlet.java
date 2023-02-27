/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prabhatrai
 */
public class LogoutServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse res ) throws IOException{
        HttpSession session= req.getSession();
        User user=(User)session.getAttribute("currentuser");
        if(user!=null){
            session.removeAttribute("currentuser");
            
            Message m= new Message("Logout Successfully","success","alert-success");
            HttpSession s= req.getSession();
            s.setAttribute("msg", m);
            res.sendRedirect("login.jsp");
        }
        else{
            res.sendRedirect("login.jsp");
        }
    }
}
