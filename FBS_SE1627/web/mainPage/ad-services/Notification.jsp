<%@page import="dto.controllers.NotificationDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.controllers.UserDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Notification</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #299be4;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn {
            color: #566787;
            float: right;
            font-size: 13px;
            background: #fff;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn:hover,
        .table-title .btn:focus {
            color: #566787;
            background: #f2f2f2;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th,
        table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 50px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.settings {
            color: #2196F3;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .status {
            font-size: 30px;
            margin: 2px 2px 0 0;
            display: inline-block;
            vertical-align: middle;
            line-height: 10px;
        }

        .text-success {
            color: #10c469;
        }

        .text-info {
            color: #62c9e8;
        }

        .text-warning {
            color: #FFC107;
        }

        .text-danger {
            color: #ff5b5b;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a,
        .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 10px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

        .active,
        .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 18px;
            display: none;
            background-color: white;
            overflow: hidden;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
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
    %>
<body>
    <div class="container-xl">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-5">
                            <h2><b>Field Notification <i class="fa fa-bell" aria-hidden="true"></i></b></h2>
                        </div>
                        <div class="col-sm-7">
                            <a href="/FBS_SE1627/mainPage/admin.jsp" class="btn btn-secondary"><i class="fa fa-chevron-left"
                                    aria-hidden="true"></i>
                                <span>Back</span></a>
                            <button type="button" class="btn btn-info" data-toggle="modal"
                                data-target="#notificationModal">
                                <i class="fa fa-paper-plane" aria-hidden="true"> </i>Send Notification</button>

                        </div>
                    </div>
                </div>
                <%
                        List<NotificationDTO> listNotification = (List<NotificationDTO>) request.getAttribute("LIST_NOTIFICATION");
                        if (listNotification != null) {
                            if (listNotification.size() > 0) {
                                int endP = (Integer) request.getAttribute("endP");
                    %>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Notification</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                int count = 1;
                                for (NotificationDTO notification : listNotification) {
                            %>
                            
                        <tr>
                            <td><%= count++%></td>
                            <td>
                                <button class="accordion">Date: <%=notification.getDateNF()%> - Title: <%=notification.getTitle()%></button>
                                <div class="panel">
                                    <p><%=notification.getContent()%></p>
                                </div>
                            </td>
                            <td>
                                <a href="MainController?action=DeleteNotification&notificationID=<%=notification.getNotificationID()%>&offset=<%=offset%>"" class="delete" title="Delete" data-toggle="tooltip"><i
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
                            <li class="page-item"><a href="MainController?action=ReadNotification&offset=<%=pageN%>" class="page-link"><%= pageN++%></a></li>
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
    <div id="notificationModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">

                    <h4 class="modal-title">New Notification <i class="fa fa-bell" aria-hidden="true"></i></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group row">
                            <label for="title" class="col-md-3 col-form-label">Title</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="title" name="title"
                                    placeholder="Enter Notification Title" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="content" class="col-md-3 col-form-label">Your Notification</label>
                            <div class="col-md-9">
                                <textarea class="form-control" id="content" name="content" rows="12"
                                    required></textarea>
                            </div>
                        </div>
                        <div class="offset-md-2 col-md-10">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" name=action value=SendNotification class="btn btn-primary">Send Notification</button>
                        </div>

                    </form>
                </div>

            </div>
        </div>
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