/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chien
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    //dang nhap
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    //log out
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    //register
    private static final String RE = "Signup";
    private static final String RE_CONTROLLER = "RegisterController";
    //order
    private static final String BR = "BookRequest";
    private static final String BR_CONTROLLER = "BookingrequestController";
    //send feedback
    private static final String SF = "SendFeedBack";
    private static final String SF_CONTROLLER = "SendFeedBackController";

    //load slot
    private static final String SLOTLOAD = "LoadSlot";
    private static final String SLOTLOAD_CONTROLLER = "LoadSlotController";
    
    //quen mk
    private static final String FP ="ForgetPassword";
    private static final String FP_CONTROLLER ="ForgetPasswordController";


    //booking confirm
    private static final String BOOKCONFIRM = "BookConfirm";
    private static final String BOOKCONFIRM_CONTROLLER = "BookConfirmController";

    //booking auto reject 
    private static final String BOOKREJECT = "Bookreject";
    private static final String BOOKREJECT_CONTROLLER = "BookrejectController";

    //payment
    private static final String PAYMENT = "Payment";
    private static final String PAYMENT_CONTROLLER = "PaymentController";
    //pay
    private static final String PAY = "Pay";
    private static final String PAY_CONTROLLER = "PayController";
    //payment remove
    private static final String REMOVECART = "RemoveCart";
    private static final String REMOVECART_CONTROLLER = "RemoveCartController";
    //check out
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";

    //read feedback
    private static final String RF = "ReadFeedBack";
    private static final String RF_CONTROLLER = "ReadFeedBackController";
    //delete feedback
    private static final String DF = "DeleteFeedBack";
    private static final String DF_CONTROLLER = "DeleteFeedBackController";
    //user send feedback
    private static final String USF = "UserFeedBack";
    private static final String USF_CONTROLLER = "UserFeedBackController";
    //read notification
    private static final String RN = "ReadNotification";
    private static final String RN_CONTROLLER = "ReadNotificationController";
    //delete notification
    private static final String DN = "DeleteNotification";
    private static final String DN_CONTROLLER = "DeleteNotificationController";
    //send notification
    private static final String SN = "SendNotification";
    private static final String SN_CONTROLLER = "SendNotificationController";
    //user read notification
    private static final String URN = "UserReadNotification";
    private static final String URN_CONTROLLER = "UserReadNotificationController";
    //search order history
    private static final String SOH = "SearchOrderHistory";
    private static final String SOH_CONTROLLER = "SearchOrderHistoryController";
    //user search order history
    private static final String USOH = "UserSearchOrderHistory";
    private static final String USOH_CONTROLLER = "UserSearchOrderHistoryController";
    
    private static final String RLOC = "ReadListOrderConfirm";
    private static final String RLOC_CONTROLLER = "ReadListOrderConfirmController";
    
    private static final String OD = "OrderConfirm";
    private static final String OD_CONTROLLER = "OrderConfirmController";
    
    private static final String OR = "OrderReject";
    private static final String OR_CONTROLLER = "OrderRejectController";
    
    //create category
    private static final String CREATE_CATE = "Add_Cate";
    private static final String CREATE_CATE_CONTROLLER = "CreateCateController";
    //update category
    private static final String UPDATE_CATE = "Up_Cate";
    private static final String UPDATE_CATE_CONTROLLER = "UpdateCateController";
    //delete category
    private static final String DELETE_CATE = "De_Cate";
    private static final String DELETE_CATE_CONTROLLER = "DeleteCateController";
    //getallCate
    private static final String GETALL_CATE = "Getall_Cate";
    private static final String GETALL_CATE_CONTROLLER = "GetAllCateController";
    
    //create new field
    private static final String CREATE_FIELD = "Add_Field";
    private static final String CREATE_FIELD_CONTROLLER = "CreateFieldController";
    //update field
    private static final String UPDATE_FIELD = "Up_Field";
    private static final String UPDATE_FIELD_CONTROLLER = "UpdateFieldController";
    //delete category
    private static final String DELETE_FIELD = "De_Field";
    private static final String DELETE_FIELD_CONTROLLER = "DeleteFieldController";
    //getallCate
    private static final String GETALL_FIELD = "Getall_Field";
    private static final String GETALL_FIELD_CONTROLLER = "GetAllFieldController";
    
        //create new field
    private static final String CREATE_SLOT = "Add_Slot";
    private static final String CREATE_SLOT_CONTROLLER = "CreateSlotController";
    //update field
    private static final String UPDATE_SLOT = "Up_Slot";
    private static final String UPDATE_SLOT_CONTROLLER = "UpdateSlotController";
    //delete category
    private static final String DELETE_SLOT = "De_Slot";
    private static final String DELETE_SLOT_CONTROLLER = "DeleteSlotController";
    //getallSlot
    private static final String GETALL_SLOT = "Getall_Slot";
    private static final String GETALL_SLOT_CONTROLLER = "GetAllSlotController";
    
     private static final String URLO = "UserReadListOrder";
    private static final String URLO_CONTROLLER = "UserReadListOrderController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (RE.equals(action)) {
                url = RE_CONTROLLER;
            } else if (BR.equals(action)) {
                url = BR_CONTROLLER;
            } else if (SF.equals(action)) {
                url = SF_CONTROLLER;
            } else if (SLOTLOAD.equals(action)) {
                url = SLOTLOAD_CONTROLLER;
            } else if (BOOKCONFIRM.equals(action)) {
                url = BOOKCONFIRM_CONTROLLER;
            } else if (BOOKREJECT.equals(action)) {
                url = BOOKREJECT_CONTROLLER;
            } else if (RF.equals(action)) {
                url = RF_CONTROLLER;
            } else if (DF.equals(action)) {
                url = DF_CONTROLLER;
            } else if (USF.equals(action)) {
                url = USF_CONTROLLER;
            } else if (RN.equals(action)) {
                url = RN_CONTROLLER;
            } else if (DN.equals(action)) {
                url = DN_CONTROLLER;
            } else if (SN.equals(action)) {
                url = SN_CONTROLLER;
            } else if (URN.equals(action)) {
                url = URN_CONTROLLER;
            } else if (SOH.equals(action)) {
                url = SOH_CONTROLLER;
            } else if (USOH.equals(action)) {
                url = USOH_CONTROLLER;
            } else if (PAYMENT.equals(action)) {
                url = PAYMENT_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (REMOVECART.equals(action)) {
                url = REMOVECART_CONTROLLER;
            } else if (PAY.equals(action)) {
                url = PAY_CONTROLLER;
            } else if (FP.equals(action)) {
                url = FP_CONTROLLER;
            }else if (RLOC.equals(action)) {
                url = RLOC_CONTROLLER;
            }else if (OD.equals(action)) {
                url = OD_CONTROLLER;
            }else if (OR.equals(action)) {
                url = OR_CONTROLLER;
            } else if (CREATE_CATE.equals(action)) {
                url = CREATE_CATE_CONTROLLER;
            } else if(UPDATE_CATE.equals(action)) {
                url = UPDATE_CATE_CONTROLLER;
            } else if(DELETE_CATE.equals(action)) {
                url = DELETE_CATE_CONTROLLER;
            } else if(GETALL_CATE.equals(action)) {
                url=GETALL_CATE_CONTROLLER;
            } else if (CREATE_FIELD.equals(action)) {
                url = CREATE_FIELD_CONTROLLER;
            } else if(UPDATE_FIELD.equals(action)) {
                url = UPDATE_FIELD_CONTROLLER;
            } else if(DELETE_FIELD.equals(action)) {
                url = DELETE_FIELD_CONTROLLER;
            } else if(GETALL_FIELD.equals(action)) {
                url=GETALL_FIELD_CONTROLLER;
            } else if(GETALL_SLOT.equals(action)) {
                url=GETALL_SLOT_CONTROLLER;
            } else if (CREATE_SLOT.equals(action)) {
                url = CREATE_SLOT_CONTROLLER;
            } else if(UPDATE_SLOT.equals(action)) {
                url = UPDATE_SLOT_CONTROLLER;
            } else if(DELETE_SLOT.equals(action)) {
                url = DELETE_SLOT_CONTROLLER;
            }else if (URLO.equals(action)) {
                url = URLO_CONTROLLER;
            }
        } catch (Exception e) {
            log("error at MainController: " + e.toString());
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
