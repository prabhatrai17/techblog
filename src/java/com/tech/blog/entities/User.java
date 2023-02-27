/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author prabhatrai
 */
public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String gender;
    private String accept;
    private String category;
    private String about;
    private String profile;
    private String time;

    public User(int id, String firstName, String lastName, String email, String password, String gender, String accept, String category, String about, String profile, String time) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.accept = accept;
        this.category = category;
        this.about = about;
        this.profile = profile;
        this.time = time;
    }

    public User(String firstName, String lastName, String email, String password, String gender, String accept, String category, String about, String profile, String time) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.accept = accept;
        this.category = category;
        this.about = about;
        this.profile = profile;
        this.time = time;
    }

    

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAccept() {
        return accept;
    }

    public void setAccept(String accept) {
        this.accept = accept;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password=" + password + ", gender=" + gender + ", accept=" + accept + ", category=" + category + ", about=" + about + ", profile=" + profile + ", time=" + time + '}';
    }

     
}

