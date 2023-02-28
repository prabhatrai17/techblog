/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Posts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author prabhatrai
 */
public class PostsDao {
    Connection con;
    public PostsDao(Connection c){
        this.con=c;
    }
    public boolean createPost(Posts post) throws SQLException{
        boolean created=false;
        String sql="insert into posts(title,description,code,userid,cid,time) values(?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, post.getTitle());
        ps.setString(2, post.getDescription());
        ps.setString(3, post.getCode());
        ps.setInt(4, post.getUserid());
        ps.setInt(5, post.getCid());
        ps.setString(6, post.getTime());
        
        int rs=ps.executeUpdate();
        System.out.println("result after post insert: "+rs);
        if(rs==1) created=true;
        return created;
    }
    
    public List<Posts> getAllPost() throws SQLException{
        List<Posts> allPost= new ArrayList<>();
        String q="select * from posts";
        PreparedStatement p=con.prepareStatement(q);
        ResultSet rs= p.executeQuery();
        
        while(rs.next()){
            int pid= rs.getInt("pid");
            String title=rs.getString("title");
            String desc=rs.getString("description");
            String code=rs.getString("code");
            int userid=rs.getInt("userid");
            int cid=rs.getInt("cid");
            String time=rs.getString("time");
            
            Posts post=new Posts(pid,title,desc,code,userid,cid,time);
            allPost.add(post);
        }
        
        return allPost;
    }
    
    public List<Posts> getAllPostsById(int c) throws SQLException{
        List<Posts> allPostsById= new ArrayList<>();
        String q="select * from posts where cid=?";
        
        PreparedStatement ps= con.prepareStatement(q);
        ps.setInt(1, c);
        
        ResultSet rs=ps.executeQuery();
        System.out.println("result after posts by id");
        
//        while(rs.next()){
//            System.out.println(rs.getInt("ptitle"));
//            System.out.println(rs.getInt("pid"));
//            System.out.println(rs.getInt("cid"));
//            
//        }
         while(rs.next()){
            int pid= rs.getInt("pid");
            System.out.println(pid);
            String title=rs.getString("title");
            String desc=rs.getString("description");
            String code=rs.getString("code");
            int userid=rs.getInt("userid");
            int cid=rs.getInt("cid");
            String time=rs.getString("time");
            
            Posts post=new Posts(pid,title,desc,code,userid,cid,time);
            allPostsById.add(post);
        }
        
        
        
        return allPostsById;
        
    }
    
    
}
