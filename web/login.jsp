<%-- 
    Document   : login
    Created on : 03-Jan-2023, 12:38:32 pm
    Author     : prabhatrai
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage='errorPage.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login up Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <style>
            .navbar{
                background: #03DAC6;
            }
            .jumbotron-fluid{
                background: #03DAC6;
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 80% 90%, 50% 100%, 20% 90%, 0% 70%, 0% 35%, 0 0);
                padding-bottom: 110px;
                text-align: center;
            }
            .card{

            }
            .row{
                padding: 10px;
            }


        </style>
    </head>
    <body>
        <%
            User cuser = (User) session.getAttribute("currentuser");

            if (cuser != null) {
                System.out.println("logged in user");
                System.out.println(cuser);
                response.sendRedirect("home.jsp");
            }

        %>
        <%@include file="navbar.jsp" %>
        <div class="jumbotron-fluid">
            <h1 class="display-4">Login</h1>
            <p class="lead">enter your detail</p>
            <hr class="my-4">

            <!--            login form-->
           
            <div class="card col-md-6 offset-3 p-5 ">
                 <div class="container">
                <%                    Message msg = (Message) session.getAttribute("msg");
                    
                    if (msg != null) {
//                    out.println(msg);
                %>
                <div class="alert <%=msg.getCssClass()%>" role="alert">
                    <%
                           out.println(msg.getMsg()); 
                        session.removeAttribute("msg");
                    %>
                </div>
                <% } %>

            </div>
                <!--        form below-->
                <form action="login" method="POST">   
                    <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <input name="email" required type="email" class="form-control" id="inputEmail3" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-3 col-form-label">Password</label>
                        <div class="col-sm-9">
                            <input name="password" required type="password" class="form-control" id="inputPassword3" placeholder="Password">
                        </div>
                    </div>


                    <div class="form-group row">
                        <div class="col">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </div>
                </form>
            </div>
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
