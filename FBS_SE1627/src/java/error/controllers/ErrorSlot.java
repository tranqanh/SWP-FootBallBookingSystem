/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package error.controllers;

/**
 *
 * @author Trong Duy
 */
public class ErrorSlot {
    private String slotName;
    private String timeStart;
    private String timeEnd;
    private String price ;

    public ErrorSlot() {
        this.slotName = "";
        this.timeStart = "";
        this.timeEnd = "";
        this.price = "";
    }

    public ErrorSlot(String slotName, String timeStart, String timeEnd, String price) {
        this.slotName = slotName;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.price = price;
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
    
    
}
