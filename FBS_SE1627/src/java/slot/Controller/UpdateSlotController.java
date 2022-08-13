/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package slot.Controller;

import dao.controllers.SlotDAO;
import error.controllers.ErrorSlot;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Trong Duy
 */
@WebServlet(name = "UpdateSlotController", urlPatterns = {"/UpdateSlotController"})
public class UpdateSlotController extends HttpServlet {

    private static final String ERROR = "GetAllSlotController";
    private static final String SUCCESS = "GetAllSlotController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      String url = ERROR;
       boolean checkValid = true;
       
       ErrorSlot slotErr = new ErrorSlot();
        try { 
            String slotName= request.getParameter("slotName");
            String timeStart = request.getParameter("timeStart");
            String timeEnd = request.getParameter("timeEnd");
            double price = Double.parseDouble(request.getParameter("price"));
            SlotDAO dao = new SlotDAO();
            if (timeStart.isBlank() || timeStart.isEmpty()) {
                slotErr.setTimeStart("TimeStart cannot null!");
                checkValid = false;
            }
            if (timeEnd.isBlank() || timeEnd.isEmpty()) {
                slotErr.setTimeStart("TimeEnd cannot null!");
                checkValid = false;
            }
            if(price < 0 ) {
                slotErr.setPrice("Price cannot be null");
                checkValid = false;
            }
            if (checkValid) {
                boolean checkUpdate = dao.update(slotName, timeStart, timeEnd, price);
                if (checkUpdate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("UPDATE_SLOT_ERROR", slotErr);
            }
        } catch (Exception e) {
            log("Error at UpdateController" + e.toString());
        }
        finally {
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
