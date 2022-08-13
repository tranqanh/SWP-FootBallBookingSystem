/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedback.controllers;

import dao.controllers.FeedBackDAO;
import dto.controllers.FeedBackDTO;
import error.controllers.ErrorFeedBack;
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
@WebServlet(name = "UserFeedBackController", urlPatterns = {"/UserFeedBackController"})
public class UserFeedBackController extends HttpServlet {

    private static final String ERROR = "/mainPage/user.jsp#services";
    private static final String SUCCESS = "/mainPage/user.jsp#services";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userName = request.getParameter("name");
            String phone = request.getParameter("phone");
            String content = request.getParameter("content");
            FeedBackDAO dao = new FeedBackDAO();
            
            FeedBackDTO feedback = new FeedBackDTO("",userName,phone,"",content);
            boolean checkInsert = dao.SendContect(feedback);
            if (checkInsert) {
                url = SUCCESS;
            } else {
                request.setAttribute("USER_FEEDBACK_ERROR","User feedback error!" );
            }
        } catch (Exception e) {
            log("Error at InsertUserFeedbackController: " + e.toString());
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
