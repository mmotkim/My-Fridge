/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.Roles;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    private MD5 md5 = new MD5();

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from [User]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(2));
                list.add(new User(rs.getInt(1), r ,rs.getString(3), rs.getString(4), rs.getString(5)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserById(int id) {
        String sql = "select * from [Users] where [userId]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(2));
                User u = new User(rs.getInt(1), r ,rs.getString(3), rs.getString(4), rs.getString(5));
                return u;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByEmail(String email) {
        String sql = "select * from [User] where email= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(2));
                User u = new User(rs.getInt(1), r ,rs.getString(3), rs.getString(4), rs.getString(5));
                return u;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUser(String name, String email, String pass) {
        String sql = "  insert into [User] ([roleId],[email],[password],[name])\n"
                + "  values (1,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, md5.getMd5(pass));
            ps.setString(3, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateUser(String name, String email, int userid) {
        String sql = " update [User] set [name]=? ,[email] =? where [user_id] =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setInt(3, userid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getNumberUser() {
        String sql = "  select count(*)from  User";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void changePassword(String uid, String pass) {
        String sql = " update [User] set [password]=? where [userId] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, md5.getMd5(pass));
            stm.setString(2, uid);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }
      public void deleteuser(int uid ) {
        String sql = " delete [Users_HE163397] where [user_id] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }
      public static void main(String[] args) {
        UserDAO u = new UserDAO(); 
        ArrayList<User> list = u.getAllUser();
          for (User user : list) {
              System.out.println(user.getId() + user.getEmail() + user.getPassword());
          }
    }
}
