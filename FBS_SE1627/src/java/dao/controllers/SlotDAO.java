/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.controllers;

import dto.controllers.SlotDTO;
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
public class SlotDAO {
    
    private static final String SLOTIDLIST = " SELECT SLOTID FROM SLOT WHERE CategoryID = ?";
    public List<SlotDTO> getSlotID(String categoryID) throws SQLException {
        List<SlotDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SLOTIDLIST);
                ptm.setString(1, categoryID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String SlotID = rs.getString("SLOTID");
                    listProduct.add(new SlotDTO(SlotID, categoryID, "", "", "", ""));
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
        return listProduct;
    }

//    private static final String SLOTLoad = " SELECT [SlotID],[CategoryID],[SlotName],[TimeStart],[TimeEnd],[Price] FROM SLOT WHERE SLOTID = ? AND CategoryID = ? AND (SELECT COUNT(SlotID) FROM OrderDetail WHERE SLOTID = ? ) < (SELECT COUNT(CategoryID) FROM Field WHERE CategoryID = ?)";
//    public List<SlotDTO> getSlotList(List<SlotDTO> slotID) throws SQLException {
//        List<SlotDTO> listProduct = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                for (SlotDTO slotid : slotID) {
//                    ptm = conn.prepareStatement(SLOTLoad);
//                    ptm.setString(1, slotid.getSlotID());
//                    ptm.setString(2, slotid.getCategoryID());
//                    ptm.setString(3, slotid.getSlotID());
//                    ptm.setString(4, slotid.getCategoryID());
//                    rs = ptm.executeQuery();
//                    while (rs.next()) {
//                        String SlotID = rs.getString("SlotID");
//                        String CategoryID = rs.getString("CategoryID");
//                        String SlotName = rs.getString("SlotName");
//                        String TimeStart = rs.getString("TimeStart");
//                        String TimeEnd = rs.getString("TimeEnd");
//                        String Price = rs.getString("Price");
//                        listProduct.add(new SlotDTO(SlotID, CategoryID, SlotName, TimeStart, TimeEnd, Price));
//
//                    }
//                }
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//
//        }
//        return listProduct;
//    }
    
     private static final String SLOTLoad = " SELECT [SlotID],[CategoryID],[SlotName],[TimeStart],[TimeEnd],[Price] FROM SLOT WHERE SLOTID = ? AND CategoryID = ?";
    public List<SlotDTO> getSlotList(List<SlotDTO> slotID) throws SQLException {
        List<SlotDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (SlotDTO slotid : slotID) {
                    ptm = conn.prepareStatement(SLOTLoad);
                    ptm.setString(1, slotid.getSlotID());
                    ptm.setString(2, slotid.getCategoryID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String SlotID = rs.getString("SlotID");
                        String CategoryID = rs.getString("CategoryID");
                        String SlotName = rs.getString("SlotName");
                        String TimeStart = rs.getString("TimeStart");
                        String TimeEnd = rs.getString("TimeEnd");
                        String Price = rs.getString("Price");
                        listProduct.add(new SlotDTO(SlotID, CategoryID, SlotName, TimeStart, TimeEnd, Price));

                    }
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
        return listProduct;
    }
     public List<SlotDTO> GetAllSlot() throws SQLException {
        List<SlotDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT *"
                        + "FROM Slot";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String CategoryID = rs.getString("CategoryID");
                    String SlotName = rs.getString("SlotName");
                    String TimeStart = rs.getString("TimeStart");
                    String TimeEnd = rs.getString("TimeEnd");
                    String Price = rs.getString("Price");
                    int status = Integer.parseInt(rs.getString("status"));
                    list.add(new SlotDTO(CategoryID, SlotName, TimeStart, TimeEnd, Price, status));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }

        }
        return list;
    }
    private static final String DELETE = "UPDATE Slot set status = '0' where SlotName=?";

    public boolean delete(String slotName) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, slotName);
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
    private static final String UPDATE = "UPDATE Slot SET TimeStart = ?,  TimeEnd = ?, Price=?, status = '1' where SlotName = ?";

    public boolean update(String slotName, String TimeStart, String TimeEnd, double price) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, TimeStart);
                ptm.setString(2, TimeEnd);
                ptm.setDouble(3, price);
                ptm.setString(4, slotName);
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
    private static final String DUPLICATE = "SELECT SlotName FROM Slot where SlotName = ? and CategoryID = ?";

    public boolean checkDupicate(String SlotName, String CategoryID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATE);
                ptm.setString(1, SlotName);
                ptm.setString(2, CategoryID);
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
    private static final String CREATE = "INSERT INTO Slot(CategoryID, SlotName, TimeStart, TimeEnd, Price, Status) VALUES(?, ?, ?, ?, ?, 1) ";

    public boolean createSlot(String CategoryID, String SlotName, String TimeStart, String TimeEnd, double price) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, CategoryID);
                ptm.setString(2, SlotName);
                ptm.setString(3, TimeStart);
                ptm.setString(4, TimeEnd);
                ptm.setDouble(5, price);
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
}
