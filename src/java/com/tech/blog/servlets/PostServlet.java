/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.CategoriesDao;
import com.tech.blog.dao.PostsDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prabhatrai
 */
public class PostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("new post servlet called after button clicked");
            System.out.println("new post servlet called after button clicked");
//            CategoriesDao cd= new  CategoriesDao(ConnectionProvider.getConnection());

//            cd.getCategories();
            //out.println("<h1>Servlet PostServlet at " + request.getContextPath() + "</h1>");
            String title = request.getParameter("title");
            String desc = request.getParameter("desc");
            String code = request.getParameter("code");
            String category = request.getParameter("cat");
            System.out.println("category recived: ");
            System.out.println(category);
            category = category.trim();
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String postTime = now.format(format);

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentuser");
            //int uid=0
            //if(user!=null){
            System.out.println("current user fetched in post servlet: " + user);
            int uid = user.getId();
            int cid = Integer.parseInt(category);
            //}
            Posts newPost = new Posts(title, desc, code, uid, cid, postTime);
            System.out.println("post created in post servlet: " + newPost);
            PostsDao postDao = new PostsDao(ConnectionProvider.getConnection());
            boolean res = postDao.createPost(newPost);
            System.out.println("result after post created : " + res);
            if (res) {
                Message m= new Message("successfully created post","success","text-success");
                session.setAttribute("post", m);

                response.sendRedirect("home.jsp");
            } else {
                 Message m= new Message("post create unsuccessfull","fail","text-danger");
                //newPost = null;
                session.setAttribute("post", m);

                response.sendRedirect("home.jsp");

            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
