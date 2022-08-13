/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package booking.Controler;

import dao.controllers.OderDAO;
import dto.controllers.OderDTO;
import dto.controllers.OrderDetailDTO;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chien
 */
@WebServlet(name = "BookingrequestController", urlPatterns = {"/BookingrequestController"})
public class BookingrequestController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUS = "mainPage/user-services/user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        Date now = new Date();
        OderDAO dao = new OderDAO();
        try {
            //data
            List<OrderDetailDTO> OD = new ArrayList<OrderDetailDTO>();

            String userID = request.getParameter("UserID");
            String role = request.getParameter("RoleID");
            String phone = request.getParameter("phone");
            String gestName = request.getParameter("GestName");
            String categoryID = request.getParameter("CategoryID");
            String slot = "slot";
            String date = "date";
            int totalSlot = 0;
            for (int i = 0; i < 100; i++) {
                
                try {
                    String slotname = request.getParameter(slot + i);
                    String datetime = request.getParameter(date + i);
                    if (!slotname.equals("") && !datetime.equals("")) {
                        String[] words = slotname.split("-");
                        int slotID = dao.takeSlotID(words[0], words[1]);
                        OD.add(new OrderDetailDTO("", -1,slotID , "", 0,datetime, ""));
                        totalSlot++;
                    }
                }catch(Exception ex){
                    break;
                }
                
            }
            
            String created = DateFormat.getDateTimeInstance().format(now);

            OderDTO order = new OderDTO(0,userID, categoryID, "", role, totalSlot, 0, phone, gestName, created);
            boolean check = dao.bookingrequest(order);
            
            boolean checkBook = false;
            int orderID = dao.takeorderID(userID, created);
            if (check) {
                for (int i = 0; i < OD.size(); i++) {
                    OD.get(i).setOrderID(orderID);
                    checkBook = dao.orderDetailInport(OD.get(i));
                }
                if (checkBook) {
                    url = "/MainController?action=Payment&UserID="+userID;
                }
            }

        } catch (Exception e) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
