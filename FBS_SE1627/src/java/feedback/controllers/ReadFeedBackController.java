/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedback.controllers;

import dao.controllers.FeedBackDAO;
import dto.controllers.FeedBackDTO;
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
@WebServlet(name = "ReadFeedBackController", urlPatterns = {"/ReadFeedBackController"})
public class ReadFeedBackController extends HttpServlet {

    private static final String ERROR = "mainPage/ad-services/Feedback.jsp";
    private static final String SUCCESS = "mainPage/ad-services/Feedback.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        int n = Integer.parseInt(request.getParameter("offset"));
        try {
            FeedBackDAO dao = new FeedBackDAO();
            List<FeedBackDTO> listFeedback = dao.getListFeedback(n);
            if (listFeedback.size() > 0) {
                request.setAttribute("LIST_FEEDBACK", listFeedback);
                int count = dao.getTotalFeedBack();
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
