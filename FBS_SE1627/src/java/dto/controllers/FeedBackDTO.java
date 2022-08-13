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
public class FeedBackDTO {
    private String feedBackID;
    private String userName;
    private String phone;
    private String dateFB;
    private String content;

    public FeedBackDTO() {
        this.feedBackID = "";
        this.userName = "";
        this.phone = "";
        this.dateFB = "";
        this.content = "";
    }

    public FeedBackDTO(String feedBackID, String userName, String phone, String dateFB, String content) {
        this.feedBackID = feedBackID;
        this.userName = userName;
        this.phone = phone;
        this.dateFB = dateFB;
        this.content = content;
    }

    public String getFeedBackID() {
        return feedBackID;
    }

    public void setFeedBackID(String feedBackID) {
        this.feedBackID = feedBackID;
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

    public String getDateFB() {
        return dateFB;
    }

    public void setDateFB(String dateFB) {
        this.dateFB = dateFB;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    
}
