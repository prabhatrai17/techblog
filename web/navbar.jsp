<%-- 
    Document   : navbar
    Created on : 30-Dec-2022, 12:26:04 pm
    Author     : prabhatrai
--%>

<%@page import="java.net.http.HttpRequest"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage='errorPage.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
        
        

       
    </head>
    <body>
    
     
        <nav class="navbar sticky-top navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ">
        <li class="nav-item ">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Explore</a>
        </li>
      
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            More
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Contact</a></li>
            <li><a class="dropdown-item" href="#">about</a></li>
            <li><a class="dropdown-item" href="#">Terms</a></li>
          </ul>
        </li>
        <li class="nav-item"><a href="login.jsp" class="nav-link btn btn-info mx-2  ">Login</a></li>
        <li class="nav-item "><a href="signup.jsp" class="nav-link btn btn-info mx-2">Signup</a></li>
<!--        <li class="nav-item "><a href="login.jsp" class="nav-link btn btn-secondary mx-2 mr-right">Logout</a></li>-->
      </ul>
    </div>
  </div>
</nav>
        <script>  </script>
    </body>
</html>
