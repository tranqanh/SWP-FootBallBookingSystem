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
public class cartDTO {
    private String slotName;
    private String dateOrder;
    private String orderDetailID;
    private String orderID;
    private String timeStar;
    private String timeEnd;
    private double price;

    public cartDTO() {
        this.slotName = "";
        this.dateOrder = "";
        this.orderDetailID = "";
        this.orderID = "";
        this.timeStar = "";
        this.timeEnd = "";
        this.price = -1;
    }

    public cartDTO(String slotName, String dateOrder, String orderDetailID, String orderID, String timeStar, String timeEnd, double price) {
        this.slotName = slotName;
        this.dateOrder = dateOrder;
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.timeStar = timeStar;
        this.timeEnd = timeEnd;
        this.price = price;
    }

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getTimeStar() {
        return timeStar;
    }

    public void setTimeStar(String timeStar) {
        this.timeStar = timeStar;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    
    
}
