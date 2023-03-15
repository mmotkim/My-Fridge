/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class User {

    private int id;
    private int roleId;
    private String email;
    private String password;
    private String name;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public User(int id, int roleId, String email, String password, String name) {
        this.id = id;
        this.roleId = roleId;
        this.email = email;
        this.password = password;
        this.name = name;
    }

    public User(int roleId, String email, String password, String name) {
        this.roleId = roleId;
        this.email = email;
        this.password = password;
        this.name = name;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
