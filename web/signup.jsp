<%-- 
    Document   : signup
    Created on : 02-Jan-2023, 1:12:13 pm
    Author     : prabhatrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage='errorPage.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            .col-form-label{
                /*                padding-left: 50px;*/

            }
            .row{
                padding: 10px;
            }


        </style>
    </head>
    <body>
              <% 
    User cuser=(User)session.getAttribute("currentuser");
        
        
        if(cuser!=null){ 
System.out.println("logged in user");
System.out.println(cuser);
response.sendRedirect("home.jsp");}

%>
        <%@include file="navbar.jsp" %>
        <div class="jumbotron-fluid">
            <h1 class="display-4">Kindly Register</h1>
            <p class="lead">enter your detail</p>
            <hr class="my-4">

            <!--            signup form-->
            <div class="container">
                <div class="card col-md-8 offset-2 p-3 ">
                    <form id="registerform" action="register" method="post">
                        <div class="form-group row">
                            <div class=" row col-md-5 offset-1 ">
                                <label  class="col-sm-4">First Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control  " id="fname" placeholder="First Name" name="fname" required>
                                </div>
                            </div>
                            <div class="row col-md-6">
                                <label  class="col-sm-4 col-form-label">Last Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="lname" placeholder="Last Name" name="lname" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label  class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="email" placeholder="Email" name="email" value="" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-3 col-form-label">  Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password" required>
                            </div>
                        </div>
                        <fieldset class="form-group">
                            <div class="row">
                                <legend class="col-form-label col-sm-3 pt-0">Gender</legend>
                                <div class="col-sm-9 row">
                                    <div class="col">
                                        <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="male" checked>
                                        <label class="form-check-label" for="gridRadios1">
                                            Male
                                        </label>
                                    </div>
                                    <div class="col">
                                        <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="female">
                                        <label class="form-check-label" for="gridRadios2">
                                            Female
                                        </label>
                                    </div>

                                </div>
                            </div>
                        </fieldset>
                        <row class="row">
                        <div class=" col-md-3 my-4">
                            Category
                        </div>
                        <div class="row col-md-9">
                            <select name="cat" class="form-select " aria-label="Default select example">
                                <option  disabled>Category</option>
                                <option selected value="java">Java</option>
                                <option value="python">Python</option>
                                <option value="js">JavaScript</option>
                            </select>
                        </div>
                        </row>
                        <div class="form-group row">
                            <label for="inputAbout" class="col-sm-3 col-form-label">  About</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" id="inputAbout" placeholder="Describe Yourself like your tech" name="about" required> </textarea>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="inputFile" class="col-sm-3 col-form-label">  Profile Photo</label>
                            <div class="col-sm-9">
                                <input type="file" class="form-control" id="inputFile" placeholder="Select file" name="profile" >
                            </div>
                        </div>
                        
                        <div class="form-group row">

                            <div class="col">

                                <input class="form-check-input" type="checkbox" id="gridCheck1" name="tc">
                                <label class="form-check-label" for="gridCheck1">
                                    Accept Term & Condition
                                </label>

                            </div>
                        </div>
                        <div id="load" style="display:none">

                            <i class="fa fa-circle-o-notch fa-spin" style="font-size:24px;"></i>
                            <!--                           <span>Loading...</span>-->
                        </div>
                        <div id="msg">

                        </div>
                        <div id="button" class="form-group row">
                            <div class="col">
                                <button type="submit" class="btn btn-primary">Sign up</button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="js/myjavascript.js" type="text/javascript"></script>
        
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            $(document).ready(function () {
                console.log("jquery ready fn");
                $('#load').hide();
                //$('#msg').hide();

                $('#registerform').on('submit', function (event) {
                    console.log("form submit function");
                    event.preventDefault();
                    // var formData=$(this).serialize();
                    // console.log(formData);

                    let form = new FormData(this);
                    console.log(form);
                    $('#load').show();
                    $('#msg').html("<p>Loading...</p>");
                    $('#button').hide();
                    $.ajax({
                        url: "register",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log("data recieved below");
                            console.log(data);
                            if(data.trim() === "saved"){
                            console.log("user saved success");
                            $('#load').hide();
                            $('#msg').text("User Successfully regiseted");
                            $('#msg').addClass("text-success");
                            $('#button').show();
                            
                            Swal.fire({
                                icon: 'success',
                                title: 'Registration successfull',
                                text: 'Thank you',
                                footer: '<a href="login.jsp">You can now login</a>'
                            })
                            $('#registerform')[0].reset();
                            //window.location.href="login.jsp";
                            
                        }
                         else if(data.trim()==="noemail"){
                            $('#load').hide();
                            $('#msg').addClass("text-danger");
                            $('#msg').text("Email Required ");
                            
                            $('#button').show();
                        }
                        else if(data.trim()==="not"){
                            $('#load').hide();
                            $('#msg').addClass("text-danger");
                            $('#msg').text("Accept Term and Condition  ");
                            
                            $('#button').show();
                        }
                        else{
                            swal.fire({icon: 'error',
                                title:'Error occured at backend',
                            text:'try again'});
                             $('#load').hide();
                            $('#msg').text("error occured, try again");
                            $('#button').show();
                        }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            console.log("user saved fail");
                            $('#load').hide();
                            $('#msg').text("error occured, try again");
                            $('#button').show();
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Something went wrong! during submition',
                                footer: '<a href="signup">try again</a>'
                            })
                        },
                        processData: false,
                        contentType: false
                    })
                            //window.location.href="login.jsp";

                });

            });


        </script>
    </body>
</html>
