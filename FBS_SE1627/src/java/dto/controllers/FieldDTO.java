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
public class FieldDTO {
     private String fieldID;
    private String category;
    private String img;
    private String fieldName;
    private int status;

    public FieldDTO() {
        this.fieldID = "";
        this.category = "";
        this.img = "";
        this.fieldName = "";
        this.status = 0;
    }
    
    
    public FieldDTO( String fieldID,String category, String img, String fieldName, int status) {
        this.fieldID = fieldID;
        this.category = category;
        this.img = img;
        this.fieldName = fieldName;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFieldID() {
        return fieldID;
    }

    public void setFieldID(String fieldID) {
        this.fieldID = fieldID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }
    
}
