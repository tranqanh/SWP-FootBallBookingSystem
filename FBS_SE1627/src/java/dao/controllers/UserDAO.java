/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.controllers;

import dto.controllers.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author chien
 */
public class UserDAO {

    private static final String LOGIN = "SELECT UserID,RoleID,UserName,UserPassword,Phone,Email,Address,Point FROM UserTable WHERE UserID = ? AND UserPassword = ? AND STATUS = 1";
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                //code
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("RoleID");
                    String fullName = rs.getString("UserName");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("Email");
                    String adress = rs.getString("Address");
                    double point = rs.getDouble("Point");
                    
                    user = new UserDTO(userID, roleID, fullName, "", phone, email, adress,point);
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
    
    private static final String REGISTER = "INSERT INTO UserTable(UserID,RoleID,UserPassword,Phone,Email,Status) VALUES(?,'US',?,?,?,1)";
    public boolean RegisterUser (UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REGISTER);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getUserPassword());
                ptm.setString(3, user.getPhone());
                ptm.setString(4, user.geteMail());

                
                check = ptm.executeUpdate() > 0 ? true : false;
                
            }
        }finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
    
    private static final String PASSWORDCHANGE = "Update UserTable SET USERPASSWORD = ? WHERE UserID=?";
    public boolean changePassword(String userID, String newPasssword) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(PASSWORDCHANGE);
                ptm.setString(1, newPasssword);
                ptm.setString(2, userID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
    
    private static final String EMAILCHECK = "SELECT UserID FROM UserTable WHERE EMAIL = ? AND Status = 1";
    public String chekEmail(String email) throws SQLException {
        String userID = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                //code
                ptm = conn.prepareStatement(EMAILCHECK);
                ptm.setString(1, email);
                ptm.executeQuery();
                rs = ptm.executeQuery();
                if (rs.next()) {
                    userID = rs.getString("UserID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userID;
    }
}
