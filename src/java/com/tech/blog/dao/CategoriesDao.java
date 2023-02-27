/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author prabhatrai
 */
public class CategoriesDao {
    Connection con;
    public CategoriesDao(Connection c){
        this.con=c;
    }
    public ResultSet getCategories() throws SQLException{
        ArrayList<String> cname= new ArrayList<String>();
        System.out.println("in get categories");
        String query="select * from categories";
        PreparedStatement ps=con.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        System.out.println("rs id ");
        //System.out.println(rs.getInt("cid"));
       // while(rs.next()){
//            System.out.println(rs.getInt("cid"));
//            System.out.println(rs.getString("name"));
//            cname.add(rs.getString("name"));
//        }
        return rs;
    }
    
    
    
}
