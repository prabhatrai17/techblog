/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author prabhatrai
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String about = request.getParameter("about");
            Part part = request.getPart("profile");
            String imgName = part.getSubmittedFileName();
            System.out.println("new submitted img name: "+imgName);

            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentuser");
            // out.println(fname+lname+email+about);
            //User user= new User();
            System.out.println("seesion user is "+ user);
            user.setFirstName(fname);
            user.setLastName(lname);
            user.setEmail(email);
            user.setAbout(about);
            String oldImgName=user.getProfile();
            System.out.println("old img name: "+oldImgName);
            if(!imgName.equals("") || !imgName.isEmpty())
            user.setProfile(imgName);
            
            boolean res;
            try {
                res = userDao.updateUser(user);
                if (res == true) {
//                    //-----------------------------------------------------------------------------
//                    // gets absolute path of the web application
//                    String appPath = request.getServletContext().getRealPath("/");
//                    // constructs path of the directory to save uploaded file
//                    String savePath = appPath + File.separator + "image";
//
//                    // creates the save directory if it does not exists
//                    File fileSaveDir = new File(savePath);
//                    if (!fileSaveDir.exists()) {
//                        fileSaveDir.mkdir();
//                    }
//
//                    for (Part part1 : request.getParts()) {
//                        String fileName = part1.getSubmittedFileName();
//                        // refines the fileName in case it is an absolute path
//                        fileName = new File(fileName).getName();
//                        part.write(savePath + File.separator + fileName);
//                    }
                    //request.setAttribute("message", "Upload has been done successfully!");
//        getServletContext().getRequestDispatcher("/message.jsp").forward(
//                request, response);
                //    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --- //                out.println("<h1>successfully updated</h1>");
//                                            String newpath=request.getRealPath("/")+"image"+File.separator;
//                                            String oldpath=request.getRealPath("/")+"image"+File.separator;
//                                            out.println("old path "+oldpath);
//                                            out.println("new path "+newpath);
                                           // call delete and save profile file helper methods
                                           if(!(imgName.isEmpty()) ||!(imgName.equals(""))){
                                                String newpath=request.getRealPath("/")+"image"+File.separator+user.getProfile();
                                                String oldpath=request.getRealPath("/")+"image"+File.separator+oldImgName;
                                            out.println("deleted?: "+Helper.deletefile(oldpath,oldImgName));
                                                if(Helper.savefile(part.getInputStream(), newpath)){
                                                //part.write(newpath);//to write file 
                                                out.println("profile image update/save");
                                            }
                                            else{
                                                out.println("profile image not update/save");
                                            }
                                           }
                                        
                             Message m= new Message("Profile updated successfully","success","text-success");
                             HttpSession s=request.getSession();
                             s.setAttribute("updateMsg",m);
                            response.sendRedirect("home.jsp");
                             //session.removeAttribute("currentuser");
                } 
                else {
                     session.removeAttribute("currentuser");
                     Message m= new Message("Profile update unsuccessfully","fail","text-danger");
                   
                             HttpSession s=request.getSession();
                             s.setAttribute("updateMsg",m);
                     response.sendRedirect("home.jsp");
                    //out.println("<h1>update unsuccessfull  </h1>");
                }
               
            } catch (SQLException ex) {
                Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
