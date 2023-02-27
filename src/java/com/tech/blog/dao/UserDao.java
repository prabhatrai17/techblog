/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.mysql.cj.protocol.Resultset;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author prabhatrai
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //execute query to db
    //after creating user object by using property from frontend in register servlet
    //here do only query execution
    public boolean saveUser(User user) {
        boolean result = false;
        try {

            //Connection con=ConnectionProvider.getConnection();
            String query = "insert into user(firstname,lastname,email,password,gender,accept,category,about,profile,time) values(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAccept());
            ps.setString(7, user.getCategory());
            ps.setString(8, user.getAbout());
            ps.setString(9, user.getProfile());
            ps.setString(10, user.getTime());
            //con.prepareStatement(sql);
            ps.executeUpdate();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public User getUserByEmailPass(String email, String password) {
        boolean res = false;
        User user = new User();
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet set = ps.executeQuery();
            System.out.println("result set got after query");
            //  System.out.println(set);
            //System.out.println(set.next());
            //System.out.println("is true? ");
            //System.out.println(set.next());
            if (set.next()) {
                System.out.println("after result true");

                res = true;
                System.out.println(set.getRow());

                System.out.println(set.getString("email"));
                System.out.println(set.getString("password"));
                System.out.println(set.getString("firstname"));
                System.out.println(set.getString("gender"));
//            user.setEmail(set.next());
                user.setId(set.getInt("id"));
                user.setFirstName(set.getString("firstname"));
                user.setLastName(set.getString("lastname"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAccept(set.getString("accept"));
                user.setCategory(set.getString("category"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));
                user.setTime(set.getString("time"));

                System.out.println(user);
            } else {

                System.out.println("after result set false");
                System.out.println("no result fetched");
                System.out.println(set.next());
                user = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean updated = false;
        try {
            String query = "update user set firstname=?, lastname=?, email=?, about=?,profile=? where id=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAbout());
            ps.setString(5, user.getProfile());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
            updated = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

}
