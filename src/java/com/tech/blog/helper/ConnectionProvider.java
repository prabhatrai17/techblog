
package com.tech.blog.helper;


import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        
        if(con==null){
        try{
        //loading driver 
        Class.forName("com.mysql.jdbc.Driver");
        //creating connection
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "1234554321");
        
       
        }
        catch(Exception e){
            e.printStackTrace();
    }
        }
         return con;
}
}
