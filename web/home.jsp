<%-- 
    Document   : home
    Created on : 03-Jan-2023, 12:44:18 pm
    Author     : prabhatrai
--%>


<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.CategoriesDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .navbar{
                background: #03DAC6;
            }
            .jt{
                /*                                background: #03DAC6;*/
                /*                                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 80% 90%, 50% 100%, 20% 90%, 0% 70%, 0% 35%, 0 0);*/
                padding-bottom: 110px;
                
            }
            .card{
                padding: 5px;
                margin: 5px;
            }
            .row{
                padding: 10px;
            }
            body{
                background: white;
            }
            #profile-img{

            }

        </style>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <!--  ===============================================scripts to load start===========================================================-->
        <%//for getting current user
            User cuser = (User) session.getAttribute("currentuser");
            String fname = "";

            if (cuser != null) {
                fname = cuser.getFirstName();
                System.out.println("logged in user");
                System.out.println(cuser);

                //for profile updated successfully check -> remake it with ajax call without url change
                Message ms = (Message) session.getAttribute("updateMsg");

                if (ms != null) {

                    if (ms.getType() == "success") {
        %>
        <script>
            //for profile successfully msg
            console.log("profile update  ");
            Swal.fire({
                icon: 'success',
                title: 'Profile Update successfull',
                text: 'changes applied',
                footer: 'view it now'
            });
        </script>
        <%
            }
            if (ms.getType() == "fail") {
        %>
        <script>
            //for profile fail msg
            console.log("profile update  ");
            Swal.fire({
                icon: 'error',
                title: 'Profile Update unsuccessfull',
                text: 'changes coundnt applied',
                footer: 'try again'
            });
        </script>
        <%
                }
                session.removeAttribute("updateMsg");
            }

            //for checking new post saved -> remake it with ajax call without url change
            Message m = (Message) session.getAttribute("post");
            if (m != null) {
                if (m.getType() == "success") {


        %>
        <script>
            //for profile successfully msg
            console.log("post created successfuly  ");
            Swal.fire({
                icon: 'success',
                title: 'post creation successfull',
                text: 'thanks for contribution',
                footer: 'view it now'
            });
        </script>
        <%                session.removeAttribute("post");
            }
            if (m.getType() == "fail") {
        %>
        <script>
            //for profile fail msg
            console.log("post creation unsuccessfull  ");
            Swal.fire({
                icon: 'error',
                title: 'post creation unsuccessfull',
                text: 'coundnt saved your post',
                footer: 'try again'
            });
        </script>
        <%
                }
                session.removeAttribute("post");
            }


        %>
        <!--  ===============================================scripts to load ends===========================================================-->
        <%-- -------------------------------- NAV STARTS ----------------------------------------------------%>
        <nav class="navbar sticky-top navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Tech Blog</a>
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

                        <!--       LOGOUT BUTTON AND PROFILE BUTTON-->
                        <!--                        PROFILE-->

                        <li class="nav-item "><a href="" class="nav-link" data-bs-toggle="modal" data-bs-target="#profileModal"><i class='fa fa-user fa-lg px-1'></i><%=fname%></a></li>        
                        <!--                        LOGOUT-->
                        <li class="nav-item  "><a href="logout" class="nav-link btn btn-light">Logout</a></li>

                        <%} else {
                                System.out.println("no user logged in");
                                response.sendRedirect("login.jsp");
                            }
                        %>
                    </ul>
                </div>
            </div>
        </nav>
        <!--------------------------------------------------  NAVBAR ENDS------------------------------------------>
        <!--        //fetching categories from db-->
        <%
            System.out.println("loading categories");
            CategoriesDao cd = new CategoriesDao(ConnectionProvider.getConnection());
            ResultSet rs = cd.getCategories();
            ResultSet rsForSideBar=cd.getCategories();
            //ArrayList<String> catName = new ArrayList<String>();
