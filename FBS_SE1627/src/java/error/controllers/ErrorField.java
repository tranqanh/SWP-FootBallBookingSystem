/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package error.controllers;

/**
 *
 * @author Trong Duy
 */
public class ErrorField {
     private String fieldID;
    private String fieldName;

    public ErrorField() {
        this.fieldID = "";
        this.fieldName= "";
    }

    public ErrorField(String fieldID, String fieldName) {
        this.fieldID = fieldID;
        this.fieldName = fieldName;
    }

    public String getFieldID() {
        return fieldID;
    }

    public void setFieldID(String fieldID) {
        this.fieldID = fieldID;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }
}
