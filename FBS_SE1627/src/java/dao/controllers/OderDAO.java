/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.controllers;

import dto.controllers.OderDTO;
import dto.controllers.OrderDetailDTO;
import dto.controllers.cartDTO;
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
public class OderDAO {

    //lấy orderid cho bản orderdetail
    private static final String TAKEORDERID = "SELECT ORDERID FROM OrderTable  WHERE UserID = ? and Created = ?";

    public int takeorderID(String userID, String created) throws SQLException {
        int OID = -1;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                //code
                ptm = conn.prepareStatement(TAKEORDERID);
                ptm.setString(1, userID);
                ptm.setString(2, created);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    OID = rs.getInt("ORDERID");
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
        return OID;
    }
    //lay slot id thong qua time
    private static final String TAKESLOTID = "SELECT SLOTID FROM SLOT WHERE TimeStart = ? AND timeEnd = ?";

    public int takeSlotID(String timeStar, String timeEnd) throws SQLException {
        int SID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TAKESLOTID);
                ptm.setString(1, timeStar);
                ptm.setString(2, timeEnd);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    SID = rs.getInt("SLOTID");
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
        return SID;
    }

    //hàm oder nè
    private static final String ORDERREQUEST = "insert into OrderTable(UserID,RoleID,TotalSlot,Phone,NameGuest,Created ,Status,CategoryID) values(?,?,?,?,?,?,1,?);";

    public boolean bookingrequest(OderDTO order) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ORDERREQUEST);
                ptm.setString(1, order.getUserID());
                ptm.setString(2, order.getRoleID());
                ptm.setInt(3, order.getTottalSlot());
                ptm.setString(4, order.getPhone());
                ptm.setString(5, order.getNameGuest());
                ptm.setString(6, order.getCreated());
                ptm.setString(7,order.getCategoryID());

                check = ptm.executeUpdate() > 0 ? true : false;

            }
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
    //nhap orderdetail
    private static final String ORDERDETAILIMPORT = "insert into OrderDetail(OrderID,SlotID,StandbyState,Price,DateOder,Created ,Status) values(?,?,'waiting',(Select Price from Slot where SlotID = ?),?,?,1);";

    public boolean orderDetailInport(OrderDetailDTO orderDetail) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ORDERDETAILIMPORT);
                ptm.setInt(1, orderDetail.getOrderID());
                ptm.setInt(2, orderDetail.getSlotID());
                ptm.setInt(3, orderDetail.getSlotID());
                ptm.setString(4, orderDetail.getDateOrder());
                ptm.setString(5, orderDetail.getCreated());

                check = ptm.executeUpdate() > 0 ? true : false;

            }
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
    //hàm confitm oder
    private static final String ORDERCONFIRM = "Update OrderDetail SET StandbyState='confirmed' WHERE OrderDetailID= ?";

    public boolean orderConfirm(String orderDetailID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ORDERCONFIRM);
                ptm.setString(1, orderDetailID);
                check = ptm.executeUpdate() > 0 ? true : false;

            }
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
    //hàm load bill
    private static final String CARTLIST = "select tb3.SlotName,tb3.TimeStart ,tb3.TimeEnd , tb2.OrderDetailID, tb2.OrderID, tb2.DateOder, "
            + "tb2.Price from OrderTable tb1 LEFT JOIN OrderDetail tb2 ON tb1.OrderID = tb2.OrderID "
            + "LEFT JOIN Slot tb3 ON tb2.SlotID = tb3.SlotID where tb1.UserID =? and tb2.StandbyState = 'waiting' and tb2.status = 1";

    public List<cartDTO> getCartList(String userID) throws SQLException {
        List<cartDTO> listCart = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CARTLIST);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String slotName = rs.getString("SlotName");
                    String timeStar = rs.getString("TimeStart");
                    String timeEnd = rs.getString("TimeEnd");
                    String OrderDetailID = rs.getString("OrderDetailID");
                    double price = Double.parseDouble(rs.getString("Price"));
                    String orderID = rs.getString("OrderID");
                    String date = rs.getString("DateOder");
                    listCart.add(new cartDTO(slotName, date, OrderDetailID, orderID, timeStar, timeEnd, price));

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
        return listCart;
    }

    //Cart remove
    private static final String REMOVECART = "Update OrderDetail SET Status = 0 WHERE OrderDetailID= ?;";
    public boolean cartRemove(String orderDetailID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVECART);
                ptm.setString(1, orderDetailID);
                check = ptm.executeUpdate() > 0 ? true : false;

            }
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
    
    private static final String REMOVE = "Delete OrderDetail WHERE status = 'false' and StandbyState = 'waiting'";
    public void cartTrueRemove() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE);
                ptm.executeUpdate();

            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
    }

    //hàm load order
    public List<OderDTO> getListOrder(int index, String search) throws SQLException {
        List<OderDTO> listOrder = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String READ = "SELECT OrderID, UserID, CategoryID, OrderNote, TotalSlot, Phone, NameGuest FROM OrderTable where status = 'true' and NameGuest like ? \n"
                + "ORDER BY OrderID DESC \n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(READ);
                ptm.setString(1, '%' + search + '%');
                ptm.setInt(2, (index - 1) * 5);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    String userID = rs.getString("UserID");
                    String fieldID = rs.getString("CategoryID");
                    String orderNote = rs.getString("OrderNote");
                    int totalSlot = Integer.parseInt(rs.getString("TotalSlot"));
                    String phone = rs.getString("Phone");
                    String nameGuest = rs.getString("NameGuest");
                    listOrder.add(new OderDTO(orderID, userID, fieldID, orderNote, "", totalSlot, 0, phone, nameGuest, ""));
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
        return listOrder;
    }
    
    //paid
    private static final String PAID = "update OrderDetail set StandbyState='Paid' where OrderDetailID=? and Status=1";
    public boolean paidBill(String orderDetailID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(PAID);
                ptm.setString(1, orderDetailID);
                check = ptm.executeUpdate() > 0 ? true : false;

            }
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

    public int getTotalOrder(String search) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "select count(*) from OrderTable  where status = 1 and NameGuest like ? ";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, '%' + search + '%');
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<OderDTO> getUserListOrder(int index, String userID) throws SQLException {
        List<OderDTO> listOrder = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String READ = "SELECT OrderID, UserID, CategoryID, OrderNote, TotalSlot, Phone, NameGuest FROM OrderTable where status = 'true' and UserID like ? \n"
                + "ORDER BY OrderID DESC \n"
               + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(READ);
                ptm.setString(1, '%' + userID + '%');
                ptm.setInt(2, (index - 1) * 5);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    String fieldID = rs.getString("CategoryID");
                    int totalSlot = Integer.parseInt(rs.getString("TotalSlot"));
                    listOrder.add(new OderDTO(orderID, userID, fieldID, "", "", totalSlot, 0, "", "", ""));
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
        return listOrder;
    }

    public int getUserTotalOrder( String userID) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "select count(*) from OrderTable  where status = 1 and UserID like ? ";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, '%' + userID + '%');
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return 0;
    }
}
