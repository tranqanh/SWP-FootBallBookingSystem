/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.controllers;

import dto.controllers.NotificationDTO;
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
public class NotificationDAO {
    private static final String SENDNOTIFICATION = "INSERT INTO Notification ([DateNF],[Title],[Content],[Status]) VALUES(GetDate(),?,?,1)";
    private static final String DELETE = "UPDATE Notification SET status = 0 WHERE NotificationID=?";
    
    public boolean insert(NotificationDTO notification) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {              
                
                ptm = conn.prepareStatement(SENDNOTIFICATION);
                ptm.setString(1, notification.getTitle());
                ptm.setString(2, notification.getContent());
                
                check = ptm.executeUpdate() > 0 ? true : false;

            }
        }
        finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
    
    public List<NotificationDTO> getListNotification(int index) throws SQLException {
        List<NotificationDTO> listNotification = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String READ = "SELECT NotificationID, DateNF, Title, Content FROM Notification where status = 1 \n"
                +"ORDER BY NotificationID DESC \n"
                +"OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(READ);
                ptm.setInt(1, (index-1)*5 );
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String notificationID = rs.getString("NotificationID");
                    String date = rs.getString("DateNF");
                    String title = rs.getString("Title");
                    String content = rs.getString("Content");
                    listNotification.add(new NotificationDTO(notificationID,date,title,content));
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
        return listNotification;
    }
    
    public int getTotalNotification(){
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "select count(*) from Notification  where status = 1 ";
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
    
    public boolean delete(String notificationID) throws SQLException {
        boolean check=false;
        Connection conn= null;
        PreparedStatement ptm=null;
        try {
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm= conn.prepareStatement(DELETE);
                ptm.setString(1, notificationID);
                check= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
}
