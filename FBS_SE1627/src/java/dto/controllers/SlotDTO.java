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
public class SlotDTO {
    private String slotID;
    private String categoryID;
    private String slotName;
    private String timeStart;
    private String timeEnd;
    private String price;
    private int status;

 
    

    
    public SlotDTO( String categoryID, String slotName, String timeStart, String timeEnd, String price, int status) {
        this.categoryID = categoryID;
        this.slotName = slotName;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.price = price;
        this.status = status;
    }
    
    
    public SlotDTO() {
        this.slotID = "";
        this.categoryID = "";
        this.slotName = "";
        this.timeStart = "";
        this.timeEnd = "";
        this.price = "";
    }
    
    
    public SlotDTO(String slotID, String categoryID, String slotName, String timeStart, String timeEnd, String price) {
        this.slotID = slotID;
        this.categoryID = categoryID;
        this.slotName = slotName;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.price = price;
    }

    public String getSlotID() {
        return slotID;
    }

    public void setSlotID(String slotID) {
        this.slotID = slotID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
       public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
