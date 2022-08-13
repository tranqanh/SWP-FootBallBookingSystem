<%@page import="dto.controllers.OderDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.controllers.UserDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>History</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/historyAd.css">
    </head>
    <%

        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
            response.sendRedirect("/FBS_SE1627/login_sigup/login.jsp");
            return;
        }

        String offset = request.getParameter("offset");
        if (offset == null) {
            offset = "0";
        }

        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }
    %>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2><b>Order History</b></h2>
                            </div>
                            <div class="col-sm-4">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="offset" value=1>
                                    <input type="text" name="search" required="" placeholder="Customer Name"/>
                                    <input type="submit" name="action" value="SearchOrderHistory"/>
                                </form>
                            </div>
                            <div class="col-sm-3">
                                
                                <a href="/FBS_SE1627/mainPage/admin.jsp" class="btn btn-secondary"><i class="fa fa-chevron-left"
                                                                                                      aria-hidden="true"></i>
                                    <span>Back</span></a>
                            </div>
                        </div>
                    </div>
                    <%
                        List<OderDTO> listOrder = (List<OderDTO>) request.getAttribute("LIST_ORDER");
                        if (listOrder != null) {
                            if (listOrder.size() > 0) {
                                int endP = (Integer) request.getAttribute("endP");
                    %>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Order ID</th>
                                <th>User ID</th>
                                <th>Field ID</th>
                                <th>View Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (OderDTO order : listOrder) {
                            %>
                            <tr>
                                <td>1</td>
                                <td><%=order.getOrderID()%></td>
                                <td><%=order.getUserID()%></td>
                                <td><%=order.getCategoryID()%></td>
                                <td>
                                    <button class="accordion">View</button>
                                    <div class="panel">
                                        <p>Customer Name: <%= order.getNameGuest()%>. Phone: <%= order.getPhone()%>.</p>
                                        <p>Total Slot: <%= order.getTottalSlot()%>. 
                                        </p>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    <div class="clearfix">

                        <ul class="pagination">
                            <% int pageN = 1;
                                while (pageN <= endP) {
                            %>
                            <li class="page-item"><a href="MainController?action=SearchOrderHistory&offset=<%=pageN%>&search=<%=search%>" class="page-link"><%= pageN++%></a></li>
                                <% }
                                %>
                        </ul>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
        </script>
    </body>

</html>