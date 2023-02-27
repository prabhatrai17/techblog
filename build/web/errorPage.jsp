<%-- 
    Document   : errorPage
    Created on : 06-Jan-2023, 12:40:40 pm
    Author     : prabhatrai
--%>

<%@page import="java.lang.Exception"%>
<%@page  contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    
        <style>
            #img{
                width:30%;
                
            }
        </style>
    </head>
    <body>
        
        <div class="container text-center">
            <img id="img" src="image/error.png" alt="error image" class="img img-fluid m-5 " style="max-width:50%;" >
            <h1 class="display-4">unexpected error occurred </h1>
            <div><%= exception %> </div>
            <a class="btn btn-primary btn-lg" href="home.jsp">Home</a>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
