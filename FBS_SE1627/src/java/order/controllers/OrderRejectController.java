/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order.controllers;

import dao.controllers.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderRejectController", urlPatterns = {"/OrderRejectController"})
public class OrderRejectController extends HttpServlet {

     private static final String ERROR = "MainController?action=ReadListOrderConfirm&offset=1";
    private static final String SUCCESS = "MainController?action=ReadListOrderConfirm&offset=1";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String orderDetailID = request.getParameter("OrderDetailID");
        String dateOrder = request.getParameter("DateOrder");
        String slotID = request.getParameter("SlotID");
        String categoryID = request.getParameter("CategoryID");
        try {
            OrderDetailDAO dao = new OrderDetailDAO();
            boolean check = dao.rejected(orderDetailID,slotID,dateOrder);
            if (check) {
                
                request.setAttribute("CN", "Succesfully reject!");
                url = SUCCESS;
            } else {
                request.setAttribute("CN", "Fail to reject!");
                url = ERROR;
            }
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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
