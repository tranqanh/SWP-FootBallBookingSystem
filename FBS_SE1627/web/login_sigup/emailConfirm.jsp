<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="/FBS_SE1627/login_sigup/css/styleEC.css">

    </head>
    <body class="auth_class">

        <div class="container login-container">
            <img class="triangleA" src="https://res.cloudinary.com/procraftstudio/image/upload/v1613965232/triangleA_lwqhnl.png" alt='Onestop triangle'>
            <div class="row">
                <div class="col-md-6 welcome_auth">
                    <img src="https://cdn-icons-png.flaticon.com/512/1000/1000948.png" width="100%">
                </div>         
                <div class="col-md-6 login-form">
                    <div class="login_form_in">
                        <div class="auth_branding">
                            <a class="auth_branding_in"><img src="/FBS_SE1627/login_sigup/logo.png"></a>
                        </div>
                        <h1 class="auth_title text-left">Password Reset</h1>
                        <form action="/FBS_SE1627/MainController"  method="post">
                            <div class="alert alert-success bg-soft-primary border-0" role="alert">
                                Enter your email address and we'll send you an email with instructions to reset your password.
                            </div>                    
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" placeholder="Email Address">
                            </div>
                            <div class="form-group">
                                <button  type="submit" name="action" value="ForgetPassword" class="btn btn-primary btn-lg btn-block">Reset Password</button>
                            </div>
                            <div class="form-group other_auth_links">
                                <a class="" href="/FBS_SE1627/login_sigup/login.jsp">Login</a>
                                <a class="" href="/FBS_SE1627/login_sigup/login.jsp">Register</a>
                            </div>

                        </form>
                        <%
                            String error = (String) request.getAttribute("ForgetP_ERROR");
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <p style="color: red"><%=error%></p>
                    </div>
                </div>       
            </div>
        </div>

        <img class="triangleB" src="https://res.cloudinary.com/procraftstudio/image/upload/v1613965232/triangleB_isffjy.png" alt='Onestop triangle'>
    </body>

</html>