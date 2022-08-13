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
public class ErrorFeedBack {
    private String errorName;
    private String errorPhone;
    private String errorContent;

    public ErrorFeedBack() {
        this.errorName = "";
        this.errorPhone = "";
        this.errorContent = "";
    }
    
    public ErrorFeedBack(String errorName, String errorPhone, String errorContent) {
        this.errorName = errorName;
        this.errorPhone = errorPhone;
        this.errorContent = errorContent;
    }

    public String getErrorName() {
        return errorName;
    }

    public void setErrorName(String errorName) {
        this.errorName = errorName;
    }

    public String getErrorPhone() {
        return errorPhone;
    }

    public void setErrorPhone(String errorPhone) {
        this.errorPhone = errorPhone;
    }

    public String getErrorContent() {
        return errorContent;
    }

    public void setErrorContent(String errorContent) {
        this.errorContent = errorContent;
    }
    
    
    
    
}
