<%@page import="dto.controllers.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.controllers.UserDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap User Management Data Table</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/order_confirm.css">
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
                            <h2>Order<b> Confirm</b></h2>
                        </div>
                        <div class="col-sm-7">
                            <a href="/FBS_SE1627/mainPage/admin.jsp" class="btn btn-secondary"><i class="fa fa-chevron-left" aria-hidden="true"></i>
                                <span>Back</span></a>
                        </div>
                    </div>
                </div>
                <%
                        List<OrderDetailDTO> listOrderDetail = (List<OrderDetailDTO>) request.getAttribute("LIST_ORDER_DETAIL");
                        if (listOrderDetail != null) {
                            if (listOrderDetail.size() > 0) {
                                int endP = (Integer) request.getAttribute("endP");
                        %>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>OrderDetailID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Price(VND)</th>
                            <th>Date Order</th>
                            <th>Slot ID</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Action</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                for (OrderDetailDTO orderDetail : listOrderDetail) {
                            %>
                        <tr>
                            <td><%=orderDetail.getOrderID()%></td>
                            <td><%=orderDetail.getOrderDetailID()%></td>
                            <td><%=orderDetail.getUserName()%></td>
                            <td><%=orderDetail.getPhone()%></td>
                            <td><%=orderDetail.getPrice()%></td>
                            <td><%=orderDetail.getDateOrder()%></td>
                            <td><%=orderDetail.getSlotID()%></td>
                            <td><%=orderDetail.getCategoryID()%></td>
                            <td><span class="status text-success">&bull;</span><%=orderDetail.getStandbyState()%></td>
                            <td>
                                <a href="MainController?action=OrderConfirm&DateOrder=<%=orderDetail.getDateOrder()%>&SlotID=<%=orderDetail.getSlotID()%>&CategoryID=<%=orderDetail.getCategoryID()%>&OrderDetailID=<%=orderDetail.getOrderDetailID()%>" class="settings" title="Accept" data-toggle="tooltip"><i
                                        class="material-icons">&#xe834</i></a>
                                <a href="MainController?action=OrderReject&DateOrder=<%=orderDetail.getDateOrder()%>&SlotID=<%=orderDetail.getSlotID()%>&CategoryID=<%=orderDetail.getCategoryID()%>&OrderDetailID=<%=orderDetail.getOrderDetailID()%>" class="delete" title="Denied" data-toggle="tooltip"><i
                                        class="material-icons">&#xE5C9;</i></a>
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
                            <li class="page-item"><a href="MainController?action=ReadListOrderConfirm&offset=<%=pageN%>&search=<%=search%>" class="page-link"><%= pageN++%></a></li>
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
        <%
            String error = (String) request.getAttribute("CN");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
        
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</body>

</html>