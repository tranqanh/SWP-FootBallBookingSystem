/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package error.controllers;

/**
 *
 * @author Trong Duy
 */
public class ErrorCategory {
    private String categoryIDE;
    private String categoryNameE;

    public ErrorCategory() {
        this.categoryIDE = "";
        this.categoryNameE ="";
    }

    public String getCategoryIDE() {
        return categoryIDE;
    }

    public void setCategoryIDE(String categoryIDE) {
        this.categoryIDE = categoryIDE;
    }

    public String getCategoryNameE() {
        return categoryNameE;
    }

    public void setCategoryNameE(String categoryNameE) {
        this.categoryNameE = categoryNameE;
    }
    
}
