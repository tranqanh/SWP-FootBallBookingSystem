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
public class ErrorRegister {
    private String userEmailError;
    private String userNameError;
    private String passwordError;
    private String phoneError;

    public ErrorRegister(){
        this.userEmailError = "";
        this.userNameError = "";
        this.passwordError = "";
        this.phoneError = "";
    }

    public ErrorRegister(String userEmailError, String userNameError, String passwordError, String phoneError) {
        this.userEmailError = userEmailError;
        this.userNameError = userNameError;
        this.passwordError = passwordError;
        this.phoneError = phoneError;
    }

    public String getUserEmailError() {
        return userEmailError;
    }

    public void setUserEmailError(String userEmailError) {
        this.userEmailError = userEmailError;
    }

    public String getUserNameError() {
        return userNameError;
    }

    public void setUserNameError(String userNameError) {
        this.userNameError = userNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }
    
   
    
    
    
}
