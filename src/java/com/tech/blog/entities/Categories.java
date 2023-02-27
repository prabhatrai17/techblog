/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author prabhatrai
 */
public class Categories {
    private int cid;
    private String name;
    private String description;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Categories(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public Categories(int cid, String name, String description) {
        this.cid = cid;
        this.name = name;
        this.description = description;
    }

    @Override
    public String toString() {
        return "Categories{" + "cid=" + cid + ", name=" + name + ", description=" + description + '}';
    }
    
}

