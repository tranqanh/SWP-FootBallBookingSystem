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
public class NotificationDTO {
    
    private String notificationID;
    private String dateNF;
    private String title;
    private String content;

    
    public NotificationDTO() {
        this.notificationID = "";
        this.dateNF = "";
        this.title = "";
        this.content = "";
    }

    public NotificationDTO(String notificationID, String dateNF, String title, String content) {
        this.notificationID = notificationID;
        this.dateNF = dateNF;
        this.title = title;
        this.content = content;
    }

    public String getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(String notificationID) {
        this.notificationID = notificationID;
    }

    public String getDateNF() {
        return dateNF;
    }

    public void setDateNF(String dateNF) {
        this.dateNF = dateNF;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
    
    
}
