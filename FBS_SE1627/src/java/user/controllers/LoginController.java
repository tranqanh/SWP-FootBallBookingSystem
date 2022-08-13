/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user.controllers;

import dao.controllers.UserDAO;
import dto.controllers.UserDTO;
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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR ="/login_sigup/login.jsp";
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "/mainPage/admin.jsp";
    private static final String USER = "US";
    private static final String USER_PAGE = "/mainPage/user.jsp";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("UserID");
            String password = request.getParameter("Password");
            UserDAO dao = new UserDAO();
            
            UserDTO loginUser = dao.checkLogin(userID, password);
            
            //xac thuc
            if(loginUser!=null){
                HttpSession session = request.getSession();
                String roleID = loginUser.getRoleID().trim();
                
                //phan quyen
                if(AD.equals(roleID)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = ADMIN_PAGE;
                }else if (USER.equals(roleID)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = USER_PAGE;
                }else {
                    request.setAttribute("LOG_ERROR", "Your role is not support");
                }
            }else{
             request.setAttribute("LOG_ERROR", "Your Password is incorrect!!!");   
            }
            
        } catch (Exception e) {
            log("error at LoginController: " + e.toString());
        }finally{
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
