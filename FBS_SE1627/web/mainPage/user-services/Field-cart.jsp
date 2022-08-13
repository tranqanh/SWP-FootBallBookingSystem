<%@page import="dto.controllers.UserDTO"%>
<%@page import="dto.controllers.cartDTO"%>
<%@page import="dto.controllers.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Checkout Cart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href=" https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/field-cart.css">
    </head>

    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().trim().equals("US")) {
                response.sendRedirect("/FBS_SE1627/login_sigup/login.jsp");
                return;
            }
        %>

        <main class="page">
            <section class="shopping-cart dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Checkout Cart</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quam urna, dignissim nec auctor in,
                            mattis vitae leo.</p>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12 col-lg-8">
                                <div class="items">

                                    <%
                                        double total = 0;
                                        List<cartDTO> listCart = (List<cartDTO>) request.getAttribute("CART");
                                        if (listCart != null) {
                                            if (listCart.size() > 0) {

                                                for (cartDTO cart : listCart) {
                                                    total += cart.getPrice();


                                    %>

                                    <div class="product">
                                        <div class="row">
                                            <div class="col-md-3 mt-4">
                                                <img class="img-fluid mx-auto d-block image"
                                                     src="https://giathuanshop.com/wp-content/uploads/2019/05/order-la-gi-hang-order-pre-order-la-gi-640x380.png">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="info">
                                                    <div class="row">
                                                        <div class="col-md-5 field-name">
                                                            <div class="field-name">
                                                                <h5><%= cart.getSlotName()%></h5>
                                                                <div class="product-info">
                                                                    <div>#Order: <span class="value"><%= cart.getOrderID()%></span></div>
                                                                    <div>Date: <span class="value"><%= cart.getDateOrder()%></span></div>
                                                                    <div>Slots: <span class="value"><%= cart.getTimeStar()%>-<%= cart.getTimeEnd()%></span></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 price">
                                                            <span><%= cart.getPrice()%> VND</span>
                                                        </div>
                                                        <div class="col-md-3 remove mt-4">

                                                            <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
                                                                    <!--Content-->
                                                                    <div class="modal-content text-center">
                                                                        <!--Header-->
                                                                        <div class="modal-header d-flex justify-content-center">
                                                                            <p class="heading">Are you sure?</p>
                                                                        </div>
                                                                        <!--Body-->
                                                                        <div class="modal-body">
                                                                            <i class="fas fa-pulse fa-3x" style="color: red;">
                                                                                <img src="/FBS_SE1627/mainPage/user-services/images/Screenshot 2022-07-23 144051.png" style="width: 100px;">
                                                                            </i>
                                                                        </div>
                                                                        <!--Footer-->
                                                                        <div class="modal-footer flex-center">
                                                                            <a href="/FBS_SE1627/MainController?action=RemoveCart&UserID=<%= loginUser.getUserID()%>&OrderDetailID=<%= cart.getOrderDetailID()%>" class="btn  btn-outline-danger">Yes</a>
                                                                            <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">No</a>
                                                                        </div>
                                                                    </div>
                                                                    <!--/.Content-->
                                                                </div>
                                                            </div>

                                                            <button  data-toggle="modal" data-target="#modalConfirmDelete"class="btn btn-danger">Remove</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%        }

                                    %>
                                    <div class="col-md-12 col-lg-4">
                                        <div class="summary">
                                            <h3>Summary</h3>

                                            <div class="summary-item"><span class="text">Subtotal</span><span class="price"><%=total%>
                                                    VND</span></div>
                                            <div class="summary-item"><span class="text">Discount</span><span
                                                    class="price"><%= loginUser.getPoint()%> </span></div>
                                            <div class="summary-item"><span class="text">Total</span><span class="price"><%=total - loginUser.getPoint()%>
                                                    VND</span>
                                            </div>
                                            <a href="/FBS_SE1627/MainController?action=Pay&UserID=<%=loginUser.getUserID()%>" type="button" class="btn btn-primary btn-lg btn-block"
                                               style="margin-top: 20px;">
                                                Checkout
                                            </a>
                                        </div>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>

                                </div>
                            </div>
<!--                            <div class="col-md-12 col-lg-4">
                                <div class="summary">
                                    <h3>Summary</h3>

                                    <div class="summary-item"><span class="text">Subtotal</span><span class="price"><%=total%>
                                            VND</span></div>
                                    <div class="summary-item"><span class="text">Discount</span><span
                                            class="price"><%= loginUser.getPoint()%> </span></div>
                                    <div class="summary-item"><span class="text">Total</span><span class="price"><%=total - loginUser.getPoint()%>
                                            VND</span>
                                    </div>
                                    <a href="/FBS_SE1627/MainController?action=Pay&UserID=<%=loginUser.getUserID()%>" type="button" class="btn btn-primary btn-lg btn-block"
                                       style="margin-top: 20px;">
                                        Checkout
                                    </a>
                                </div>
                            </div>-->
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!--Modal: modalConfirmDelete-->

        <!--Modal: modalConfirmDelete-->

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>

</html>