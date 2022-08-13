/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user.controllers;

import dao.controllers.UserDAO;
import dto.controllers.UserDTO;
import error.controllers.ErrorRegister;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chien
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final String ERROR = "/login_sigup/login.jsp#sigup";
    private static final String SUS = "/login_sigup/login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ErrorRegister userError = new ErrorRegister();
        UserDTO user = null;
        boolean checkVal = true;
        try {
            HttpSession session = request.getSession();
            String newUserID = request.getParameter("newUserID");
            String newEmail = request.getParameter("newEmail");
            String newPhone = request.getParameter("newPhone");
            String newPassword = request.getParameter("newPassword");
            String newPconfirm = request.getParameter("newPconfirm");

            UserDAO dao = new UserDAO();

            if (newUserID.length() < 6 || newUserID.length() > 30) {
                userError.setUserNameError("Username must be between 6 and 30 characters");
                checkVal = false;
            }

            if (newEmail.length() < 0) {
                userError.setUserEmailError("Please enter your email");
                checkVal = false;
            }

            if (newPhone.length() < 0) {
                userError.setUserEmailError("Please enter your email");
                checkVal = false;
            }

            if (!newPassword.equals(newPconfirm) && newPassword.length() > 6) {
                userError.setPasswordError("Invalid password");
                checkVal = false;
            }

            user = new UserDTO(newUserID, "", "", newPassword, newPhone, newEmail, "", 0);
            if (checkVal) {
                boolean checkCreate = dao.RegisterUser(user);
                if (checkCreate) {
                    session.setAttribute("VALID_SIGN", "Valid");
                    url = SUS;
                }

            } else {
                userError.setUserNameError("Tên đăng nhập đã được đăng ký");
                request.setAttribute("REGISTERUSER_ERROR", userError);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                userError.setUserNameError("Username already registered");
                request.setAttribute("REGISTERUSER_ERROR", userError);
            } else {
                log("BUG: " + e.toString());
                request.setAttribute("REGISTERUSER_ERROR", e);
            }

        } finally {
            request.setAttribute("REGISTERUSER_FILL", user);
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
