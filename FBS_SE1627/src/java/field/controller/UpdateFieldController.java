/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package field.controller;

import dao.controllers.FieldDAO;
import error.controllers.ErrorField;
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
@WebServlet(name = "UpdateFieldController", urlPatterns = {"/UpdateFieldController"})
public class UpdateFieldController extends HttpServlet {

   private static final String ERROR = "GetAllFieldController";
    private static final String SUCCESS = "GetAllFieldController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
       boolean checkValid = true;
       
       ErrorField fieldErr = new ErrorField();
        try { 
            String fieldName = request.getParameter("fieldName");
            String categoryID = request.getParameter("categoryID");
            String fieldID = request.getParameter("fieldID");
            FieldDAO dao = new FieldDAO();
            if (fieldName.isBlank() || fieldName.isEmpty()) {
                fieldErr.setFieldName("FieldName cannot null!");
                checkValid = false;
            }
            if (checkValid) {
                boolean checkUpdate = dao.update(fieldID,categoryID, fieldName);
                if (checkUpdate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("UPDATE_ERROR_F", fieldErr);
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
