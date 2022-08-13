<%@page import="dto.controllers.cartDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.controllers.UserDTO"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Payment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/payment.css">
    </head>

    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().trim().equals("US")) {
                response.sendRedirect("/FBS_SE1627/login_sigup/login.jsp");
                return;
            }
        %>

        <main class="page payment-page">
            <section class="payment-form dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Payment</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quam urna, dignissim nec auctor in, mattis
                            vitae leo.</p>
                    </div>

                    <form>
                        <div class="products">
                            <h3 class="title">Checkout</h3>
                            <%
                                double total = 0;
                                List<cartDTO> listCart = (List<cartDTO>) request.getAttribute("CART2");
                                if (listCart != null) {
                                    if (listCart.size() > 0) {
                                        for (cartDTO cart : listCart) {
                                            total += cart.getPrice();
                            %>
                            <div class="item">
                                <span class="price"><%= cart.getPrice()%> VND</span>
                                <p class="item-name"><%= cart.getDateOrder()%></p>
                                <p class="item-description"><%= cart.getTimeStar()%>-<%= cart.getTimeEnd()%></p>
                            </div>


                            <%        }
                                    }
                                }
                            %>
                            <div class="total">Total<span class="price"><%=total - loginUser.getPoint()%></span></div>
                        </div>
                        <div class="row ml-3 mt-4">
                            <div class="col-md-6">
                                <a href="/FBS_SE1627/MainController?action=Payment&UserID=<%=loginUser.getUserID()%>">
                                    <button type="button" class="btn btn-primary mb-4" id="back">
                                        Back
                                    </button>
                                </a>

                                <button type="button" class="btn btn-success ml-3 mb-4" id="confirm">
                                    Confirm
                                </button>
                            </div>
                        </div>
                        <div class="card-details" id="show" style="display: none;">
                            <h3 class="title">Payment Details</h3>
                            <div class="row">
                                <div class="card mt-4 col-6 col-md-12">
                                    <img style="margin-left: 400px;" class="card-img-top card-img-overlay" src="images/payment.png"
                                         alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Momo Payment</h5>
                                        <p class="card-text" style="color: red;">STK: 0976642068 </p>
                                        <p class="card-text">Name: NGUYEN HOANG CHIEN</p>
                                        <p class="card-text">Please transfer with the content as Phone + Order name </p>
                                    </div>
                                </div>
                                <div class="card mt-4 col-6 col-md-12">
                                    <img style="margin-left: 400px;" class="card-img-top card-img-overlay" src="images/pay-card.svg"
                                         alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Banking Online</h5>
                                        <p class="card-text" style="color: red;">STK: 0123 4567 8888 9999 </p>
                                        <p class="card-text">Bank: Tp Bank, Name: NGUYEN HOANG CHIEN</p>
                                        <p class="card-text">Please transfer with the content as Phone + Order name</p>
                                    </div>
                                </div>
                            </div>
                            <button type="button" data-toggle="modal" data-target="#modalPush" class="btn btn-danger">I had
                                transfered</button>
                        </div>

                    </form>
                </div>
            </section>
        </main>

        <!--Modal: modalPush-->
        <div class="modal fade" id="modalPush" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-notify modal-info" role="document">
                <!--Content-->
                <div class="modal-content text-center">
                    <!--Header-->
                    <div class="modal-header d-flex justify-content-center">
                        <h3 class="heading">Payment</h3>
                    </div>

                    <!--Body-->
                    <div class="modal-body">

                        <img src="/mainPage/user-services/images/paymemt1.png" style="width: 200px;">

                        <p>Please wait for 5 to 10 minutes for the yard owner to confirm</p>
                        <p>You can check your order at order status</p>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer flex-center">
                        <a href="/FBS_SE1627/mainPage/user.jsp" type="button" class="btn btn-outline-info waves-effect">Back to home</a>
                        <form action="MainController" method="POST">
                            <%
                                if (listCart.size() > 0) {
                                    int i = 0;
                                    for (cartDTO cart : listCart) {
                                        i++;
                            %>
                            <input type="hidden" name="List<%=i%>" value="<%=cart.getOrderDetailID()%>"/>
                            <%        }
                                }
                            %>
                            <input type="submit" name="action" value="Checkout"  class="btn btn-info"/>
                        </form>


                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>
        <!--Modal: modalPush-->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
            const btn_confirm = document.getElementById("confirm");
            const card = document.getElementById("show");
            const btn_back = document.getElementById("back");
            btn_confirm.onclick = function () {
                if (card.style.display !== "none") {
                    card.style.display = "none";
                } else {
                    card.style.display = "block";
                    btn_confirm.disabled = true;
                    btn_back.disabled = true;
                }
            }
        </script>
    </body>

</html>