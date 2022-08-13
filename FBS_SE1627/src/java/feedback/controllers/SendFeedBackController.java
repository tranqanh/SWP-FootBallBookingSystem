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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chien
 */
@WebServlet(name = "SendFeedBackController", urlPatterns = {"/SendFeedBackController"})
public class SendFeedBackController extends HttpServlet {

    private static final String ERROR = "Guest-Page/contact.jsp";
    private static final String SUS = "Guest-Page/contact.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            String userName = request.getParameter("UserName");
            String phone = request.getParameter("Phone");
            String content = request.getParameter("Message");

            boolean checkVal = true;
            ErrorFeedBack error = new ErrorFeedBack();
            FeedBackDAO dao = new FeedBackDAO();

            if (userName.length() <= 0) {
                error.setErrorName("Tell us who you are!");
                checkVal = false;
            }

            if (phone.length() <= 0) {
                error.setErrorPhone("Please leave contact information");
                checkVal = false;
            }

            if (content.length() <= 0) {
                error.setErrorContent("Please leave your feedback");
                checkVal = false;
            }

            if (checkVal) {
                FeedBackDTO newfb = new FeedBackDTO("", userName, phone, "", content);
                boolean checkInport = false;
                checkInport = dao.SendContect(newfb);

                if (checkInport) {
                    url = SUS;
                    request.setAttribute("LOG_ERROR", "Your feedback has been sent");
                } else {
                    request.setAttribute("LOG_ERROR", "Send failed, please check the information again");
                }
            } else {
                request.setAttribute("FEEDBACK_ERROR", error);
            }

        } catch (Exception e) {
            log("error at SendFeedBackController: " + e.toString());
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
