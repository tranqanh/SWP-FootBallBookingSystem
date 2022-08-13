/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto.controllers;

/**
 *
 * @author chien
 */
public class UserDTO {
    //dai dien cho ban user (dac ten giong ten cot)
    private String userID;
    private String roleID;
    private String userName;
    private String userPassword;
    private String phone;
    private String eMail;
    private String address;
    private double point;

    public UserDTO() {
        this.userID = "";
        this.roleID = "";
        this.userName = "";
        this.userPassword = "";
        this.phone = "";
        this.eMail = "";
        this.address = "";
        this.point = 0;
    }

    public UserDTO(String userID, String roleID, String userName, String userPassword, String phone, String eMail, String address, double point) {
        this.userID = userID;
        this.roleID = roleID;
        this.userName = userName;
        this.userPassword = userPassword;
        this.phone = phone;
        this.eMail = eMail;
        this.address = address;
        this.point = point;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }
    
    
    
   
}
