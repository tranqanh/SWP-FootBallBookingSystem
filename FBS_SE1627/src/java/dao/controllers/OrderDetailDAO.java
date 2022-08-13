/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.controllers;

import dto.controllers.OrderDetailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {
    public List<OrderDetailDTO> getListOrderDetail(int index) throws SQLException {
        List<OrderDetailDTO> listOrderDetail = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String READ = "SELECT OrderDetailID, o.OrderID, NameGuest, Phone, Price, DateOder, categoryID, slotID, StandbyState FROM (OrderDetail od left join OrderTable o ON od.OrderID=o.OrderID) where StandbyState = 'Paid' \n"
                +"ORDER BY o.OrderID \n"
                +"OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(READ);
                ptm.setInt(1, (index-1)*5 );
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderDetailID = rs.getString("OrderDetailID");
                    int orderID = rs.getInt("OrderID");
                    String userName = rs.getString("NameGuest");
                    String phone = rs.getString("Phone");
                    double price = rs.getDouble("Price");
                    String date = rs.getString("DateOder");
                    String categoryID = rs.getString("categoryID");
                    int slotID = rs.getInt("SlotID");
                    String status = rs.getString("StandbyState");
                    listOrderDetail.add(new OrderDetailDTO(orderDetailID,orderID,userName,phone, price, date,categoryID,slotID,status,""));
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
        return listOrderDetail;
    }
    
    public int getTotalOrderDetail(){
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "select count(*) from OrderDetail  where StandbyState = 'Paid' ";
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }catch(Exception e){
        }
        return 0;
    }
    public boolean confirmOrder (String dateOrder, String slotID, String categoryID){
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        String query = "SELECT COUNT(*) FROM SLOT WHERE SlotID = ? AND (SELECT COUNT(OrderDetailID) FROM OrderDetail WHERE DateOder = ? AND SLOTID = ? AND StandbyState = 'confirmed' ) < (SELECT COUNT(CategoryID) FROM Field WHERE CategoryID = ?)";
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, slotID);
                ptm.setString(2, dateOrder);
                ptm.setString(3, slotID);
                ptm.setString(4,categoryID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
                if(count>0){
                    return true;
                }
            }
        }catch(Exception e){
        }
        return check;
    }
    
    public void confirmed (String orderDetailID, String slotID, String dateOrder){
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        String query = "UPDATE OrderDetail SET StandbyState = 'confirmed' WHERE SlotID = ? AND DateOder = ? AND OrderDetailID = ?";
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, slotID);
                ptm.setString(2, dateOrder);
                ptm.setString(3, orderDetailID);
                rs = ptm.executeQuery();
            }
        }catch(Exception e){
        }
    }
    
    public boolean rejected (String orderDetailID, String slotID, String dateOrder){
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        String query = "UPDATE OrderDetail SET StandbyState = 'rejected' WHERE SlotID = ? AND DateOder = ? AND OrderDetailID = ?";
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, slotID);
                ptm.setString(2, dateOrder);
                ptm.setString(3, orderDetailID);
                rs = ptm.executeQuery();
            }
        }catch(Exception e){
        }
        return true;
    }
    
    public List<OrderDetailDTO> getListOrderDetailUser(int index, String userID) throws SQLException {
        List<OrderDetailDTO> listOrderDetail = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String READ = "SELECT OrderDetailID, TimeStart, TimeEnd,o.OrderID, NameGuest, Phone, od.Price, DateOder, o.categoryID, od.slotID, StandbyState FROM (OrderDetail od left join Slot s on od.slotID=s.slotID) left join OrderTable o ON od.OrderID=o.OrderID  Where userID = ?\n"
                +"ORDER BY o.OrderID DESC\n"
                +"OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(READ);
                ptm.setString(1, userID);
                ptm.setInt(2, (index-1)*5 );
                
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderDetailID = rs.getString("OrderDetailID");
                    int orderID = rs.getInt("OrderID");
                    String userName = rs.getString("TimeStart");
                    String phone = rs.getString("TimeEnd");
                    double price = rs.getDouble("Price");
                    String date = rs.getString("DateOder");
                    String categoryID = rs.getString("categoryID");
                    int slotID = rs.getInt("SlotID");
                    String status = rs.getString("StandbyState");
                    listOrderDetail.add(new OrderDetailDTO(orderDetailID,orderID,userName,phone, price, date,categoryID,slotID,status,""));
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
        return listOrderDetail;
    }
    public int getTotalOrderDetailUser(String userID){
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "select count(*) FROM (OrderDetail od left join OrderTable o ON od.OrderID=o.OrderID) Where userID = ?";
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1,userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }catch(Exception e){
        }
        return 0;
    }
}
