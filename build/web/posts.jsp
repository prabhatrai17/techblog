<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.dao.PostsDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<!--this is post loading jsp page-->

<%
    PostsDao postDao = new PostsDao(ConnectionProvider.getConnection());
    
    int cid= Integer.parseInt(request.getParameter("cid"));
    List<Posts> posts=null;
    if(cid==0){
    posts=postDao.getAllPost();
    }
    else{
    posts=postDao.getAllPostsById(cid);
    }
    
    for (Posts p : posts) {
//out.println(p.getTitle());

%>
<div class="card col-lg-5 ">
    <div class="card-header">
        <h5 class="card-title"><%=p.getTitle()%></h5>
        <h6 class="card-subtitle mb-2 text-muted">from <%=p.getCid()%></h6>
    </div>
    <div class="card-body">

        <div><label class="text-muted small text-left">Description</label></div>
        
        <p class="card-text "><%=p.getDescription()%></p>
        <label class="text-muted small">Code</label>
        <p class="card-text"><%=p.getCode()%></p>



    </div>
    <div class="card-footer text-muted ">
        <div class="row">
        <p class="col small">By UserId: <%=p.getUserid()%></p>
        <p class="col small">Date: <%=p.getTime()%></p>
        </div>
    </div>
</div>
<%
    }
%>