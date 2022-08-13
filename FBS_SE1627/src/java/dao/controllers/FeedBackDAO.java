/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.controllers;


import dto.controllers.FeedBackDTO;
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
public class FeedBackDAO {
    
    private static final String SENDFEEDBACK = "INSERT INTO FEEDBACK([UserName],[Phone],[DateFB],[Content],[Status]) VALUES(?,?,GetDate(),?,1)";
    
    public boolean SendContect(FeedBackDTO fb) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {              
                
                ptm = conn.prepareStatement(SENDFEEDBACK);
                ptm.setString(1, fb.getUserName());
                ptm.setString(2, fb.getPhone());
                ptm.setString(3, fb.getContent());
                
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
    
    
    public List<FeedBackDTO> getListFeedback(int index) throws SQLException {
        List<FeedBackDTO> listFeedback = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String READ = "SELECT FeedBackID, UserName, Phone, DateFB, Content FROM FEEDBACK where status = 1 \n"
                +"ORDER BY FeedBackID DESC \n"
                +"OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(READ);
                ptm.setInt(1, (index-1)*5 );
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String feedbackID = rs.getString("FeedbackID");
                    String name = rs.getString("UserName");
                    String phone = rs.getString("Phone");
                    String date = rs.getString("DateFB");
                    String content = rs.getString("Content");
                    listFeedback.add(new FeedBackDTO(feedbackID,name,phone,date,content));
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
        return listFeedback;
    }
    
    public int getTotalFeedBack(){
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String query = "select count(*) from FeedBack  where status = 1 ";
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
    
    private static final String DELETE = "UPDATE FeedBack SET status = 0 WHERE FeedBackID=?";
    public boolean delete(String feedbackID) throws SQLException {
        boolean check=false;
        Connection conn= null;
        PreparedStatement ptm=null;
        try {
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm= conn.prepareStatement(DELETE);
                ptm.setString(1, feedbackID);
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
