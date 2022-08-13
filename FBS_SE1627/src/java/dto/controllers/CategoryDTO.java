/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto.controllers;

/**
 *
 * @author Trong Duy
 */
public class CategoryDTO {
    private String categoryID;
    private String categoryName;
    private int status;

    public CategoryDTO() {
        this.categoryID ="";
        this.categoryName="";
        this.status = 1;
    }
    
    
    public CategoryDTO(String categoryID, String categoryName, int status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
}
