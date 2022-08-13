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
public class OrderDetailDTO {
    private String orderDetailID;
    private int orderID;
    private String userName;
    private String phone;
    private double price;
    private String dateOrder;
    private String categoryID;
    private int slotID;
    private String StandbyState;
    private String Created;

    public OrderDetailDTO() {
        this.orderDetailID = "";
        this.orderID = -1;
        this.slotID = -1;
        this.StandbyState = "";
        this.price = -1;
        this.dateOrder = "";
        this.Created = "";
    }

    public OrderDetailDTO(String orderDetailID, int orderID, int slotID, String StandbyState, double price, String dateOrder, String Created) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.slotID = slotID;
        this.StandbyState = StandbyState;
        this.price = price;
        this.dateOrder = dateOrder;
        this.Created = Created;
    }
    
    public OrderDetailDTO(String orderDetailID,int orderID, String userName, String phone, double price, String dateOrder, String categoryID, int slotID, String StandbyState,String Created){
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.userName = userName;
        this.phone = phone;
        this.price = price;
        this.dateOrder = dateOrder;
        this.categoryID = categoryID;
        this.slotID = slotID;
        this.StandbyState = StandbyState;
        this.Created = Created;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getSlotID() {
        return slotID;
    }

    public void setSlotID(int slotID) {
        this.slotID = slotID;
    }

    public String getStandbyState() {
        return StandbyState;
    }

    public void setStandbyState(String StandbyState) {
        this.StandbyState = StandbyState;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getCreated() {
        return Created;
    }

    public void setCreated(String Created) {
        this.Created = Created;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    
    
}
