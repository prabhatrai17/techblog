<%-- 
    Document   : index
    Created on : 02-Jan-2023, 12:53:30 pm
    Author     : prabhatrai
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage='errorPage.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: white;
            }
            .navbar{
                background: #03DAC6;
            }
            .jumbotron-fluid{
                background: #03DAC6;
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 80% 90%, 50% 100%, 20% 90%, 0% 70%, 0% 35%, 0 0);
                padding-bottom: 110px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="jumbotron-fluid">
            <h1 class="display-4">Welcome</h1>
            <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
            <hr class="my-4">
            <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="signup.jsp" role="button">Register</a>
            </p>
             <p class="lead">
                <a class="btn btn-primary btn-lg" href="login.jsp" role="button">Login</a>
            </p>
        </div>
        <div>
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="js/myjavascript.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                //alert("loaded");
            })
        </script>
    </body>
</html>
