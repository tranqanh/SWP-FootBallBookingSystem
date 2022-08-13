/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cate.controller;

import dao.controllers.CategoryDAO;
import error.controllers.ErrorCategory;
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
@WebServlet(name = "UpdateCateController", urlPatterns = {"/UpdateCateController"})
public class UpdateCateController extends HttpServlet {
 private static final String ERROR = "GetAllCateController";
    private static final String SUCCESS = "GetAllCateController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
       boolean checkValid = true;
       
       ErrorCategory cateErr = new ErrorCategory();
        try { 
            String categoryID = request.getParameter("categoryID");
            String categoryName = request.getParameter("categoryName");
            CategoryDAO dao = new CategoryDAO();
           if (categoryID.isBlank() || categoryID.isEmpty()) {
                cateErr.setCategoryIDE("CategoryID cannot null!");
                checkValid = false;
            }
            if (categoryName.isBlank() || categoryName.isEmpty()) {
                cateErr.setCategoryNameE("CategoryName cannot null!");
                checkValid = false;
            }
            if (checkValid) {
                boolean checkUpdate = dao.update(categoryID, categoryName);
                if (checkUpdate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("UPDATE_ERROR", cateErr);
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
