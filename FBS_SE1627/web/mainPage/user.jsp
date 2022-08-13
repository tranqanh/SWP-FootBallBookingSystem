<%@page import="dto.controllers.UserDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
            if (loginUser == null || !loginUser.getRoleID().trim().equals("US")) {
                response.sendRedirect("/FBS_SE1627/login_sigup/login.jsp");
                return;
            }
        %>
        <!-- =====Main Container Start===== -->
        <div class="main-container">
            <!-- Aside Start -->
            <div class="aside">
                <div class="logo">
                    <a href="/FBS_SE1627/mainPage/user.jsp"><span>FBS</span></a>
                </div>
                <div class="nav-toggler">
                    <span></span>
                </div>
                <ul class="nav">
                    <li><a href="#home" class="active" style="text-decoration: none;"><i class="fa fa-home"></i> Home</a>
                    </li>
                    <li><a href="#about" style="text-decoration: none;"><i class="fa fa-user"></i> About</a></li>
                    <li><a href="#services" style="text-decoration: none;"><i class="fa fa-list"></i> Services</a></li>
                    <li><a href="#portfolio" style="text-decoration: none;"><i class="fa fa-cart-plus"></i> Booking</a></li>
                    <li><a href="#contact" style="text-decoration: none;"><i class="fa fa-comments"></i> Contact</a></li>
                    <li>
                        <a href="/FBS_SE1627/MainController?action=Logout" style="text-decoration: none;"><i class="fa fa-sign-out"></i> Sign out</a>
                    </li>
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
                                <h3 class="hello">Your name is<span class="name"> <%= loginUser.getUserName() %> </span></h3>
                                <h3 class="my-profession">Welcome to <span class="typing">Field Booking System</span></h3>
                                <p>Solve your problems about booking the field but don't want to go far, don't have
                                    space-time. Let's come to Field Booking System: convenient, pay quickly, discount,
                                    ....we serve you with the best services.
                                </p>
                                <a href="#portfolio" data-section-index="0" class="btn hire-me">Booking Now</a>

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
                                        <h3 style="color:black">I'm <%= loginUser.getUserName()%> <span>Profile</span></h3>
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
                                    <div class="skills padd-15">
                                        <div class="row">
                                            <div class="skill-item padd-15">
                                                <h5>Point: </h5>
                                                <div class="progress">
                                                    <div class="progress-in" style="width: <%=loginUser.getPoint()%>%;"></div>
                                                    <div class="skill-percent"><%=loginUser.getPoint()%>%</div>
                                                </div>
                                                <img src="https://static.vecteezy.com/system/resources/previews/005/174/815/original/cute-cartoon-gift-box-present-with-bows-and-ribbons-celebration-surprise-present-free-vector.jpg" width="100%" height="90%" style="margin-top:20px ;">
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
                            <div class="service-item padd-15" >
                                <div class="service-item-inner">
                                    <a href="/FBS_SE1627/MainController?action=UserReadListOrder&offset=1&userID=<%=loginUser.getUserID()%>" style="text-decoration: none;">
                                        <div class="icon">
                                            <i class="fa fa-mobile-alt"></i>
                                        </div>
                                        <h4>Order Field Status</h4>
                                        <p>You can see the status of your orders after you have paid the orders.</p>
                                    </a>
                                </div>
                            </div>
                            <!-- ======Service item End======= -->
                            <!-- ======Service item Start======= -->
                            <div class="service-item padd-15">
                                <div class="service-item-inner">
                                    <a href="/FBS_SE1627/MainController?action=Payment&UserID=<%=loginUser.getUserID()%>" style="text-decoration: none;">
                                        <div class="icon">
                                            <i class="fa fa-credit-card">
                                            </i>
                                        </div>
                                        <h4>Payment Booking</h4>
                                        <p>You will be able to choose the order you want to pay after booking the field.
                                        </p>
                                    </a>
                                </div>

                            </div>
                            <!-- ======Service item End======= -->
                            <!-- ======Service item Start======= -->
                            <!-- fix this shit -->
                            <div class="service-item padd-15">
                                <div class="service-item-inner">
                                    <a href="/FBS_SE1627/MainController?action=UserSearchOrderHistory&offset=1&search=&userID=<%=loginUser.getUserID()%>" style="text-decoration: none;">
                                        <div class="icon">
                                            <i class="fa fa-history"></i>
                                        </div>
                                        <h4>History</h4>
                                        <p>You can review the history of your bookings. </p>
                                    </a>
                                </div>
                            </div>
                            <!-- ======Service item End======= -->
                            <!-- ======Service item Start======= -->
                            <div class="service-item padd-15">
                                <div class="service-item-inner">
                                    <a data-toggle="modal" data-target="#feedbackModal">
                                        <div class="icon">
                                            <i class="fa fa-comments"></i>
                                        </div>
                                        <h4>FeedBack</h4>
                                        <p>You can feed back with the field owner about the service you have experienced.
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <!-- ======Service item End======= -->
                            <!-- ======Service item Start======= -->
                            <div class="service-item padd-15">
                                <div class="service-item-inner">
                                    <a data-toggle="modal" data-target="#orderInformation">
                                        <div class="icon">
                                            <i class="fa fa-search"></i>
                                        </div>
                                        <h4>Information</h4>
                                        <p>Contains information about field prices, services and information about us. </p>
                                    </a>
                                </div>
                            </div>
                            <!-- ======Service item End======= -->
                            <!-- ======Service item Start======= -->
                            <div class="service-item padd-15">
                                <div class="service-item-inner">
                                    <a href="/FBS_SE1627/MainController?action=UserReadNotification&offset=1" style="text-decoration: none;">
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
                                <h2>Book Field</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="portfolio-heading padd-15">
                                <h2>Please choose soccer field you want:</h2>
                            </div>
                        </div>
                        <div class="row">
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="https://blog.playo.co/wp-content/uploads/2018/09/5-a-side-Football-dimension-coverimage-1.jpg" alt="Field 5" style="width:100%;">
                                </div>

                            </div>
                            <a href="/FBS_SE1627/MainController?action=LoadSlot&FieldType=F5" class="bo" >BOOKING</a>
                        </div>
                        <!-- ====== Portfolio item End====== -->
                        <!-- ====== Portfolio item Start====== -->
                        <div class="portfolio-item padd-15">
                            <div class="portfolio-item-inner shadow-dark">
                                <div class="porfolio-img">
                                    <img src="https://blog.playo.co/wp-content/uploads/2018/09/7-a-side-Football-dimension-coverimage.jpg" alt="Field 7" style="width:100% ;" >
                                </div>
                            </div>
                            <a href="/FBS_SE1627/MainController?action=LoadSlot&FieldType=F7" class="bo">BOOKING</a>
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
                                            <textarea name="Message" class="form-control" id="Message"
                                                      placeholder="Message"></textarea>
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
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- ==========Style Switcher End========== -->



        <!-- ======================Modal Information======================== -->
        <div class="modal fade" id="orderInformation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel" style="color: red;">Information</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row justify-content-center mb-3">
                            <div class="col-md-7 text-center heading-section ftco-animate">
                                <h2 class="mb-3" style="color: rgb(13, 146, 235);">Price</h2>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <h3 style="margin-left: 100px;">Field 5</h3>
                                <table width="100%" height="300px" class="table-bordered table-sm">
                                    <thead>
                                        <tr style="color: red;">
                                            <th>Time</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>7h - 11h</td>
                                            <td>160.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>11h - 15h</td>
                                            <td> 120.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>15h - 18h</td>
                                            <td>250.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>18h - 20h</td>
                                            <td>300.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>20h - 22h</td>
                                            <td>240.000VND/Match</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6 ">
                                <h3 style="margin-left: 100px;">Field 7</h3>
                                <table width="100%" height="300px" class="table-bordered table-sm">
                                    <thead>
                                        <tr style="color: red;">
                                            <th>Time</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>7h-11h</td>
                                            <td>300.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>11h - 15h</td>
                                            <td>250.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>15h - 18h</td>
                                            <td>450.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>18h - 20h</td>
                                            <td>600.000VND/Match</td>
                                        </tr>
                                        <tr>
                                            <td>20h - 22h</td>
                                            <td>450.000VND/Match</td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                        <div class="col-md7 text-center heading-section ftco-animate mt-4">
                            <h2 class="mb-3" style="color: rgb(13, 146, 235);">Payment</h2>
                            <div class="row">
                                <div class="card mt-4 col-6 col-md-12">
                                    <img style="margin-top: 20px;" class="card-img-top card-img-overlay"
                                         src="/FBS_SE1627/mainPage/user-services/images/payment.png" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Momo Payment</h5>
                                        <p class="card-text" style="color: red;">STK: 0976642068 </p>
                                        <p class="card-text">Name: Tran Quang Anh</p>
                                        <p class="card-text">Please transfer with the content as Name + Yard + Time</p>
                                    </div>
                                </div>
                                <div class="card mt-4 col-6 col-md-12">
                                    <img style="margin-top: 20px;" class="card-img-top card-img-overlay"
                                         src="/FBS_SE1627/mainPage/user-services/images/pay-card.svg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Banking Online</h5>
                                        <p class="card-text" style="color: red;">STK: 0123 4567 8888 9999 </p>
                                        <p class="card-text">Bank: Tp Bank, Name:  Tran Quang Anh</p>
                                        <p class="card-text">Please transfer with the content as Name + Yard + Time</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- ======================Modal Information End===================== -->

        <!-- Modal feedback-->
        <div id="feedbackModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title">Feedback</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group row">
                                <label class="col-12 deco">
                                    <p><b>Your opinion matter</b></p>
                                    <i class="fa fa-book fa-lg" aria-hidden="true"></i>
                                    <p>Have some idea to improve our services ? </p>
                                    <b>Tell us by your Feedback</b>

                                </label>
                            </div>

                            <div class="form-group row">
                                <label for="content" class="col-form-label"><b> What could we improve? </b><i
                                        class="fa fa-futbol-o" aria-hidden="true"></i></label>
                                <div class="col-12">
                                    <textarea class="form-control" id="content" name="content" rows="5" required
                                              onKeyDown="limitText(this.form.content, this.form.countdown, 1024);"
                                              onKeyUp="limitText(this.form.content, this.form.countdown, 1024);"></textarea>
                                </div>
                            </div>

                            <div class="col-12">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Send Feedback</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>



            <!-- ===JS Files=== -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.12/typed.min.js"
            referrerpolicy="no-referrer"></script>
            <script src="/FBS_SE1627/mainPage/js/scripts.js"></script>
            <script src="/FBS_SE1627/mainPage/js/style-switcher.js"></script>
            <script type="text/javascript">
                                                  function limitText(limitField, limitCount, limitNum) {
                                                      if (limitField.value.length > limitNum) {
                                                          limitField.value = limitField.value.substring(0, limitNum);
                                                      } else {
                                                          limitCount.value = limitNum - limitField.value.length;
                                                      }
                                                  }
            </script>
    </body>


</html>