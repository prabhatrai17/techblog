/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author prabhatrai
 */
public class Helper {
    public static boolean deletefile(String path,String fileName){
        boolean f=false;
        
        try{
            System.out.println("inside delete method");
            System.out.println("old path recieved: "+path);
            System.out.println("fileName: "+fileName);
            System.out.println(fileName.equals("default.jpg"));
            //System.out.println(fileName.endsWith("default.jpg"));
            if(!fileName.equals("default.jpg")){
            File file= new File(path);
            f=file.delete();
            
            }
            System.out.println("file deleted?: "+f);
          
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return f;
    }
    //path - where file will be saved
    //input stream - input file path
    public static boolean savefile(InputStream is,String path){
        System.out.println("inside save method");
        boolean res=false;
        try{
//            File filSaveDir= new File(path);
//            if(!filSaveDir.exists()){
//            filSaveDir.mkdir();
//            }
//            for (Part part : request.getParts()) {
//            String fileName = extractFileName(part);
//            // refines the fileName in case it is an absolute path
//            fileName = new File(fileName).getName();
//            part.write(savePath + File.separator + fileName);
        //}
               System.out.println("new path recieved: "+path);
                  System.out.println("is: "+is);
            byte b[]=new byte[is.available()];
            is.read(b);
            
            FileOutputStream fo= new FileOutputStream(path);
            fo.write(b);
            fo.flush();
            fo.close();
            res=true;
//            File file= new File(path);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return res;
    }
    
}
