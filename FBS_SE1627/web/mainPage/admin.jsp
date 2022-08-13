<%@page import="dto.controllers.UserDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- ======CSS Files===== -->
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/style.css">
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/skins/color-1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <!-- ======Style Switcher======= -->
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/skins/color-1.css" class="alternate-style" title="color-1" disabled>
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/skins/color-2.css" class="alternate-style" title="color-2" disabled>
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/skins/color-3.css" class="alternate-style" title="color-3" disabled>
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/skins/color-4.css" class="alternate-style" title="color-4" disabled>
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/skins/color-5.css" class="alternate-style" title="color-5" disabled>
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/style-switcher.css">
</head>

<body>
    <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().trim().equals("AD")) {
                response.sendRedirect("/FBS_SE1627/login_sigup/login.jsp");
                return;
            }
        %>
    <!-- =====Main Container Start===== -->
    <div class="main-container">
        <!-- Aside Start -->
        <div class="aside">
            <div class="logo">
                <a href="#"><span>FBS</span></a>
            </div>
            <div class="nav-toggler">
                <span></span>
            </div>
            <ul class="nav">
                <li><a href="#home" class="active"><i class="fa fa-home"></i> Home</a></li>
                <li><a href="#about"><i class="fa fa-user"></i> About</a></li>
                <li><a href="#services"><i class="fa fa-list"></i> Services</a></li>
                <li><a href="#portfolio"><i class="fa fa-usd"></i>Profit</a></li>
                <li><a href="/FBS_SE1627/MainController?action=ReadFeedBack&offset=1"><i class="fa fa-comments"></i>List FeedBack</a></li>
                <li><a href="/FBS_SE1627/MainController?action=Logout"><i class="fa fa-sign-out"></i>Sign out</a></li>
            </ul>
        </div>
        <!-- Aside End -->
        <!-- =====Main Content Start===== -->
        <div class="main-content">
            <!-- Home Section Start -->
            <section class="home active section" id="home">
                <div class="container">
                    <div class="row">
                        <div class="home-info padd-15">
                            <h3 class="hello">Your name is<span class="name"> <%= loginUser.getUserName()%></span></h3>
                            <h3 class="my-profession">Welcome to <span class="typing">Field Booking System</span></h3>
                            <p>Solve your problems about booking the field but don't want to go far, don't have
                                space-time. Let's come to Field Booking System: convenient, pay quickly, discount,
                                ....we serve you with the best services.
                            </p>
                            <a href="#services" data-section-index="0" class="btn hire-me">Management Now</a>
                        </div>
                        <div class="home-img padd-15">
                            <img src="https://wallpaperaccess.com/full/1876695.jpg" alt="">
                        </div>
                    </div>
                </div>
            </section>
            <!-- Home Section End-->
            <!-- About Section Start -->
            <section class="about section" id="about">
                <div class="container">
                    <div class="row">
                        <div class="section-title padd-15">
                            <h2>About</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="about-content padd-15">
                            <div class="row">
                                <div class="about-text padd-15">
                                    <h3 style="color:black">I'm <%=loginUser.getUserName()%><span>Profile</span></h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="personal-info padd-15">
                                    <div class="row">
                                        
                                        <div class="info-item padd-15">
                                            <p>Email : <span><%=loginUser.geteMail()%></span></p>
                                        </div>
                                        
                                        <div class="info-item padd-15">
                                            <p>Phone : <span><%=loginUser.getPhone()%></span></p>
                                        </div>
                                        
                                        <div class="info-item padd-15">
                                            <p>Address : <span><%=loginUser.getAddress()%></span></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="buttons padd-15">
                                            <a href="#" class="btn">Upload Avatar</a>
                                            <a href="#" class="btn">Edit Profile</a>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                            
                        </div>
                    </div>
                </div>
            </section>
            <!-- ==========About Section End===========-->
            <!-- ====Services Section Start======= -->
            <section class="service section" id="services">
                <div class="container">
                    <div class="row">
                        <div class="section-title padd-15">
                            <h2>Services</h2>
                        </div>
                    </div>
                    <div class="row">
                        <!-- ======Service item Start======= -->
                        <div class="service-item padd-15">
                            <div class="service-item-inner">
                                <a href="/FBS_SE1627/MainController?action=ReadListOrderConfirm&offset=1">
                                    <div class="icon">
                                        <i class="fa fa-mobile-alt"></i>
                                    </div>
                                    <h4>Order Field Confirm</h4>
                                    <p>You can see the status of your orders after you have paid the orders.</p>
                                </a>
                            </div>
                        </div>
                        <!-- ======Service item End======= -->
                        <!-- ======Service item Start======= -->
                        <div class="service-item padd-15">
                            <div class="service-item-inner">
                                <a href="/FBS_SE1627/MainController?action=Getall_Field">
                                    <div class="icon">
                                        <i class="fa fa-tasks"></i>
                                    </div>
                                    <h4>Management Fields</h4>
                                    <p>You will be able to choose the order you want to pay after booking the field.
                                    </p>
                                </a>
                            </div>
                        </div>
                        <!-- ======Service item End======= -->
                        <!-- ======Service item Start======= -->
                        <div class="service-item padd-15">
                            <div class="service-item-inner">
                                <a href="/FBS_SE1627/MainController?action=SearchOrderHistory&offset=1&search=">
                                    <div class="icon">
                                        <i class="fa fa-history"></i>
                                    </div>
                                    <h4>Customers History</h4>
                                    <p>You can review the history of your bookings. </p>
                                </a>
                            </div>
                        </div>
                        <!-- ======Service item End======= -->
                        <!-- ======Service item Start======= -->
                        <div class="service-item padd-15">
                            <div class="service-item-inner">
                                <a href="/FBS_SE1627/MainController?action=Getall_Slot">
                                    <div class="icon">
                                        <i class="fa fa-tasks"></i>
                                    </div>
                                    <h4>Management Slot</h4>
                                    <p>You can view and create new slot, update price and slot.
                                    </p>
                                </a>
                            </div>
                        </div>
                        <!-- ======Service item End======= -->
                        <!-- ======Service item Start======= -->
                        <div class="service-item padd-15">
                            <div class="service-item-inner">
                                <a href="/FBS_SE1627/mainPage/ad-services/booking.jsp">
                                    <div class="icon">
                                        <i class="fa fa-pencil-square"></i>
                                    </div>
                                    <h4>Direct Booking</h4>
                                    <p>Contains information about field prices, services and information about us. </p>
                                </a>
                            </div>
                        </div>
                        <!-- ======Service item End======= -->
                        <!-- ======Service item Start======= -->
                        <div class="service-item padd-15">
                            <div class="service-item-inner">
                                <a href="/FBS_SE1627/MainController?action=ReadNotification&offset=1">
                                    <div class="icon">
                                        <i class="fa fa-bullhorn"></i>
                                    </div>
                                    <h4>Notification</h4>
                                    <p>Notice of discounts, events and announcements of the field owner.</p>
                                </a>
                            </div>
                        </div>
                        <!-- ======Service item End======= -->
                    </div>
                </div>
            </section>
            <!-- ====Services Section End========= -->
            <!-- ==== Portfolio Section Start======= -->
            <section class="portfolio section" id="portfolio">
                <div class="container">
                    <div class="row">
                        <div class="section-title padd-15">
                            <h2>Statictis</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="portfolio-heading padd-15">
                            <h2>Table show data profit month</h2>
                        </div>
                    </div>
                    <div class="row">
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="https://o.rada.vn/data/image/2021/11/24/hinh-nen-anime-cho-may-tinh-11.jpg"
                                        alt="">
                                </div>
                            </div>
                        </div>
                        <!-- ====== Portfolio item End====== -->
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="https://o.rada.vn/data/image/2021/11/24/hinh-nen-anime-cho-may-tinh-11.jpg"
                                        alt="">
                                </div>
                            </div>
                        </div>
                        <!-- ====== Portfolio item End====== -->
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="https://o.rada.vn/data/image/2021/11/24/hinh-nen-anime-cho-may-tinh-11.jpg"
                                        alt="">
                                </div>
                            </div>
                        </div>
                        <!-- ====== Portfolio item End====== -->
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- ====== Portfolio item End====== -->
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- ====== Portfolio item End====== -->
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- ====== Portfolio item End====== -->
                    </div>
                </div>
            </section>
            <!-- ==== Portfolio Section End======= -->
            <!-- ==== Contact Section Start======= -->
            <section class="contact section" id="contact">
                <div class="container">
                    <div class="row">
                        <div class="section-title padd-15">
                            <h2>Contact Me</h2>
                        </div>
                    </div>
                    <h3 class="contact-title padd-15">Have You Any Questions ?</h3>
                    <h4 class="contact-sub-title padd-15">I'M AT YOUR SERVICES</h4>
                    <div class="row">
                        <!-- ======= Contact info item start ====== -->
                        <div class="contact-info-item padd-15">
                            <div class="icon"><i class="fa fa-phone"></i></div>
                            <h4>Call Us On</h4>
                            <p>+84 336785395</p>
                        </div>
                        <!-- ======= Contact info item end ====== -->
                        <!-- ======= Contact inffo item start ====== -->
                        <div class="contact-info-item padd-15">
                            <div class="icon"><i class="fa fa-map-marker-alt"></i></div>
                            <h4>Office</h4>
                            <p>FPT University</p>
                        </div>
                        <!-- ======= Contact info item end ====== -->
                        <!-- ======= Contact inffo item start ====== -->
                        <div class="contact-info-item padd-15">
                            <div class="icon"><i class="fa fa-envelope"></i></div>
                            <h4>Email</h4>
                            <p>anhtqse150628@fpt.edu.vn</p>
                        </div>
                        <!-- ======= Contact inffo item end ====== -->
                        <!-- ======= Contact inffo item start ====== -->
                        <div class="contact-info-item padd-15">
                            <div class="icon"><i class="fa fa-globe-europe"></i></div>
                            <h4>Website</h4>
                            <p>www.bookingsystemfootball.com</p>
                        </div>
                        <!-- ======= Contact inffo item end ====== -->
                    </div>
                    <h3 class="contact-title padd-15">SEND ME AN EMAIL</h3>
                    <h4 class="contact-sub-title padd-15">I'M VERY WIBU</h4>
                    <!-- ====== Contact Form ========= -->
                    <div class="row">
                        <div class="contact-form padd-15">
                            <div class="row">
                                <div class="form-item col-6 padd-15">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Name">
                                    </div>
                                </div>
                                <div class="form-item col-6 padd-15">
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-item col-12 padd-15">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Subject">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-item col-12 padd-15">
                                    <div class="form-group">
                                        <textarea name="" class="form-control" id="" placeholder="Message"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-item col-12 padd-15">
                                    <button type="submit" class="btn">Send Message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ==== Contact Section End ==== -->


        </div>
        <!-- =====Main Content End===== -->
    </div>
    <!-- =====Main Container End===== -->
    <!-- ==========Style Switcher Start========== -->
    <div class="style-switcher">
        <div class="style-switcher-toggler s-icon">
            <i class="fas fa-cog fa-spin"></i>
        </div>
        <div class="day-night s-icon">
            <i class="fas fa-moon"></i>
        </div>
        <h4>Theme Colors</h4>
        <div class="colors">
            <span class="color-1" onclick="setActiveStyle('color-1')"></span>
            <span class="color-2" onclick="setActiveStyle('color-2')"></span>
            <span class="color-3" onclick="setActiveStyle('color-3')"></span>
            <span class="color-4" onclick="setActiveStyle('color-4')"></span>
            <span class="color-5" onclick="setActiveStyle('color-5')"></span>
        </div>
    </div>
    <!-- ==========Style Switcher End========== -->

    <!-- ===JS Files=== -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.12/typed.min.js"
        referrerpolicy="no-referrer"></script>
    <script src="/FBS_SE1627/mainPage/js/scripts.js"></script>
    <script src="/FBS_SE1627/mainPage/js/style-switcher.js"></script>
</body>


</html>