//            while (rs.next()) {
//                catName.add(rs.getString("name"));
//                System.out.println(rs.getString("name"));
//            }
%>

        <!------------------------------------------------- Modal for profile window  ----------------------------->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Your Profile</h5>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body profile-info-body ">
                        <div class="text-center mb-2 rounded-circle mx-auto d-block col-sm-6 offset-3 border ">
                            <img id="profile-img" src="image/<%= cuser.getProfile()%>" alt="avatar" class="img-fluid rounded-circle">
                        </div>
                        <table class="table table-borderless">

                            <tbody class="">
                                <tr>
                                    <th scope="row">Id</th>
                                    <td><%=cuser.getId()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Name</th>
                                    <td >
                                        <%=cuser.getFirstName()%> <%=cuser.getLastName()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%=cuser.getEmail()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td><%=cuser.getGender()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Category</th>
                                    <td><%=cuser.getCategory()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">About</th>
                                    <td><%=cuser.getAbout()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Time</th>
                                    <td><%=cuser.getTime()%></td>


                                </tr>
                            </tbody>
                        </table>


                    </div> 
                    <!--               ---------------------------- profile info body ends here----------------------------->

                    <div class="modal-body profile-edit-body" style="display:none">
                        <div class="container text-center"> <h2>Edit your detail</h2></div>
                        <div class="text-center mb-2 rounded-circle mx-auto d-block col-sm-6 offset-3 border ">
                            <img src="image/<%= cuser.getProfile()%>" alt="avatar" class="img-fluid rounded-circle">
                        </div>
                        <!--     ----------------------------  profile edit form start here-->
                        <form action="Edit" method="post" enctype="multipart/form-data">
                            <table class="table table-borderless">

                                <tbody class="">
                                    <tr>
                                        <th scope="row">Id</th>
                                        <td><%=cuser.getId()%></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">First Name</th>
                                        <td >
                                            <input type="text" class="form-control" value="<%=cuser.getFirstName()%>" name="fname">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Last Name</th>
                                        <td><input type="text" class="form-control" value="<%=cuser.getLastName()%>" name="lname"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><input type="text" class="form-control" value="<%=cuser.getEmail()%>" name="email"></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%=cuser.getGender()%></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">Category</th>
                                        <td><%=cuser.getCategory()%></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">About</th>
                                        <td><textarea class="form-control" value="<%=cuser.getAbout()%>" name="about"><%=cuser.getAbout()%></textarea></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">Time</th>
                                        <td><%=cuser.getTime()%></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">current profile img</th>
                                        <td><%=cuser.getProfile()%></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">Upload new profile</th>
                                        <td><input type="file" value="choose new pic" name="profile"></td>


                                    </tr>
                                </tbody>
                            </table>
                            <div class="row">
                                <input class="btn btn-success col-md-3 offset-3" type="submit" value="Save">
                                <button id="cancelbtn" type="button" class=" col-md-3 offset-1 btn btn-secondary">cancel</button>
                            </div>
                        </form>


                    </div>
                    <!--   ----------------------------  profile edit body ends here-->

                    <div id="modelfoot" class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="editbtn" type="button" class="btn btn-primary">Edit</button>
                    </div>

                </div>
            </div>
        </div>
        <!--   ----------------------------  profile model window ends here ---------------------------------------->


        <!------------------------------------------ new post model starts -------------------------------------------->

        <div class="modal fade" id="newPostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create Post</h5>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body new-post-body" style="display:">
                        <div class="container text-center"> <h2>Enter your post detail</h2></div>
                        <!--                        <div class="text-center mb-2 rounded-circle mx-auto d-block col-sm-6 offset-3 border ">
                                                    <img src="image/<%= cuser.getProfile()%>" alt="avatar" class="img-fluid rounded-circle">
                                                </div>-->
                        <!--     ----------------------------  post form start here-->
                        <form action="newPostServlet" method="post" >
                            <table class="table table-borderless">

                                <tbody class="">
                                    <tr>
                                        <th scope="row">Title</th>
                                        <td><input class="form-control" type="text" name="title"></td>



                                    </tr>
                                    <tr>
                                        <th scope="row">Description</th>
                                        <td >
                                            <textarea class="form-control" name="desc"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Code</th>
                                        <td>  <textarea class="form-control" name="code"></textarea></td>

                                    </tr>

                                    <tr>
                                        <th scope="row"> Category</th>
                                        <td> <select class="form-control" name="cat">
                                                <%
                                                    System.out.println("inside while to create option of new post");

                                                    while (rs.next()) {

                                                        String ss = rs.getString("name");
                                                        int cid = rs.getInt("cid");
                                                %>
                                                <option value="<%=cid%>"> <%=ss%></option>
                                                <%

                                                    }
                                                    System.out.println("outside while to create option of new post");
                                                %>

                                            </select> </td>

                                    </tr>
                                </tbody>
                            </table>
                            <div class="row">
                                <input class="btn btn-success col-md-3 offset-3" type="submit" value="Post">
                                <button id="cancelbtn" type="button" class=" col-md-3 offset-1 btn btn-secondary" data-bs-dismiss="modal">cancel</button>
                            </div>
                        </form>


                    </div>
                    <!--   ----------------------------  new post body ends here-->

                    <!--                    <div id="modelfoot" class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button id="editbtn" type="button" class="btn btn-primary">Edit</button>
                                        </div>-->

                </div>
            </div>
        </div>

        <!----------------------------------------- new post model ends here -------------------------------------------->


        <!-- ==================================== HOME PAGE MAIN CONTENTS STARTS================================ -->
        <div class="jt">
            <div class="text-center">
            <h1 class="display-4">Home page</h1>
            <p class="lead">Explore the blogs below</p>
            <hr class="my-2">
            </div>
            <!--            container for cards-->
            <div class="container ">
                <div class="row offset-md-2 text-center ">
                    <div class="col-md-4"><h5>Welcome back, <%=cuser.getFirstName()%></h5></div>
                    <div class="col-md-4"><a  class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#newPostModal" >New Post</a></div>
                </div>
                <hr class="my-2">
                <div class="row">
                    <!--                    for category list-->
                    <div class="col-lg-2">
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%
                                System.out.println("fetching categories to show in side bar");
                                 //System.out.println(rsForSideBar.next());
                                while (rsForSideBar.next()) {

                                    String ss = rsForSideBar.getString("name");
                                    int cid = rsForSideBar.getInt("cid");
                                    System.out.println(ss);
                            %>
<!--                            <option value="<%=cid%>"> <%=ss%></option>-->
                            <a href="#" class="list-group-item list-group-item-action" onclick="getPosts(<%=cid%>)"><%=ss%></a>
                            <%

                                }
                                System.out.println("outside while of sidebar");
                            %>
                           
                        </div>

                    </div>
                    <!--         div        for cards grids-->
                    <div class="col-lg-10">
                        
                         <div class="row offset-lg-1" id="loader">
                             
                                 <div class="text-center">
                                     <i class="fa fa-refresh fa-4x fa-spin"></i>
                                     <h3>Loading...</h3>
                                 </div>
                                 
                            
                         </div>
                        <div class="row offset-lg-1" id="postContainer">
