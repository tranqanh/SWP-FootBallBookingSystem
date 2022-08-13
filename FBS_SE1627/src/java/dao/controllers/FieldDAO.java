/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.controllers;

import dto.controllers.FieldDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author chien
 */
public class FieldDAO {
     private static final String CREATE = "INSERT INTO Field(FieldID, CategoryID, FieldName, Image, Status) VALUES(?, ?, ?, ?, 1) ";
    private static final String SEARCH = "SELECT * FROM Field";
    
    private static final String DELETE = "UPDATE Field set status = '0' where FieldID=?";
    private static final String DUPLICATE = "SELECT FieldName FROM Field where FieldID = ?";
    private static final String UPDATE = "UPDATE Field SET CategoryID = ?, FieldName = ?,  status = '1' where FieldID = ?";

    public List<FieldDTO> getAllField() throws SQLException {
        List listField = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fieldID = rs.getString("FieldID");
                    String categoryID = rs.getString("CategoryID");
                    String fieldName = rs.getString("FieldName");
                    String img = rs.getString("Img");
                    int status = Integer.parseInt(rs.getString("Status"));
                    listField.add(new FieldDTO(fieldID, categoryID, img, fieldName, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listField;
    }
    public boolean createField(String FieldID, String CategoryID, String FieldName, String Image) throws SQLException {
          boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, FieldID);
                ptm.setString(2, CategoryID);
                ptm.setString(3, FieldName);
                ptm.setString(4, Image);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
    public boolean checkDupicate(String fieldID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATE);
                ptm.setString(1, fieldID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean update(String fieldID, String categoryID, String fieldName) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, categoryID);
                ptm.setString(2, fieldName);
                ptm.setString(3, fieldID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean delete(String fieldID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, fieldID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

}
