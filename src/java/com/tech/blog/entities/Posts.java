/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author prabhatrai
 */
public class Posts {
    private int pid;
    private String title;
    private String description;
    private String code;
    private int userid;
    private int cid;
    private String time;

    public Posts(int pid, String title, String description, String code, int userid, int cid, String time) {
        this.pid = pid;
        this.title = title;
        this.description = description;
        this.code = code;
        this.userid = userid;
        this.cid = cid;
        this.time = time;
    }

    public Posts(String title, String description, String code, int userid, int cid, String time) {
        this.title = title;
        this.description = description;
        this.code = code;
        this.userid = userid;
        this.cid = cid;
        this.time = time;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Posts{" + "pid=" + pid + ", title=" + title + ", description=" + description + ", code=" + code + ", userid=" + userid + ", cid=" + cid + ", time=" + time + '}';
    }
    
    
}
