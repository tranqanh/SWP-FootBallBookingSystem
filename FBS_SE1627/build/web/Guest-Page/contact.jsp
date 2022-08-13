<%@page import="error.controllers.ErrorFeedBack"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Field Booking Website</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/animate.css">

        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/magnific-popup.css">

        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/aos.css">

        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/ionicons.min.css">

        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/jquery.timepicker.css">

        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/icomoon.css">
        <link rel="stylesheet" href="/FBS_SE1627/Guest-Page/css/style.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="/FBS_SE1627/Guest-Page/index.jsp">Field<span>Book</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item "><a href="/FBS_SE1627/Guest-Page/index.jsp" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="/FBS_SE1627/Guest-Page/about.jsp" class="nav-link">About</a></li>
                        <li class="nav-item"><a href="/FBS_SE1627/Guest-Page/services.jsp" class="nav-link">Services</a></li>
                        <li class="nav-item"><a href="/FBS_SE1627/Guest-Page/PriceAndPay.jsp" class="nav-link">Price & Pay</a></li>
                        <li class="nav-item active"><a href="/FBS_SE1627/Guest-Page/contact.jsp" class="nav-link">Contact</a></li>
                        <li class="nav-item"><a href="/FBS_SE1627/login_sigup/login.jsp" class="nav-link">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/FBS_SE1627/Guest-Page/images/bg_head.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
                    <div class="col-md-9 ftco-animate pb-5">
                        <p class="breadcrumbs"><span class="mr-2"><a href="/FBS_SE1627/Guest-Page/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
                        <h1 class="mb-3 bread">Contact Us</h1>
                    </div>
                </div>
            </div>
        </section>

        <section id="header" class="ftco-section contact-section">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="col-md-4">
                        <div class="row mb-5">
                            <div class="col-md-12">
                                <div class="border w-100 p-4 rounded mb-2 d-flex">
                                    <div class="icon mr-3">
                                        <span class="icon-map-o"></span>
                                    </div>
                                    <p><span>Address:</span> 75 Đ. Huỳnh Thị Hai, Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh</p>
                                </div>
                            </div>
                            <div class="col-md-12">

                                <div class="border w-100 p-4 rounded mb-2 d-flex">
                                    <div class="icon mr-3">
                                        <span class="icon-mobile-phone"></span>
                                    </div>
                                    <p><span>Phone:</span> <a href="tel://0932737237">+  093 273 72 37</a></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="border w-100 p-4 rounded mb-2 d-flex">
                                    <div class="icon mr-3">
                                        <span class="icon-envelope-o"></span>
                                    </div>
                                    <p><span>Email:</span> <a href="mailto:duy56236@gmail.com">duy56236@gmail.com</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        ErrorFeedBack fbError = (ErrorFeedBack) request.getAttribute("FEEDBACK_ERROR");
                        if (fbError == null) {
                            fbError = new ErrorFeedBack();
                        }
                    %>
                    <div class="col-md-8 block-9 mb-md-5">
                        <form action="/FBS_SE1627/MainController" class="bg-light p-5 contact-form">
                            <div class="form-group">
                                <input type="text" name="UserName" class="form-control" placeholder="Your Name">
                                <p><%=fbError.getErrorName()%></p>
                            </div>

                            <div class="form-group">
                                <input type="tel" name="Phone" class="form-control" placeholder="Your Phone">
                                <p><%=fbError.getErrorPhone()%></p>
                            </div>

                            <div class="form-group">
                                <textarea  name="Message" id="Message" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                                <p><%=fbError.getErrorContent()%></p>
                            </div>

                            <div class="form-group">
                                <input type="submit" name="action" value="SendFeedBack" class="btn btn-primary py-3 px-5">
                            </div>
                            <%
                                String errorlog = (String) request.getAttribute("LOG_ERROR");
                                if (errorlog == null) {
                                    errorlog = "";
                                }
                            %>
                            <p style="color: red"><%=errorlog%></p>
                        </form>

                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div id="" class="bg-white"></div>
                    </div>
                </div>
            </div>
        </section>


        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2"><a href="/FBS_SE1627/Guest-Page/index.jsp" class="logo">Field<span>book</span></a></h2>
                            <p>Solve your problems about booking the field but don't want to go far, don't have space-time. Let's come to Field Booking System: convenient, pay quickly, discount, ....we serve you with the best services.</p>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Information</h2>
                            <ul class="list-unstyled">
                                <li><a href="/FBS_SE1627/Guest-Page/about.jsp" class="py-2 d-block">About</a></li>
                                <li><a href="/FBS_SE1627/Guest-Page/services.jsp" class="py-2 d-block">Services</a></li>
                                <li><a href="#header" class="py-2 d-block">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have a Questions?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">75 Đ. Huỳnh Thị Hai, Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh</span></li>
                                    <li><a href="error.jsp"><span class="icon icon-phone"></span><span class="text"> 093 273 72 37</span></a></li>
                                    <li><a href="error.jsp"><span class="icon icon-envelope"></span><span class="text">duy56236@gmail.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<!--        <script src="/FBS_SE1627/Guest-Page/ckeditor/ckeditor.js"></script>
        <script>
            CKEDITOR.replace('Message');
        </script>-->

        <script src="/FBS_SE1627/Guest-Page/js/jquery.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/popper.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/bootstrap.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/jquery.easing.1.3.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/jquery.waypoints.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/jquery.stellar.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/owl.carousel.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/jquery.magnific-popup.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/aos.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/jquery.animateNumber.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/bootstrap-datepicker.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/jquery.timepicker.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/scrollax.min.js"></script>
        <script src="/FBS_SE1627/Guest-Page/js/main.js"></script>


    </body>
</html>