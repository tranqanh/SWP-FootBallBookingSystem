/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package slot.Controller;

import dao.controllers.SlotDAO;
import error.controllers.ErrorSlot;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Trong Duy
 */
@WebServlet(name = "CreateSlotController", urlPatterns = {"/CreateSlotController"})
public class CreateSlotController extends HttpServlet {

    private static final String ERROR = "GetAllSlotController";
    private static final String SUSSCESS = "GetAllSlotController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        ErrorSlot slotErr = new ErrorSlot();
        try {
            String categoryID = request.getParameter("categoryID");
            String slotName = request.getParameter("slotName");
            String timeStart = request.getParameter("SlotTimeStart");
            String timeEnd = request.getParameter("SlotTimeEnd");
            double price = Double.parseDouble(request.getParameter("price"));
            SlotDAO dao = new SlotDAO();
            boolean checkDup = dao.checkDupicate(slotName, categoryID);
            boolean checkValid = true;
            if (slotName.isBlank() || slotName.isEmpty()) {
                slotErr.setSlotName("slotName cannot null!");
                checkValid = false;
            }
            if (timeStart.isBlank() || timeStart.isEmpty()) {
                slotErr.setTimeStart("Time Start cannot null!");
                checkValid = false;
            }
            if(price < 0) {
                slotErr.setPrice("price cannot smaller than 0");
            }
            if (checkDup) {
                slotErr.setSlotName("SlotName is duplicate!");
                checkValid = false;
            }
            if (checkValid) {
                boolean check = dao.createSlot(categoryID, slotName, timeStart, timeEnd, price);
                if (check) {
                    session.removeAttribute("Valid_Slot");
                    url = SUSSCESS;
                }
            } else {
                request.setAttribute("ErrorSlot", slotErr);
                session.setAttribute("Valid_Slot", "Invalid");
            }
        } catch (SQLException e) {
            log("Error at FieldCateController " + e.toString());
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