<!--                            div for embedding data from posts jsp page-->
                            
                            
<!--                            <div class="card col-lg-5 ">
                                <div class="card-body">
                                    <h5 class="card-title">Java</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">by Prabhat</h6>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="#" class="card-link">Learn more</a>
                                    <a href="#" class="card-link">Bookmark</a>
                                </div>
                            </div>
                            <div class="card col-lg-5 " >
                                <div class="card-body">
                                    <h5 class="card-title">Python</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">by Prabhat</h6>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="#" class="card-link">Learn more</a>
                                    <a href="#" class="card-link">Bookmark</a>
                                </div>
                            </div>-->
                            
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--=======================================HOME PAGE MAIN CONTENTS ENDS==================================================================-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="js/myjavascript.js" type="text/javascript"></script>
        <!--        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>-->

        <script>
               function getPosts(catId){
                $.ajax({
                    url:"posts.jsp",
                    data:{cid:catId},
                    success:function(data,textStatus,jqXHR){
                        console.log(data);
                        $('#loader').hide();
                        $("#postContainer").html(data);
                    }
                })
            }
            $(document).ready(function (e) {
                
                getPosts(0);
                //
                //$('#loader').hide();
             
                //alert("loaded");
                // $('#editform').hide();
//                   Swal.fire({
//                                icon: 'success',
//                                title: 'Profile Update successfull',
//                                text: 'changes applied',
//                                footer: 'view it now'
//                            });


                let editStatus = false;
                $('#editbtn').on('click', function () {
                    console.log("clicked");

                    if (editStatus == false) {
                        $(".profile-info-body").hide();
                        $(".profile-edit-body").show();
                        $(".close").hide();
                        editStatus = true;
                        $("#modelfoot").hide();

                    }


//                   if($('#editform').show()===true) $('#editform').hide();
//                   else $('#editform').show();
                });
                $('#cancelbtn').on('click', function () {
                    {
                        $(".profile-info-body").show();
                        $(".profile-edit-body").hide();
                        editStatus = false;
                        $("#modelfoot").show();
                    }
                });

                //console.log("clicked");
                //$('#editform').show();

            });
        </script>
    </body>
</html>

