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
public class OderDTO {
    
    private int orderID;
    private String userID;
    private String categoryID;
    private String orderNote;
    private String roleID;
    private int tottalSlot;
    private double tottalPrice;
    private String phone;
    private String nameGuest;
    private String created;

    public OderDTO() {
        this.orderID = -1;
        this.userID = "";
        this.categoryID = "";
        this.orderNote = "";
        this.roleID = "";
        this.tottalSlot = -1;
        this.tottalPrice = -1;
        this.phone = "";
        this.nameGuest = "";
        this.created = "";
    }

    public OderDTO(int orderID, String userID, String categoryID, String orderNote, String roleID, int tottalSlot, double tottalPrice, String phone, String nameGuest, String created) {
        this.orderID = orderID;
        this.userID = userID;
        this.categoryID = categoryID;
        this.orderNote = orderNote;
        this.roleID = roleID;
        this.tottalSlot = tottalSlot;
        this.tottalPrice = tottalPrice;
        this.phone = phone;
        this.nameGuest = nameGuest;
        this.created = created;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getOrderNote() {
        return orderNote;
    }

    public void setOrderNote(String orderNote) {
        this.orderNote = orderNote;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public int getTottalSlot() {
        return tottalSlot;
    }

    public void setTottalSlot(int tottalSlot) {
        this.tottalSlot = tottalSlot;
    }

    public double getTottalPrice() {
        return tottalPrice;
    }

    public void setTottalPrice(double tottalPrice) {
        this.tottalPrice = tottalPrice;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNameGuest() {
        return nameGuest;
    }

    public void setNameGuest(String nameGuest) {
        this.nameGuest = nameGuest;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    
    
}
