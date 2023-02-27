/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author prabhatrai
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException{
        
        res.setContentType("text/html");
        PrintWriter out=res.getWriter();
        
        String fname=req.getParameter("fname");
        String lname=req.getParameter("lname");
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        String gender=req.getParameter("gender");
        String cat=req.getParameter("cat");
        String accept=req.getParameter("tc");
        String about=req.getParameter("about");
//        String profile=req.getParameter("profile");
        Part part= req.getPart("profile");
        String profile=part.getSubmittedFileName();
        if(profile==null | profile.isEmpty() | profile=="" ) profile="default.jpg";
        
         LocalDateTime now=LocalDateTime.now();
         DateTimeFormatter format= DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
         String time=now.format(format);
        
        System.out.println(fname);
        System.out.println(lname);
        System.out.println(email);
        System.out.println(password);
        System.out.println(gender);
        System.out.println(cat);
        System.out.println(accept);
        System.out.println(about);
        System.out.println(profile);
        System.out.println(time);
        
        if(email==null | email=="") out.println("noemail");
        else if(accept!=null){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        User user = new User(fname,lname, email, password, gender, accept,cat,about,profile,time);
        UserDao userDao= new UserDao(ConnectionProvider.getConnection());
        if(userDao.saveUser(user)){
            out.println("saved");
            System.out.println("user saved");
           
        }
        else{
                        out.println("fail");
                        System.out.println(" couldn't save user");
        }
        
        }
        
        else{
            out.println("not");
        }
    }
}
