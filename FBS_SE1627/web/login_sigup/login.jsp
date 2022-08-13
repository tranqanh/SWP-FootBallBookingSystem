<%-- 
    Document   : login
    Created on : Jun 16, 2022, 1:29:00 PM
    Author     : Trong Duy
--%>
<%@page import="dto.controllers.UserDTO"%>
<%@page import="error.controllers.ErrorRegister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/FBS_SE1627/login_sigup/css/styles.css">
        <title>Login</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="title-text">
                <div class="title login">Login Form</div>
                <div class="title signup">Sign up Form</div>
            </div>
            <div class="form-container">
                <div class="slide-controls">
                    <input type="radio" name="slide" id="login" checked>
                    <input type="radio" name="slide" id="signup">
                    <label for="login" class="slide login">Login</label>
                    <label for="signup" class="slide signup">Sign Up</label>
                    <div class="slider-tab"></div>
                </div>
                <div class="form-inner">
                    <form action="/FBS_SE1627/MainController" class="login" method="post">
                        <div class="field">
                            <input type="text" name="UserID" placeholder="User Name" required>
                        </div>
                        <div class="field">
                            <input type="password" name="Password" placeholder="Password" required>
                        </div>
                        <div class="pass-link"><a href="/FBS_SE1627/login_sigup/emailConfirm.jsp">Forgot password?</a></div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" name="action" value="Login">
                        </div>
                        <%
                            String error = (String) request.getAttribute("LOG_ERROR");
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <p style="color: red"><%=error%></p>
                        <div class="signup-link">Not a member? <a href="/FBS_SE1627/login_sigup/login.jsp">Sign up now</a></div>
                    </form>
                    
                    <%
                        ErrorRegister userError = (ErrorRegister) request.getAttribute("REGISTERUSER_ERROR");
                        if (userError == null) {
                            userError = new ErrorRegister();
                        }
                    %>
                    
                    <%
                        UserDTO userFill = (UserDTO) request.getAttribute("REGISTERUSER_FILL");
                        if (userFill == null) {
                            userFill = new UserDTO();
                        }
                    %>
                    
                    <form  action="/FBS_SE1627/MainController" class="signup" id="formSWP" method="post">

                        <div class="field" in="sigup">
                            <input type="text" name="newUserID" id="userID" placeholder="User Name" required value="<%=userFill.getUserID()%>">
                            <span class="form-message"></span>
                            <p style="color: red"><%=userError.getUserNameError()%></p>
                        </div>
                        <div class="field">
                            <input type="text" name="newEmail" id="email" placeholder="Email Address" required value="<%=userFill.geteMail()%>">
                            <span class="form-message"></span>
                            <p style="color: red"><%=userError.getUserEmailError()%></p>
                        </div>
                        <div class="field">
                            <input type="text" name="newPhone" id="phone" placeholder="Phone" required value="<%=userFill.getPhone()%>">
                            <span class="form-message"></span>
                            <p style="color: red"><%=userError.getPhoneError()%></p>
                        </div>
                        <div class="field">
                            <input type="password" name="newPassword" id="password" placeholder="Password" required value="<%=userFill.getUserPassword()%>">
                            <span class="form-message"></span>
                        </div>
                        <div class="field">
                            <input type="password" name="newPconfirm" id="password_confirm" placeholder="Confirm password" required>
                            <span class="form-message"></span>
                            <p style="color: red"><%=userError.getPasswordError()%></p>
                        </div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" name="action" value="Signup">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--js-->
        <script src="/FBS_SE1627/login_sigup/js/scripts.js"></script>
        <script>
            CheckURL("${sessionScope.VALID_SIGN}");
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Mong muốn của chúng ta
                Validator({
                    form: '#formSWP',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#userID', 'Please re-enter Username'),
                        Validator.isEmail('#email', 'Email is not correct'),
                        Validator.minLength('#password', 6, 'Enter at least 6 characters'),
                        Validator.isPhone('#phone', 'Please re-enter your phone number'),
                        Validator.isConfirmed('#password_confirm', function () {
                            return document.querySelector('#formSWP #password').value;
                        }, 'Re-entered password is incorrect')
                    ],
                });
            });
        </script>
    </body>
</html>
