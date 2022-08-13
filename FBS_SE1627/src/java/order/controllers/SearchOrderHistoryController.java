/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order.controllers;

import dao.controllers.OderDAO;
import dto.controllers.OderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchOrderHistoryController", urlPatterns = {"/SearchOrderHistoryController"})
public class SearchOrderHistoryController extends HttpServlet {

    private static final String ERROR = "/mainPage/ad-services/History.jsp";
    private static final String SUCCESS = "/mainPage/ad-services/History.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        int n = Integer.parseInt(request.getParameter("offset"));
        String search = request.getParameter("search");
        try {
            OderDAO dao = new OderDAO();
            List<OderDTO> listOrder = dao.getListOrder(n,search);
            if (listOrder.size() > 0) {
                request.setAttribute("LIST_ORDER", listOrder);
                int count = dao.getTotalOrder(search);
                int endPage = count / 5;
                if (count % 5 != 0) {
                    endPage++;
                }
                request.setAttribute("endP", endPage);
                url = SUCCESS;
            } else {
                request.setAttribute("NF", "Not found!");
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
