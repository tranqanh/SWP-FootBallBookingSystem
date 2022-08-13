/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package error.controllers;

/**
 *
 * @author chien
 */
public class ErrorBooking {
    private String dateError;
    private String slotError;

    public ErrorBooking() {
        this.dateError = "";
        this.slotError = "";
    }
    
    
    public ErrorBooking(String dateError, String slotError) {
        this.dateError = dateError;
        this.slotError = slotError;
    }

    public String getDateError() {
        return dateError;
    }

    public void setDateError(String dateError) {
        this.dateError = dateError;
    }

    public String getSlotError() {
        return slotError;
    }

    public void setSlotError(String slotError) {
        this.slotError = slotError;
    }
    
    
}
