<%-- 
    Document   : userProfile
    Created on : Jun 26, 2022, 7:30:45 PM
    Author     : Trong Duy
--%>


<%@page import="dto.controllers.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="/FBS_SE1627/login_sigup/css/userprofile.css">
        <script src="/FBS_SE1627/login_sigup/js/scriptsChangePass.js"></script>
        <title>Change Password</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().trim().equals("US")) {
                response.sendRedirect("/FBS_SE1627/login_sigup/login.jsp");
                return;
            }
        %>
        <%
            String changePass = (String) session.getAttribute("CHANGE_SUCCESS");
            if (changePass == null) {
                changePass = "";
            }
        %>
        <div class="container bootstrap snippets bootdey">
            <h1 class="text-primary">My Profile</h1>
            <hr>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                    <div class="text-center">
                        <img src="icon/cv__29__generated.jpg" class="avatar img-circle img-thumbnail" alt="avatar">
                    </div>
                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <h3>Change password</h3>

                    <form action="/FBS_SE1627/MainController" class="form-horizontal" role="form" method="post" id="changePass">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">A new password:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="password" id="newPass" name="newPass">
                                <span class="form-message"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Confirm password:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="password" id="password_confirm">
                                <span class="form-message"></span>
                            </div>
                        </div>
                        <input name="userID" value="<%= loginUser.getUserID() %>" hidden>
                        <div class="form-row">
                            <button type="submit" name="action" value="ChangePassword" class="btn btn-primary">Save</button>
                        </div>

                </div>
                </form>
            </div>
        </div>
    </div>
    <button class="btn btn-success">
        <a  href="/FBS_SE1627/Guest-Page/index.jsp" > Back</a>
    </button>    
    <hr>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Mong muốn của chúng ta
            Validator({
                form: '#changePass',
                errorSelector: '.form-message',
                rules: [
                    Validator.minLength('#newPass', 6, 'Enter at least 6 characters'),
                    Validator.isConfirmed('#password_confirm', function () {
                        return document.querySelector('#changePass #newPass').value;
                    }, 'Re-entered password is incorrect')
                ],
            });
        });
    </script>
</body>
</html>
